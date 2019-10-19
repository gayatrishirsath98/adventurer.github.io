using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_EmployeeImageHandler : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public class EmployeeImageHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string imageid = context.Request.QueryString["Id"];
            SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
            connection.Open();
            SqlCommand command = new SqlCommand("select Image from Employee where Id=" + imageid, connection);
            SqlDataReader dr = command.ExecuteReader();
            dr.Read();
            context.Response.BinaryWrite((Byte[])dr[0]);
            connection.Close();
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}