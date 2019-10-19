using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["agent_id"] != null)
        {
            Response.Redirect("Index.aspx");
        }
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM  tbl_agent WHERE (Email = '" + txt_email.Text.Trim() + "') AND (Password = '" + txt_password.Text.Trim() + "')");

        cmd.Connection = con;

        SqlDataReader dr;
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if (dr["Email"].ToString().Equals(txt_email.Text.Trim()) && dr["Password"].ToString().Equals(txt_password.Text.Trim()))
            {
                Session["agent_id"] = dr["Agent_id"].ToString();
                Session["agent_name"] = dr["Agent_name"].ToString();
                Session["email"] = dr["Email"].ToString();
                Session["password"] = dr["Password"].ToString();
                //Session["name"] = dr["Name"].ToString();
                //Session["email"] = dr["Email"].ToString();
                //Session["mobileno"] = dr["MobileNo"].ToString();
                //Session["image"] = dr["Image"].ToString();
                dr.Close();

                Response.Redirect("Index.aspx");
                Response.Write("<script>alert('Login Successfully..!')</script>");


            }

        }
        else
        {
            Response.Write("<script>alert('Invalid Login...')</script>");
        }

    }
}