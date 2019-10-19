using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Admin_EditAgent : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand com;
    protected void Page_Load(object sender, EventArgs e)
    {
        

        Displaydetail();
    }    
       
    void Displaydetail()
    {
        string agentid = Request.QueryString["code"];
        con.Open();
        string str = "select * from tbl_agent where Agent_id='" + agentid + "'";
        com = new SqlCommand(str, con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();

        da.Fill(ds);
        txt_name1.Text = ds.Tables[0].Rows[0]["Agent_name"].ToString();
        txt_area1.Text = ds.Tables[0].Rows[0]["Area"].ToString();
        txt_city1.Text = ds.Tables[0].Rows[0]["City"].ToString();
        txt_dist1.Text = ds.Tables[0].Rows[0]["District"].ToString();
        txt_state1.Text = ds.Tables[0].Rows[0]["State"].ToString();
        txt_password1.Text = ds.Tables[0].Rows[0]["Password"].ToString();
        //txt_cpassword1.Text = ds.Tables[0].Rows[0]["Password"].ToString();
        txt_email1.Text = ds.Tables[0].Rows[0]["Email"].ToString();
        txt_mobno1.Text = ds.Tables[0].Rows[0]["MobileNo"].ToString();
        //Image1 = "~/Admin/upload/id=" + agentid;
        //byte[] imagedata = (byte[])ds.Tables[0].Rows[0]["ImageName"];
        //string img = Convert.ToBase64String(imagedata, 0, imagedata.Length);
        // Image1 = "data:Admin/upload/agentimage;base64," + img;
        con.Close();

    }

    protected void btn_update_Click(object sender, EventArgs e)
    {

        string agentid = Request.QueryString["code"];
        string EmpImgName = Path.GetFileName(FileUpload1.PostedFile.FileName);
        FileUpload1.SaveAs(Server.MapPath("~/Admin/upload/agentimage/" + EmpImgName));
        con.Open();
        SqlCommand cmdupdate = new SqlCommand("Update tbl_agent SET Agent_name='" + txt_name1.Text + "', Area='" + txt_area1.Text + "', City='" + txt_city1.Text + "', District='" + txt_dist1.Text + "',State='" + txt_state1.Text + "', MobileNo='" + txt_mobno1.Text + "', Email='" + txt_email1.Text + "', Password='" + txt_password1.Text + "', Admin_id='" + Session["admin_id"].ToString() + "', ImageName='" + EmpImgName.ToString() + "', ImagePath='" + "~/ Admin/upload/agentimage/" + EmpImgName + "'where Agent_id= " + agentid + "", con);
       
        cmdupdate.CommandType = CommandType.Text;
        cmdupdate.ExecuteNonQuery();
        Response.Write("<script>alert('Update Successfully..!')</script>");
        //txt_cname.Text = "";
        //        txt_city.Text = "";
        //        txt_area.Text = "";
        //        txt_contact.Text = "";
        //        txt_email.Text = "";
        //        txt_aadhar.Text = "";
        //        comboBox1.Text = "";
        //  btn_update.Enabled = false;
        //  Response.Write("<script>alert('Error..!')</script>");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AgentDetails.aspx");
    }
}