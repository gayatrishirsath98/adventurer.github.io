using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class DisplayPackChannel : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        //// Image1.ImageUrl = "~/Admin/upload/agentimage/" + Convert.ToString(ds.Tables[0].Rows[0]["ImageName"].ToString());
        // con.Close();
        SqlDataAdapter sda = new SqlDataAdapter("select * from tbl_pack",con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        // Image1.ImageUrl = "~/Admin/upload/packimage/" + Convert.ToString(ds.Tables[0].Rows[0]["ImageName"].ToString());
        DataList1.DataSource = dt;
        DataList1.DataBind();



    }
   




    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //string packid = Request.QueryString["key"];
        //SqlDataAdapter sda = new SqlDataAdapter("select * from tbl_channel where Pack_id='"+packid+"'", con);
        //DataTable dt = new DataTable();
        //sda.Fill(dt);
        //// Image1.ImageUrl = "~/Admin/upload/packimage/" + Convert.ToString(ds.Tables[0].Rows[0]["ImageName"].ToString());
        //ListView2.DataSource = dt;
        //ListView2.DataBind();
    }



   
}