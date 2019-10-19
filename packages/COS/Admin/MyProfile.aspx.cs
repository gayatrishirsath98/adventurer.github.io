using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_MyProfile : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand com;
    protected void Page_Load(object sender, EventArgs e)
    {
        Displaydetail();
    }
    void Displaydetail()
    {
        con.Open();

        string str = "select * from tbl_Admin where Username='" + Session["username"] + "'";

        com = new SqlCommand(str, con);

        SqlDataAdapter da = new SqlDataAdapter(com);

        DataSet ds = new DataSet();

        da.Fill(ds);

        txt_name.Text = ds.Tables[0].Rows[0]["Name"].ToString();

        txt_username.Text = ds.Tables[0].Rows[0]["Username"].ToString();

        txt_password.Text = ds.Tables[0].Rows[0]["Password"].ToString();

        txt_email.Text = ds.Tables[0].Rows[0]["Email"].ToString();

        txt_mobno.Text = ds.Tables[0].Rows[0]["MobileNo"].ToString();
    }
}