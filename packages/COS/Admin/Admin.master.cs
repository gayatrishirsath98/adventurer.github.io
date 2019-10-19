using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand com;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        lbl_adminname.Text = "<b><font color=white>" + " " + "</font>" + "<b><font color=white>" + Session["name"] + "</font>";
    }

 
}
