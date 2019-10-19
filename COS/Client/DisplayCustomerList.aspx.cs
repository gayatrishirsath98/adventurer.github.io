using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DisplayCustomerList : System.Web.UI.Page
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
        btn_print.Visible = false;

        Bindgrid();
    }

    void Bindgrid()
    {

        con.Open();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        //dataGridView1.Columns.Add("SrNo", "Serial No");
        adapt = new SqlDataAdapter("select Cust_name,Area,City,District,State,Mobile_No,Email,Aadhar_No from tbl_customer where Agent_id='" + Session["agent_id"].ToString() + "'", con);
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
            ds.Tables[0].Columns["State"].ColumnName = "State";
            ds.Tables[0].Columns["Mobile_No"].ColumnName = "Mobile_No";
            ds.Tables[0].Columns["Email"].ColumnName = "Email";
            ds.Tables[0].Columns["Aadhar_No"].ColumnName = "Aadhar_No";


            GridView1.DataSource = ds.Tables[0];
            btn_print.Visible = true;
            countcustomer();
        }
        else
        {
            GridView1.DataSource = null;
            GridView1.DataSource = null;
            Response.Write("<script>alert('No Record Found ..!')</script>");
            btn_print.Visible = false;
        }

    }
    void countcustomer()
    {
        con.Open();

        string query = "SELECT COUNT(*) As Count FROM tbl_customer where Agent_id='"+Session["agent_id"]+"'";
        cmd = new SqlCommand(query, con);
        // SqlDataReader dr = new SqlDataReader();


        object o = cmd.ExecuteScalar();
        if (o != null)
        {
            lbl_count.Text = " " + o.ToString();
        }
        con.Close();


    }


}