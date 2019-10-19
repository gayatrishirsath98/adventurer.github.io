using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin_Login :  System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM  tbl_Admin WHERE (Username = '" + txt_username.Text.Trim() + "') AND (Password = '" + txt_password.Text.Trim() + "')");

        cmd.Connection = con;

        SqlDataReader dr;
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if (dr["Username"].ToString().Equals(txt_username.Text.Trim()) && dr["Password"].ToString().Equals(txt_password.Text.Trim()))
            {
                Session["admin_id"] = dr["Admin_id"].ToString();
                Session["username"] = dr["Username"].ToString();
                Session["password"] = dr["Password"].ToString();
                Session["name"] = dr["Name"].ToString();
                Session["email"] = dr["Email"].ToString();
                Session["mobileno"] = dr["MobileNo"].ToString();
                Session["image"] = dr["Image"].ToString();
                dr.Close();
            
                Response.Redirect("Home.aspx");
                Response.Write("<script>alert('Login Successfully..!')</script>");
               

            }

        }
        else
        {
            Response.Write("<script>alert('Invalid Login...')</script>");
        }


    }
}