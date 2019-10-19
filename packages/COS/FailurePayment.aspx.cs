using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FailurePayment : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand cmd;
    SqlDataAdapter adapt;
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime today = DateTime.Now;
       string date = today.ToString("dd-MM-yyyy");
        lbl_sms.Text=  "Transaction ID :" + Request.Form["txnid"] + " has been Error";
        string query = "Insert into tbl_payment(Transation_id,Order_id,Cust_id,Date,Amount,Mode,Status) Values('" + Session["transationid"].ToString() + "','" + Session["order_no"].ToString() + "','" + Session["customerid"].ToString() + "','" + date.ToString() + "','" + Session["amount"].ToString() + "','" + "Online" + "','" + "Failed" + "')";
        con.Open();
        cmd = new SqlCommand(query, con);
        cmd.CommandText = query;
        cmd.ExecuteNonQuery();
        Response.Write("<script>alert('Insert Successfully..!')</script>");
        con.Close();
    }
}