using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_Contactus : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand cmd;
    SqlDataAdapter adapt;
    protected void Page_Load(object sender, EventArgs e)
    {

    }  

    protected void btn_send_Click1(object sender, EventArgs e)
    {
        string query = "Insert into tbl_contact(Name,Email,Subject,Message) Values('" + this.txt_name.Text + "','" + this.txt_email.Text + "','" + this.txt_subject.Text + "','" + this.txt_message.Text + "')";
       
       con.Open();
        cmd = new SqlCommand(query, con);

        cmd.CommandText = query;

        cmd.ExecuteNonQuery();

        Response.Write("<script>alert('Message Send Successfully..!')</script>");
        con.Close();
    }
}