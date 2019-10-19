﻿using System;
using System.IO;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Collections.Specialized;
using System.Net.Mail;

public partial class Admin_NewAgentAdd : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand cmd;
    SqlDataAdapter adapt;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    void savedata()
    {
        cmd = new SqlCommand("Select * from tbl_agent where Email='" + txt_email.Text + "'", con);

        adapt = new SqlDataAdapter(cmd);
        adapt.Fill(ds);
        int i = ds.Tables[0].Rows.Count;
        if (i > 0)
        {
            
            Response.Write("<script>alert('Email Address " + txt_email.Text + " Already Exists')</script>");
            ds.Clear();
        }

        else
        {
            if (FileUpload1.PostedFile != null)
            {
                try
                {
                    string EmpImgName = Path.GetFileName(FileUpload1.PostedFile.FileName);

                    FileUpload1.SaveAs(Server.MapPath("~/Admin/upload/agentimage/" + EmpImgName));

                    //Image1.ImageUrl = "~/Admin/upload/agentimage/" + Path.GetFileName(FileUpload1.FileName);

                    con.Open();

                    string query = "Insert into tbl_agent(Agent_name,Area,City,District,State,MobileNo,Email,Password,Admin_id,ImageName,ImagePath) Values('" + this.txt_name.Text + "','" + this.txt_area.Text + "','" + this.txt_city.Text + "','" + this.txt_dist.Text + "','" + this.txt_state.Text + "','" + this.txt_mobno.Text + "','" + this.txt_email.Text + "','" + this.txt_password.Text + "','" + Session["admin_id"].ToString() + "','" + EmpImgName.ToString() + "','" + "~/ Admin/upload/agentimage/" + EmpImgName + "')";
                    cmd = new SqlCommand(query, con);
                    SqlDataReader dr;

                    dr = cmd.ExecuteReader();

                    sendmail();

                    Response.Write("<script>alert('Insert Successfully..!')</script>");
                    txt_name.Text = "";
                    txt_city.Text = "";
                    txt_area.Text = "";
                    txt_mobno.Text = "";
                    txt_email.Text = "";
                    txt_state.Text = "";
                    txt_dist.Text = "";
                    txt_email.Text = "";
                    txt_password.Text = "";
                    txt_cpassword.Text = "";


                    btn_save.Enabled = false;
                    con.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }

            }
        }
    }


    void sendmail()
    {
        if (txt_email.Text != "" && txt_name.Text != "")
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("adventurer2410@gmail.com", "Adventurer@0901");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Hi, " + txt_name.Text + "  Thanks for Register Adventurer Cable System..";
            msg.Body = "Hi " + txt_name.Text + ", Thanks For Your Registration at Adventurer Cable System, We will Provide You The Latest Update.Your Userid :"+txt_email.Text+" and  Password :"+txt_password.Text+"  Thanks (Note: This is a system generated email, hence please do not reply to this email)";
            string toaddress = txt_email.Text;
            msg.To.Add(toaddress);
            string fromaddress = "Adventurer Cable System <adventurer2410@gmail.com>";
            msg.From = new MailAddress(fromaddress);


            try
            {
                smtp.Send(msg);


            }
            catch
            {
                throw;
            }



        }
    }


    protected void btn_save_Click(object sender, EventArgs e)
    {
        savedata();
        string destinationaddr = "91" + txt_mobno.Text;
        string message = "Dear " + this.txt_name.Text + " , You Have Been Registered Successfully.. Your Userid :" + this.txt_email.Text + " & Password : " + this.txt_password.Text + " Thanks!!";

        String message1 = HttpUtility.UrlEncode(message);
        using (var wb = new WebClient())
        {
            byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
                {
                {"apikey" , "HkwpRpuYcOE-1Ls5piT4SikgUUTFWedzcplVkxMpz0"},
                {"numbers" , destinationaddr},
                {"message" , message1},
                {"sender" , "TXTLCL"}
                });
            string result = System.Text.Encoding.UTF8.GetString(response);

        }

    }

    





    protected void btn_discard_Click1(object sender, EventArgs e)
    {
        Response.Redirect("AgentDetails.aspx");
    }
}