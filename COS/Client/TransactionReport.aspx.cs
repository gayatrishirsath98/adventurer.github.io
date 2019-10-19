using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TransactionReport : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand cmd;
    SqlDataAdapter adapt;
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        btn_print.Visible = false;
    }


    protected void btn_show_Click(object sender, EventArgs e)
    {

        if (rbtn_all.Checked)
        {
            con.Open();
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            //dataGridView1.Columns.Add("SrNo", "Serial No");
            adapt = new SqlDataAdapter("select Transation_id, tbl_orderheader.Order_id,tbl_customer.Cust_name,tbl_payment.Date,Total_amount, Mode,Status from tbl_payment,tbl_orderheader,tbl_customer where tbl_payment.Order_id=tbl_orderheader.Order_id AND tbl_orderheader.CustomerID=tbl_customer.Cust_id  And Agent_id='" + Session["agent_id"].ToString() + "' AND Order_date>='" + txt_fromdate.Text + "' AND Order_date <='" + txt_todate.Text + "'", con);
            adapt.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
            int rowcnt = ds.Tables[0].Rows.Count;
            if (rowcnt > 0)
            {
                ds.Tables[0].Columns["Transation_id"].ColumnName = "Transation_id";
                ds.Tables[0].Columns["Order_id"].ColumnName = "Order_id";
                ds.Tables[0].Columns["Cust_name"].ColumnName = "Cust_name";
                ds.Tables[0].Columns["Date"].ColumnName = "Date";
                ds.Tables[0].Columns["Total_amount"].ColumnName = "Total_amount";
                ds.Tables[0].Columns["Mode"].ColumnName = "Mode";
                ds.Tables[0].Columns["Status"].ColumnName = "Status";

                GridView1.DataSource = ds.Tables[0];
                btn_print.Visible = true;
                lbl_count.Text = rowcnt.ToString();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataSource = null;
                Response.Write("<script>alert('No Record Found ..!')</script>");
                btn_print.Visible = false;
                lbl_count.Text = "";
            }
        }
        else if (rbtn_success.Checked)
        {
            con.Open();
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            //dataGridView1.Columns.Add("SrNo", "Serial No");
            adapt = new SqlDataAdapter("select Transation_id, tbl_orderheader.Order_id,tbl_customer.Cust_name,tbl_payment.Date,Total_amount, Mode,Status from tbl_payment,tbl_orderheader,tbl_customer where tbl_payment.Order_id=tbl_orderheader.Order_id AND tbl_orderheader.CustomerID=tbl_customer.Cust_id  AND Status='Success' And Agent_id='" + Session["agent_id"].ToString() + "' AND Order_date>='" + txt_fromdate.Text + "' AND Order_date <='" + txt_todate.Text + "'", con);
            adapt.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
            int rowcnt = ds.Tables[0].Rows.Count;
            if (rowcnt > 0)
            {
                ds.Tables[0].Columns["Transation_id"].ColumnName = "Transation_id";
                ds.Tables[0].Columns["Order_id"].ColumnName = "Order_id";
                ds.Tables[0].Columns["Cust_name"].ColumnName = "Cust_name";
                ds.Tables[0].Columns["Date"].ColumnName = "Date";
                ds.Tables[0].Columns["Total_amount"].ColumnName = "Total_amount";
                ds.Tables[0].Columns["Mode"].ColumnName = "Mode";
                ds.Tables[0].Columns["Status"].ColumnName = "Status";

                GridView1.DataSource = ds.Tables[0];
                btn_print.Visible = true;
                lbl_count.Text = rowcnt.ToString();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataSource = null;
                Response.Write("<script>alert('No Record Found ..!')</script>");
                btn_print.Visible = false;
                lbl_count.Text = "";
            }
        }
        else if (rbtn_failure.Checked)
        {
            con.Open();
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            //dataGridView1.Columns.Add("SrNo", "Serial No");
            adapt = new SqlDataAdapter("select Transation_id, tbl_orderheader.Order_id,tbl_customer.Cust_name,tbl_payment.Date,Total_amount, Mode,Status from tbl_payment,tbl_orderheader,tbl_customer where tbl_payment.Order_id=tbl_orderheader.Order_id AND tbl_orderheader.CustomerID=tbl_customer.Cust_id  AND Status='Failed' And Agent_id='" + Session["agent_id"].ToString() + "' AND Order_date>='" + txt_fromdate.Text + "' AND Order_date <='" + txt_todate.Text + "'", con);
            adapt.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
            int rowcnt = ds.Tables[0].Rows.Count;
            if (rowcnt > 0)
            {
                ds.Tables[0].Columns["Transation_id"].ColumnName = "Transation_id";
                ds.Tables[0].Columns["Order_id"].ColumnName = "Order_id";
                ds.Tables[0].Columns["Cust_name"].ColumnName = "Cust_name";
                ds.Tables[0].Columns["Date"].ColumnName = "Date";
                ds.Tables[0].Columns["Total_amount"].ColumnName = "Total_amount";
                ds.Tables[0].Columns["Mode"].ColumnName = "Mode";
                ds.Tables[0].Columns["Status"].ColumnName = "Status";

                GridView1.DataSource = ds.Tables[0];
                btn_print.Visible = true;
                lbl_count.Text = rowcnt.ToString();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataSource = null;
                Response.Write("<script>alert('No Record Found ..!')</script>");
                btn_print.Visible = false;
                lbl_count.Text = "";
            }
        }
       else if (rbtn_offline.Checked)
        {
            con.Open();
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            adapt = new SqlDataAdapter("select Transation_id, tbl_orderheader.Order_id,tbl_customer.Cust_name,tbl_payment.Date,Total_amount, Mode,Status from tbl_payment,tbl_orderheader,tbl_customer where tbl_payment.Order_id=tbl_orderheader.Order_id AND tbl_orderheader.CustomerID=tbl_customer.Cust_id  AND Mode='Offline' And Agent_id='" + Session["agent_id"].ToString() + "' AND Order_date>='" + txt_fromdate.Text + "' AND Order_date <='" + txt_todate.Text + "'", con);
            adapt.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
            int rowcnt = ds.Tables[0].Rows.Count;
            if (rowcnt > 0)
            {
                ds.Tables[0].Columns["Transation_id"].ColumnName = "Transation_id";
                ds.Tables[0].Columns["Order_id"].ColumnName = "Order_id";
                ds.Tables[0].Columns["Cust_name"].ColumnName = "Cust_name";
                ds.Tables[0].Columns["Date"].ColumnName = "Date";
                ds.Tables[0].Columns["Total_amount"].ColumnName = "Total_amount";
                ds.Tables[0].Columns["Mode"].ColumnName = "Mode";
                ds.Tables[0].Columns["Status"].ColumnName = "Status";

                GridView1.DataSource = ds.Tables[0];
                btn_print.Visible = true;
                lbl_count.Text = rowcnt.ToString();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataSource = null;
                Response.Write("<script>alert('No Record Found ..!')</script>");
                btn_print.Visible = false;
                lbl_count.Text = "";
            }
        }
        else if (rbtn_online.Checked)
        {
            con.Open();
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            //dataGridView1.Columns.Add("SrNo", "Serial No");
            adapt = new SqlDataAdapter("select Transation_id, tbl_orderheader.Order_id,tbl_customer.Cust_name,tbl_payment.Date,Total_amount, Mode,Status from tbl_payment,tbl_orderheader,tbl_customer where tbl_payment.Order_id=tbl_orderheader.Order_id AND tbl_orderheader.CustomerID=tbl_customer.Cust_id  AND Mode='Online' And Agent_id='" + Session["agent_id"].ToString() + "' AND Order_date>='" + txt_fromdate.Text + "' AND Order_date <='" + txt_todate.Text + "'", con);
            adapt.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
            int rowcnt = ds.Tables[0].Rows.Count;
            if (rowcnt > 0)
            {
                ds.Tables[0].Columns["Transation_id"].ColumnName = "Transation_id";
                ds.Tables[0].Columns["Order_id"].ColumnName = "Order_id";
                ds.Tables[0].Columns["Cust_name"].ColumnName = "Cust_name";
                ds.Tables[0].Columns["Date"].ColumnName = "Date";
                ds.Tables[0].Columns["Total_amount"].ColumnName = "Total_amount";
                ds.Tables[0].Columns["Mode"].ColumnName = "Mode";
                ds.Tables[0].Columns["Status"].ColumnName = "Status";

                GridView1.DataSource = ds.Tables[0];
                btn_print.Visible = true;
                lbl_count.Text = rowcnt.ToString();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataSource = null;
                Response.Write("<script>alert('No Record Found ..!')</script>");
                btn_print.Visible = false;
                lbl_count.Text ="";
            }
        }
    }
}

    
