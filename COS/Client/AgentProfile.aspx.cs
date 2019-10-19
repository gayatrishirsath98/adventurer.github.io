using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgentProfile : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand cmd;
    SqlDataAdapter adapt;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        Displaydetail();
    }
    void Displaydetail()
    {
        con.Open();
        string str = "select * from tbl_agent where Agent_id='" + Session["agent_id"] + "'";
        cmd = new SqlCommand(str, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        txt_name.Text = ds.Tables[0].Rows[0]["Agent_name"].ToString();
        txt_Area.Text = ds.Tables[0].Rows[0]["Area"].ToString();
        txt_City.Text = ds.Tables[0].Rows[0]["City"].ToString();
        txt_District.Text = ds.Tables[0].Rows[0]["District"].ToString();
        txt_State.Text = ds.Tables[0].Rows[0]["State"].ToString();
        txt_Mobile.Text = ds.Tables[0].Rows[0]["MobileNo"].ToString();
        txt_Email.Text = ds.Tables[0].Rows[0]["Email"].ToString();  
        Image1.ImageUrl = "~/Admin/upload/agentimage/" + Convert.ToString(ds.Tables[0].Rows[0]["ImageName"].ToString());
      
    }

    
   
}