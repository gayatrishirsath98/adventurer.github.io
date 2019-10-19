using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ArreawiseReport : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    // SqlCommand cmd;
    SqlDataAdapter adapt;
    DataSet ds = new DataSet();
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        btn_print.Visible = false; 
    }
    void aFillDropdownList()
    {
       
            con.Open();

            SqlCommand cmd = new SqlCommand("select Distinct District from tbl_agent", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataBind();
            con.Close();


        
    }

    void aFillDropdownList1()
    {
       
            con.Open();

            SqlCommand cmd = new SqlCommand("select Distinct City from tbl_agent", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DropDownList2.DataSource = dt;
            DropDownList2.DataBind();
            con.Close();


        
    }
    void cFillDropdownList()
    {
       
            con.Open();

            SqlCommand cmd = new SqlCommand("select Distinct  District from tbl_customer", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataBind();
            con.Close();
         


      
    }

    void cFillDropdownList1()
    {
       
            con.Open();

            SqlCommand cmd = new SqlCommand("select Distinct City from tbl_customer", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DropDownList2.DataSource = dt;
            DropDownList2.DataBind();
            con.Close();
           


        
    }

    void custgridbind()
    {
        con.Open();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        //dataGridView1.Columns.Add("SrNo", "Serial No");
        adapt = new SqlDataAdapter("select * from tbl_customer where District='"+DropDownList1.Text+"' AND City='"+DropDownList2.Text+"'", con);
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
    void agentgridbind()
    {
        con.Open();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        //dataGridView1.Columns.Add("SrNo", "Serial No");
        adapt = new SqlDataAdapter("select Agent_name,Area,City,District,MobileNo,Email from tbl_agent where District='" + DropDownList1.Text + "' AND City='" + DropDownList2.Text + "'", con);
        adapt.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        con.Close();
        int rowcnt = ds.Tables[0].Rows.Count;
        if (rowcnt > 0)
        {
            ds.Tables[0].Columns["Agent_name"].ColumnName = "Agent_name";
            ds.Tables[0].Columns["Area"].ColumnName = "Area";
            ds.Tables[0].Columns["City"].ColumnName = "City";
            ds.Tables[0].Columns["District"].ColumnName = "District";
            ds.Tables[0].Columns["MobileNo"].ColumnName = "MobileNo";
            ds.Tables[0].Columns["Email"].ColumnName = "Email";


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

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList3.Text == "Agent")
        {
            aFillDropdownList();
        
        }
         if (DropDownList3.Text == "Customer")
        {
            cFillDropdownList();
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList3.Text == "Agent")
        {
            aFillDropdownList1();

        }
        else if (DropDownList3.Text == "Customer")
        {
            cFillDropdownList1();
        }
     
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        if (DropDownList3.Text == "Agent")
        {
            agentgridbind();

        }
        else if (DropDownList3.Text == "Customer")
        {
            custgridbind();
        }
    }
}