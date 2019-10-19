using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand cmd;
    SqlDataAdapter adapt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["agent_id"] != null)
        { 
             Displaydetail();
        }
    }
    void Displaydetail()
    {
        con.Open();
        string str = "select * from tbl_agent where Agent_id='" + Session["agent_id"] + "'";
        cmd = new SqlCommand(str, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
       // txt_name.Text = ds.Tables[0].Rows[0]["Agent_name"].ToString();
       
        //Image1.ImageUrl = "~/Admin/upload/agentimage/" + Convert.ToString(ds.Tables[0].Rows[0]["ImageName"].ToString());

    }
}
