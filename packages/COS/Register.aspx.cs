using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MSCaptcha;
using System.Net;
using System.Data;
using System.Collections.Specialized;


public partial class Register : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand cmd;
    SqlDataAdapter adapt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillCapctha();
        }
        if (Session["agent_id"] == null)
        {
            Response.Redirect("Login.aspx");
        }


    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        //string destinationaddr = "91" + txt_contact.Text;
        //string message = "Hi " + txt_name.Text + " , You Have Been Registered For The Contest. Thanks!!";

        //String message1 = HttpUtility.UrlEncode(message);
        //using (var wb = new WebClient())
        //{
        //    byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
        //        {
        //        {"apikey" , "HkwpRpuYcOE-1Ls5piT4SikgUUTFWedzcplVkxMpz0"},
        //        {"numbers" , destinationaddr},
        //        {"message" , message1},
        //        {"sender" , "TXTLCL"}
        //        });
        //    string result = System.Text.Encoding.UTF8.GetString(response);
            savedata();



       // }
    }
    public void savedata()
    {
        if (Session["captcha"].ToString() == txtCaptcha.Text)
        {
            string query = "Insert into tbl_customer(Cust_name,Area,City,District,State,Mobile_No,Email,Aadhar_No,Agent_id) Values('" + this.txt_name.Text + "','" + this.txt_area.Text + "','" + this.txt_city.Text + "','" + this.txt_district.Text + "','" + this.txt_state.Text + "','" + this.txt_contact.Text + "','" + this.txt_email.Text + "','" + this.txt_aadhar.Text + "','" + Session["agent_id"].ToString() + "')";


            con.Open();
            cmd = new SqlCommand(query, con);

            cmd.CommandText = query;

            cmd.ExecuteNonQuery();

            txt_name.Text = "";
            txt_area.Text = "";
            txt_city.Text = "";
            txt_district.Text = "";
            txt_state.Text = "";
            txt_email.Text = "";
            txt_contact.Text = "";
            txt_aadhar.Text = "";
            txtCaptcha.Text = "";
            Response.Write("<script>alert('Insert Successfully..!')</script>");
            con.Close();
        }
        else
        {
            lblErrorMsg.Text = "Invalid Captcha Code";
        }


    }

    

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        FillCapctha();
    }

    void FillCapctha()
    {
        try
        {
            Random random = new Random();
            string combination = "!@#$%^&*()+-0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            StringBuilder captcha = new StringBuilder();
            for (int i = 0; i < 6; i++)
                captcha.Append(combination[random.Next(combination.Length)]);
            Session["captcha"] = captcha.ToString();
            imgCaptcha.ImageUrl = "GenerateCap.aspx?" + DateTime.Now.Ticks.ToString();
        }
        catch
        {
            throw;
        }
    }

    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        txt_name.Text = "";
        txt_area.Text = "";
        txt_city.Text = "";
        txt_district.Text = "";
        txt_state.Text = "";
        txt_email.Text = "";
        txt_contact.Text = "";
        txt_aadhar.Text = "";
        txtCaptcha.Text = "";
    }
}