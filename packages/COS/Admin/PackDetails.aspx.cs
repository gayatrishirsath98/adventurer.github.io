using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_PackDetails : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    // SqlCommand cmd;
    //SqlDataAdapter adapt;
    SqlCommand cmd = new SqlCommand();

    DataSet ds = new DataSet();
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
        SqlCommand cmd = new SqlCommand("Select Pack_id,Pack_name,Pack_prize,Pack_type,Totalchannels,Details from tbl_pack", conn);
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

    protected void btn_addpack_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddNewPack.aspx");

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string packname = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "Pack_name"));
            LinkButton lnk = (LinkButton)e.Row.FindControl("LinkButton1");
            lnk.Attributes.Add("OnClick", "JavaScript:return ConfirmationBox('" + packname + "')");
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lnk = sender as LinkButton;
        GridViewRow gridRow = lnk.NamingContainer as GridViewRow;
        int packid = Convert.ToInt32(GridView1.DataKeys[gridRow.RowIndex].Value.ToString());
        conn.Open();
        cmd.CommandText = "delete from tbl_pack where Pack_id='" + packid + "'";
        cmd.Connection = conn;
        int a = cmd.ExecuteNonQuery();
        conn.Close();
        if (a > 0)
        {
            gvbind();

        }
    }
}