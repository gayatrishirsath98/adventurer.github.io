using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

public partial class GraphicalReport : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
       
   
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadData();

        LoadDataPayment();
    }

    //orderdetails
    void LoadData()
    {
        DataTable dt = new DataTable();
      
        con.Open();
            SqlCommand cmd = new SqlCommand("select Pack_name,count(Order_id) as count from tbl_orderdetails,tbl_pack where tbl_orderdetails.Pack_id=tbl_pack.Pack_id group by Pack_name", con);
        SqlDataAdapter da= new SqlDataAdapter(cmd);
        da.Fill(dt);
        con.Close();
       
        string[] x = new string[dt.Rows.Count];
        int[] y = new int[dt.Rows.Count];

        for(int i=0;i<dt.Rows.Count;i++)
        {
            x[i] = dt.Rows[i][0].ToString();
            y[i] = Convert.ToInt32(dt.Rows[i][1]);
        }
        Chart1.Series[0].Points.DataBindXY(x, y);

        
        Chart1.Series[0].ChartType = SeriesChartType.Column;
        Chart1.Legends[0].Enabled = true;
        Chart1.ChartAreas["ChartArea1"].AxisX.Interval = 1;
    }

    //payment
    void LoadDataPayment()
    {
        DataTable dt = new DataTable();

        con.Open();
        SqlCommand cmd = new SqlCommand("select Pack_name,count(Order_id) as count from tbl_orderdetails,tbl_pack where tbl_orderdetails.Pack_id=tbl_pack.Pack_id group by Pack_name", con);
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
        Chart2.Series[0].Points.DataBindXY(x, y);


        Chart2.Series[0].ChartType = SeriesChartType.Pie;
        Chart2.Legends[0].Enabled = true;
    }
}