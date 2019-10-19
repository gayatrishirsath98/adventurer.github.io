using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DailyReport : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand cmd;
    SqlDataAdapter adapt;
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["agent_id"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        DailyReport1();
        btn_print.Visible = false;
    }

    void DailyReport1()
    {
        DateTime today = DateTime.Now;
        string cdate = today.ToString("dd-MM-yyyy");
        con.Open();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        //dataGridView1.Columns.Add("SrNo", "Serial No");
        adapt = new SqlDataAdapter("select tbl_orderheader.Order_id,Order_date,tbl_customer.Cust_name,tbl_subscription.Sub_id,Duration,Total_amount from tbl_orderheader,tbl_orderdetails,tbl_pack,tbl_subscription,tbl_customer where tbl_orderdetails.Order_id=tbl_orderheader.Order_id AND tbl_orderdetails.Pack_id=tbl_pack.Pack_id  AND tbl_orderheader.Sub_id=tbl_subscription.Sub_id AND tbl_subscription.CustID=tbl_customer.Cust_id AND tbl_orderheader.Order_date='" + cdate + "'  AND Agent_id='" + Session["agent_id"].ToString() + "'", con);
        adapt.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        con.Close();
        int rowcnt = ds.Tables[0].Rows.Count;
        if (rowcnt > 0)
        {
            ds.Tables[0].Columns["Order_id"].ColumnName = "Order_id";
            ds.Tables[0].Columns["Order_date"].ColumnName = "Order_date";
            ds.Tables[0].Columns["Cust_name"].ColumnName = "Cust_name";
            ds.Tables[0].Columns["Sub_id"].ColumnName = "Sub_id";
            ds.Tables[0].Columns["Duration"].ColumnName = "Duration";

            GridView1.DataSource = ds.Tables[0];
            lbl_count.Text = rowcnt.ToString();
        }
        else
        {
            GridView1.DataSource = null;
            GridView1.DataSource = null;
            Response.Write("<script>alert('No Record Found ..!')</script>");
            btn_print.Enabled = false;
            lbl_count.Text = "";
        }

    }

    protected void btn_show_Click(object sender, EventArgs e)
    {
        con.Open();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        //dataGridView1.Columns.Add("SrNo", "Serial No");
        adapt = new SqlDataAdapter("select tbl_orderheader.Order_id,Order_date,tbl_customer.Cust_name,tbl_subscription.Sub_id,Duration,Total_amount from tbl_orderheader,tbl_orderdetails,tbl_pack,tbl_subscription,tbl_customer where tbl_orderdetails.Order_id=tbl_orderheader.Order_id AND tbl_orderdetails.Pack_id=tbl_pack.Pack_id  AND tbl_orderheader.Sub_id=tbl_subscription.Sub_id AND tbl_subscription.CustID=tbl_customer.Cust_id AND tbl_orderheader.Order_date='" + txt_date.Text + "'  AND Agent_id='" + Session["agent_id"].ToString() + "'", con);
        adapt.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        con.Close();
        int rowcnt = ds.Tables[0].Rows.Count;
        if (rowcnt > 0)
        {
            ds.Tables[0].Columns["Order_id"].ColumnName = "Order_id";
            ds.Tables[0].Columns["Order_date"].ColumnName = "Order_date";
            ds.Tables[0].Columns["Cust_name"].ColumnName = "Cust_name";
            ds.Tables[0].Columns["Sub_id"].ColumnName = "Sub_id";
            ds.Tables[0].Columns["Duration"].ColumnName = "Duration";

            GridView1.DataSource = ds.Tables[0];
            lbl_count.Text = rowcnt.ToString();
        }
        else
        {
            GridView1.DataSource = null;
            GridView1.DataSource = null;
            Response.Write("<script>alert('No Record Found ..!')</script>");
            btn_print.Enabled = false;
            lbl_count.Text ="";
        }

    }
    
}