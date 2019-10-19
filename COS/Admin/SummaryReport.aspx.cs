using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_SummaryReport : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    // SqlCommand cmd;
    SqlDataAdapter adapt;
    DataSet ds = new DataSet();
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        FillDropdownList();
        btn_print.Visible = false;
        
    }
    void FillDropdownList()
    {
        if (!Page.IsPostBack)
        {
            con.Open();
          
            SqlCommand cmd = new SqlCommand("select Agent_name from tbl_agent", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataBind();
            con.Close();      


        }

    }
   
    protected void btn_show_Click(object sender, EventArgs e)
    {
        if (rbtn_allcustomer.Checked)
        {
            con.Open();
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            //dataGridView1.Columns.Add("SrNo", "Serial No");
            adapt = new SqlDataAdapter("select tbl_customer.Cust_name,tbl_customer.Area,tbl_customer.City,tbl_customer.District,tbl_customer.State,tbl_customer.Mobile_No,tbl_customer.Email,Aadhar_No from tbl_customer,tbl_agent where tbl_agent.Agent_id=tbl_customer.Agent_id AND Agent_name='" + DropDownList1.Text+"' ", con);
            adapt.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
            int rowcnt = ds.Tables[0].Rows.Count;
            if (rowcnt > 0)
            {
                ds.Tables[0].Columns["Cust_name"].ColumnName = "Cust_name";
                ds.Tables[0].Columns["Area"].ColumnName = "Area";
                ds.Tables[0].Columns["City"].ColumnName = "City";
                ds.Tables[0].Columns["District"].ColumnName = "District";
                ds.Tables[0].Columns["Mobile_No"].ColumnName = "Mobile_No";
                ds.Tables[0].Columns["Email"].ColumnName = "Email";
                ds.Tables[0].Columns["Aadhar_No"].ColumnName = "Aadhar_No";

                GridView1.DataSource = ds.Tables[0];
                btn_print.Visible = true;
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataSource = null;
                Response.Write("<script>alert('No Record Found ..!')</script>");
                btn_print.Visible = false;
            }
        }
        else if (rbtn_orders.Checked)
        {
            con.Open();
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            //dataGridView1.Columns.Add("SrNo", "Serial No");
            adapt = new SqlDataAdapter("select Distinct tbl_orderheader.Order_id,Order_date,tbl_customer.Cust_name,tbl_subscription.Sub_id,Duration,Total_amount from tbl_orderheader,tbl_orderdetails,tbl_pack,tbl_subscription,tbl_customer,tbl_agent where tbl_orderdetails.Order_id=tbl_orderheader.Order_id AND tbl_orderdetails.Pack_id=tbl_pack.Pack_id  AND tbl_orderheader.Sub_id=tbl_subscription.Sub_id AND tbl_subscription.CustID=tbl_customer.Cust_id AND tbl_agent.Agent_id=tbl_customer.Agent_id AND Agent_name='" + DropDownList1.Text + "'", con);
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
                btn_print.Visible = true;
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataSource = null;
                Response.Write("<script>alert('No Record Found ..!')</script>");
                btn_print.Visible = false;
            }
        }
    }
}