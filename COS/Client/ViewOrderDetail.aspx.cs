using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewOrderDetail : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand cmd;
    SqlDataAdapter adapt;
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        Bindgrid();
    }

    void Bindgrid()
    {   
        con.Open();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        //dataGridView1.Columns.Add("SrNo", "Serial No");
        adapt = new SqlDataAdapter("select tbl_pack.Pack_name,Pack_type,Pack_prize,Totalchannels from tbl_orderdetails,tbl_pack where tbl_orderdetails.Pack_id=tbl_pack.Pack_id AND Order_id='" + Request.QueryString["code"].ToString() + "'", con);
        adapt.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        con.Close();
        int rowcnt = ds.Tables[0].Rows.Count;
        if (rowcnt > 0)
        {
            ds.Tables[0].Columns["Pack_name"].ColumnName = "Pack_name";
            ds.Tables[0].Columns["Pack_type"].ColumnName = "Pack_type";
            ds.Tables[0].Columns["Pack_prize"].ColumnName = "Pack_prize";
            ds.Tables[0].Columns["Totalchannels"].ColumnName = "Totalchannels";
         //   ds.Tables[0].Columns["Duration"].ColumnName = "Duration";

            GridView1.DataSource = ds.Tables[0];
        }
        else
        {
            GridView1.DataSource = null;
            GridView1.DataSource = null;
            Response.Write("<script>alert('No Record Found..!')</script>");
        }

    }

    protected void btn_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("Packwise.aspx");
    }
}