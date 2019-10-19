using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_DeleteChannel : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand com;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            string channelid = Request.QueryString["code"];

            SqlCommand cmddel = new SqlCommand("Delete tbl_channel where Channel_id=" + channelid + "", con);
            con.Open();
            cmddel.CommandType = CommandType.Text;


            cmddel.ExecuteNonQuery();
            Response.Write("<script>alert('Delete Successfully..!')</script>");
            // 
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(ex.message)</script>");
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();

            }

        }
        Response.Redirect("ChannelDetails.aspx");
    }
}