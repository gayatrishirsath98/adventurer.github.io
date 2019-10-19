using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

public partial class Admin_Home : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand cmd;
   // SqlDataAdapter adapt;
    protected void Page_Load(object sender, EventArgs e)
    {
        countagent();
        countpack();
        countchannel();
        countorder();

        LoadData();
    }

    void countagent()
    {
        con.Open();

        string query = "SELECT COUNT(*) As Count FROM tbl_agent";
        cmd = new SqlCommand(query, con);
       // SqlDataReader dr = new SqlDataReader();

       
        object o = cmd.ExecuteScalar();
        if (o != null)
        {
            lbl_countagent.Text = " " + o.ToString();
        }
        con.Close();

       
    }
    void countorder()
    {
        con.Open();

        string query = "SELECT COUNT(*) As Count FROM tbl_orderheader";
        cmd = new SqlCommand(query, con);
        // SqlDataReader dr = new SqlDataReader();


        object o = cmd.ExecuteScalar();
        if (o != null)
        {
            lbl_order.Text = " " + o.ToString();
        }
        con.Close();


    }
    void countpack()
    {
        con.Open();

        string query = "SELECT COUNT(*) As Count FROM tbl_pack";
        cmd = new SqlCommand(query, con);
        // SqlDataReader dr = new SqlDataReader();


        object o = cmd.ExecuteScalar();
        if (o != null)
        {
            lbl_packcount.Text = " " + o.ToString();
        }
        con.Close();


    }
    void countchannel()
    {
        con.Open();

        string query = "SELECT COUNT(*) As Count FROM tbl_channel";
        cmd = new SqlCommand(query, con);
        // SqlDataReader dr = new SqlDataReader();


        object o = cmd.ExecuteScalar();
        if (o != null)
        {
            lbl_channelcount.Text = " " + o.ToString();
        }
        con.Close();


    }

    //orderdetails
    void LoadData()
    {
        
      
        DataTable dt = new DataTable();
        con.Open();
        SqlCommand cmd = new SqlCommand("select Order_date,count(Order_id) as Count from tbl_orderheader group by Order_date", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        con.Close();

        string[] x = new string[dt.Rows.Count];
        int[] y = new int[dt.Rows.Count];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            x[i] = dt.Rows[i][0].ToString();
            y[i] = Convert.ToInt32(dt.Rows[i][1]);
        }
        Chart1.Series[0].Points.DataBindXY(x, y);


        Chart1.Series[0].ChartType = SeriesChartType.Column;
        Chart1.Legends[0].Enabled = true;
        Chart1.ChartAreas["ChartArea1"].AxisX.Interval = 0.5;
        //Chart1.Legends["Default"].IsTextAutoFit = true;
        //Chart1.Legends["Default"].MaximumAutoSize = 100;
    }

}