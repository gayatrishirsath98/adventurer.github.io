using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_DeleteAgent : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand com;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            string agentid = Request.QueryString["code"];

            SqlCommand cmddel = new SqlCommand("Delete tbl_agent where Agent_id=" + agentid + "", con);
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
        Response.Redirect("AgentDetails.aspx");

    }

   

    protected void OnConfirm(object sender, EventArgs e)
    {
      
        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            //this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked YES!')", true);
           
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked NO!')", true);
        }
    }
}