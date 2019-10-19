using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_details : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
   // SqlCommand cmd;
    //SqlDataAdapter adapt;
    DataSet ds = new DataSet();
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gvbind();
        }

    }

    public void gvbind()
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("Select Agent_id,Admin_id,Agent_name,Area,City,District,State,MobileNo,Email,Password from tbl_agent", conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        conn.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
            //getimage();
        }
        else
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            GridView1.DataSource = ds;
            GridView1.DataBind();
            int columncount = GridView1.Rows[0].Cells.Count;
            GridView1.Rows[0].Cells.Clear();
            GridView1.Rows[0].Cells.Add(new TableCell());
            GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
            GridView1.Rows[0].Cells[0].Text = "No Records Found";
        }
    }
    


    protected void btn_addagent_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddNewAgent.aspx");
    }

   

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType==DataControlRowType.DataRow)
        {
            string agentname = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "Agent_name"));
            LinkButton lnk = (LinkButton)e.Row.FindControl("LinkButton1");
            lnk.Attributes.Add("OnClick", "JavaScript:return ConfirmationBox('"+ agentname + "')");
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lnk = sender as LinkButton;
        GridViewRow gridRow = lnk.NamingContainer as GridViewRow;
        int agentid = Convert.ToInt32(GridView1.DataKeys[gridRow.RowIndex].Value.ToString());
        conn.Open();
        cmd.CommandText = "delete from tbl_agent where Agent_id='" + agentid + "'";
        cmd.Connection = conn;
        int a = cmd.ExecuteNonQuery();
        conn.Close();
        if (a > 0)
        {
            gvbind();
           
        }
    }
}
