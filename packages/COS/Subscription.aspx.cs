using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Subscription : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand cmd;
    SqlDataAdapter adapt;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["agent_id"] == null)
          {
              Response.Redirect("Login.aspx");
           }


            displaySubid();
        FillCombo();
        DateTime now = DateTime.Now;
        txt_currentdate.Text = "";
        txt_currentdate.Text = DateTime.Now.ToString("dd-MM-yyyy");
    }

    void FillCombo()
    {

        if (!Page.IsPostBack)
        {
            con.Open();
            //SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
            SqlCommand cmd = new SqlCommand("select Cust_name from tbl_customer where Agent_id='"+Session["agent_id"].ToString()+"'",con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            cust_name.DataSource = dt;
            cust_name.DataBind();
            con.Close();
            //displayid();
        }
    }
    //display order detail id
    void displaySubid()
    {
        int a;
        con.Open();

        string query1 = "Select Max(Sub_id) from tbl_subscription";

        cmd = new SqlCommand(query1, con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            string val = dr[0].ToString();
            if (val == "")
            {
                lbl_subid.Text = "1";
            }
            else
            {
                a = Convert.ToInt32(dr[0].ToString());
                a = a + 1;
                lbl_subid.Text = a.ToString();
            }
        }

        con.Close();
       
    }


    protected void cust_name_SelectedIndexChanged(object sender, EventArgs e)
    {
        cmd = new SqlCommand("select * from tbl_customer where Cust_name='" + cust_name.Text + "'", con);
        con.Close();
        con.Open();
        cmd.ExecuteNonQuery();
        SqlDataReader dr;
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            string custid = (string)dr["Cust_id"].ToString();
            txt_custid.Text = custid;


        }
        con.Close();
        //AssignlastSubscription();
    }


    //last subscription date retrive
    //void AssignlastSubscription()
    //{
    //    cmd = new SqlCommand("select top 1 Sub_todate,Sub_fromdate,Sub_date from tbl_subscription where CustID='"+ txt_custid.Text + "' order by Sub_id desc", con);
    //    con.Close();
    //    con.Open();
    //    cmd.ExecuteNonQuery();
    //    SqlDataReader dr;
    //    dr = cmd.ExecuteReader();
    //    while (dr.Read())
    //    {
    //        string Sub_fromdate = (string)dr["Sub_fromdate"].ToString();
    //        lbl_check1_fromdate.Text = Sub_fromdate;
    //        string Sub_todate = (string)dr["Sub_todate"].ToString();
    //        lbl_check2_todate.Text = Sub_todate;


    //    }
    //}





    protected void btn_save_Click(object sender, EventArgs e)
    {
       // already subscription exit
        DataSet ds = new DataSet();
        cmd = new SqlCommand("select * from tbl_subscription where CustID='" + txt_custid.Text + "' and  Sub_fromdate>='" + txt_fromdate.Text + "' and Sub_todate<='" + txt_todate.Text + "'", con);
        adapt = new SqlDataAdapter(cmd);
        adapt.Fill(ds);
        int i = ds.Tables[0].Rows.Count;
        if (i > 0)
        {
            // Response.Write("<script>alert('Pack Name " + DropDownList3.Text + " Already Selected..!')</script>");
            lbl_sms.ForeColor = System.Drawing.Color.RosyBrown;
            lbl_sms.Text = "Subscription Already Exist ";
            ds.Clear();
            // DisplayData1();

        }

        //int lbl_ch_fdate = Convert.ToInt32(lbl_check1_fromdate.Text);
        //int lbl_ch_tdate = Convert.ToInt32(lbl_check2_todate.Text);
        //int txt_fdate= Convert.ToInt32(txt_fromdate.Text);
        //int txt_tdate = Convert.ToInt32(txt_todate.Text);

        //Response.Write(lbl_ch_fdate);
        //Response.Write(lbl_ch_tdate);
        //Response.Write(txt_tdate);
        //Response.Write(txt_fdate);


        //if (txt_fromdate.Text !="")
        //{
        //    int lbl_ch_fdate = Convert.ToInt32(Convert.ToString(lbl_check1_fromdate.Text));
        //    int lbl_ch_tdate = Convert.ToInt32(Convert.ToString(lbl_check2_todate.Text));
        //    int txt_fdate = Convert.ToInt32(Convert.ToString(txt_fromdate.Text));
        //    int txt_tdate = Convert.ToInt32(Convert.ToString(txt_todate.Text));

        //    if(lbl_ch_fdate<= txt_fdate && lbl_ch_tdate >= txt_tdate)
        //    { 
        //        lbl_sms.ForeColor = System.Drawing.Color.RosyBrown;
        //        lbl_sms.Text = "Subscription Already Exist ";
        //    }
        //}
        else
        {

        string query = "Insert into tbl_subscription(Sub_date,Sub_todate,Sub_fromdate,CustID,AgentID,Duration) Values('" + this.txt_currentdate.Text + "','" + this.txt_todate.Text + "','" + this.txt_fromdate.Text + "','" + this.txt_custid.Text + "','" + Session["Agent_id"].ToString() + "','" + this.DropDownList1.Text + "')";
            con.Open();
            cmd = new SqlCommand(query, con);
            cmd.CommandText = query;
            cmd.ExecuteNonQuery();
            txt_currentdate.Text = "";
            txt_todate.Text = "";
            txt_fromdate.Text = "";
            txt_custid.Text = "";  
            Response.Write("<script>alert('Insert Successfully..!')</script>");
            Response.Redirect("Order.aspx?SubID="+ lbl_subid.Text );
          con.Close();
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
            DateTime today = DateTime.Now;
            txt_fromdate.Text = today.ToString("dd-MM-yyyy");

            if (DropDownList1.Text == "1 Month")
            {
                txt_todate.Text = "";
                DateTime ToDate = today.AddMonths(1);
                txt_todate.Text += ToDate.ToString("dd-MM-yyyy");


            }

            if (DropDownList1.Text == "3 Month")
            {
                txt_todate.Text = "";
                DateTime ToDate = today.AddMonths(3);
                txt_todate.Text += ToDate.ToString("dd-MM-yyyy");

            }
            if (DropDownList1.Text == "6 Month")
            {
                txt_todate.Text = "";
                DateTime ToDate = today.AddMonths(6);
                txt_todate.Text += ToDate.ToString("dd-MM-yyyy");
            }
            if (DropDownList1.Text == "1 Year")
            {
                txt_todate.Text = "";
                DateTime ToDate = today.AddMonths(12);
                txt_todate.Text += ToDate.ToString("dd-MM-yyyy");
            }
        
    }
}