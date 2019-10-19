using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChannelDetails : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    // SqlCommand cmd;
    //SqlDataAdapter adapt;
    SqlCommand cmd = new SqlCommand();

    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        gvbind();
    }

    public void gvbind()
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("Select tbl_channel.Channel_id,Channel_name,Channel_prize,Language,tbl_channel.Details,tbl_pack.Pack_name from tbl_channel,tbl_pack where tbl_channel.Pack_id=tbl_pack.Pack_id", conn);
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

    protected void btn_addchannel_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddNewChannel.aspx");
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string channelname = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "Channel_name"));
            LinkButton lnk = (LinkButton)e.Row.FindControl("LinkButton1");
            lnk.Attributes.Add("OnClick", "JavaScript:return ConfirmationBox('" + channelname + "')");
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lnk = sender as LinkButton;
        GridViewRow gridRow = lnk.NamingContainer as GridViewRow;
        int channelid = Convert.ToInt32(GridView1.DataKeys[gridRow.RowIndex].Value.ToString());
        conn.Open();
        cmd.CommandText = "delete from tbl_channel where Channel_id='" + channelid + "'";
        cmd.Connection = conn;
        int a = cmd.ExecuteNonQuery();
        conn.Close();
        if (a > 0)
        {
            gvbind();

        }
    }

   
}