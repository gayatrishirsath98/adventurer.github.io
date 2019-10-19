using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Bill : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand cmd;
    SqlDataAdapter adapt;
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        lbl_billdate.Text = DateTime.Now.ToString("dd-MM-yyyy");
        if (!IsPostBack) { 
            displaybillno();
        }
        getcustdetail();
        DisplayData();
        displaytotal();
        lbl_orderid.Text = Session["order_no"].ToString();
        lbl_agentname.Text = Session["agent_name"].ToString();

        //disply amount in word
        float value = Convert.ToSingle(lbl_totalamount.Text);
        int t = (int)Math.Round(value);
        string word = ConvertNumbertoWords(Convert.ToInt32(t));
        lbl_amountInWord.Text = word;

        //save data
        if (!IsPostBack)
        {
            Save_Data();
        }
    }

    public string ConvertNumbertoWords(long number)
    {
        if (number == 0) return "ZERO";
        if (number < 0) return "minus " + ConvertNumbertoWords(Math.Abs(number));
        string words = "";
        if ((number / 1000000) > 0)
        {
            words += ConvertNumbertoWords(number / 100000) + " LAKES ";
            number %= 1000000;
        }
        if ((number / 1000) > 0)
        {
            words += ConvertNumbertoWords(number / 1000) + " THOUSAND ";
            number %= 1000;
        }
        if ((number / 100) > 0)
        {
            words += ConvertNumbertoWords(number / 100) + " HUNDRED ";
            number %= 100;
        }
        //if ((number / 10) > 0)  
        //{  
        // words += ConvertNumbertoWords(number / 10) + " RUPEES ";  
        // number %= 10;  
        //}  
        if (number > 0)
        {
            if (words != "") words += "AND ";
            var unitsMap = new[]
            {
            "ZERO", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE", "TEN", "ELEVEN", "TWELVE", "THIRTEEN", "FOURTEEN", "FIFTEEN", "SIXTEEN", "SEVENTEEN", "EIGHTEEN", "NINETEEN"
        };
            var tensMap = new[]
            {
            "ZERO", "TEN", "TWENTY", "THIRTY", "FORTY", "FIFTY", "SIXTY", "SEVENTY", "EIGHTY", "NINETY"
        };
            if (number < 20) words += unitsMap[number];
            else
            {
                words += tensMap[number / 10];
                if ((number % 10) > 0) words += " " + unitsMap[number % 10];
            }
        }
        return words;
    }

    void displaybillno()
    {
        //auto Order id display
        int a;
        con.Open();
        string query = "Select Max(Pay_id) from tbl_payment";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            string val = dr[0].ToString();
            if (val == "")
            {
                lbl_billno.Text = "1";
            }
            else
            {
                a = Convert.ToInt32(dr[0].ToString());
                a = a + 1;
                lbl_billno.Text = a.ToString();
            }
        }
        con.Close();

    }
     void getcustdetail()
    {
        con.Open();
   
        string str = "select * from tbl_subscription, tbl_customer where tbl_subscription.CustID = tbl_customer.Cust_id And Sub_id = '" + Session["subid"].ToString() + "'";
         cmd = new SqlCommand(str, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        lbl_fromdate.Text= ds.Tables[0].Rows[0]["Sub_fromdate"].ToString();
        lbl_todate.Text = ds.Tables[0].Rows[0]["Sub_todate"].ToString();
        lbl_validity.Text = ds.Tables[0].Rows[0]["Duration"].ToString();
        lbl_area.Text = ds.Tables[0].Rows[0]["Area"].ToString();
        lbl_city.Text = ds.Tables[0].Rows[0]["City"].ToString();
        lbl_custname.Text = ds.Tables[0].Rows[0]["Cust_name"].ToString();
        lbl_cname.Text = ds.Tables[0].Rows[0]["Cust_name"].ToString();
   
        lbl_contact.Text = ds.Tables[0].Rows[0]["Mobile_No"].ToString();
        lbl_email.Text = ds.Tables[0].Rows[0]["Email"].ToString();
      
    
    }
  
    private void DisplayData()
    {
        con.Close();
        con.Open();
        DataTable dt = new DataTable();
        //GridView1.Columns.Add("Sr.NO", "Serial No");
        adapt = new SqlDataAdapter("select Pack_name,Pack_type,Totalchannels,Pack_prize from tbl_orderdetails,tbl_pack where tbl_orderdetails.Pack_id=tbl_pack.Pack_id AND Order_id='" + Session["order_no"] + "'", con);
        adapt.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        con.Close();
    }

    void displaytotal()
    {
        cmd = new SqlCommand("select * from tbl_orderheader where Order_id='" + Session["order_no"].ToString() + "'", con);
        con.Open();
        cmd.ExecuteNonQuery();
        SqlDataReader dr;
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            string SubTotal = (string)dr["SubTotal"].ToString();
            lbl_total.Text = SubTotal;
            string Con_Charges = (string)dr["Con_Charges"].ToString();
            lbl_concharges.Text = Con_Charges;
            string Gst = (string)dr["GST"].ToString();
            lbl_gst.Text = Gst;
            string TotalAmount = (string)dr["Total_amount"].ToString();
            lbl_totalamount.Text = TotalAmount;

        }
        con.Close();
    }

    protected void Save_Data()
    {
        //already exit field
        DataSet ds = new DataSet();
        cmd = new SqlCommand("Select Pay_id from tbl_payment where Pay_id='" + lbl_billno.Text + "' or Order_id='"+lbl_orderid.Text+"'", con);
        adapt = new SqlDataAdapter(cmd);
        adapt.Fill(ds);
        int i = ds.Tables[0].Rows.Count;
        if (i > 0)
        {
           
        }
        else
        {

            string query = "Insert into tbl_payment(Transation_id,Order_id,Cust_id,Date,Amount,Mode,Status) Values('" + Session["transationid"].ToString() + "','" + lbl_orderid.Text + "','" + Session["customerid"].ToString() + "','" + lbl_billdate.Text + "','" + lbl_totalamount.Text + "','" + "Offline" + "','" + "Success" + "')";
            con.Open();
            cmd = new SqlCommand(query, con);
            cmd.CommandText = query;
            cmd.ExecuteNonQuery();
            //Response.Write("<script>alert('Insert Successfully..!')</script>");
            con.Close();
            //btn_print.Visible = false;
        }
    }
}