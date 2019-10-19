using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

public partial class FailurePayment : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand cmd;
    SqlDataAdapter adapt;
    protected void Page_Load(object sender, EventArgs e)
    {
        sendmail();

        DateTime today = DateTime.Now;
       string date = today.ToString("dd-MM-yyyy");
        lbl_sms.Text=  "Transaction ID :" + Request.Form["txnid"] + " has been Error";
        string query = "Insert into tbl_payment(Transation_id,Order_id,Cust_id,Date,Amount,Mode,Status) Values('" + Session["transationid"].ToString() + "','" + Session["order_no"].ToString() + "','" + Session["customerid"].ToString() + "','" + date.ToString() + "','" + Session["amount"].ToString() + "','" + "Online" + "','" + "Failed" + "')";
        con.Open();
        cmd = new SqlCommand(query, con);
        cmd.CommandText = query;
        cmd.ExecuteNonQuery();
        Response.Write("<script>alert('Payment Failed..!')</script>");
        con.Close();
    }

    void sendmail()
    {

        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("adventurer2410@gmail.com", "Adventurer@0901");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Payment Status.. (Transaction ID:" + Request.Form["txnid"] + "  )";
        msg.Body = " Hi, " + Session["custname"] + "Your Online Payment is Failed... Your (Order ID : " + Session["order_no"] + "). Thanks (Note: This is a system generated email, hence please do not reply to this email)";
        string toaddress = Session["email"].ToString();
        msg.To.Add(toaddress);
        string fromaddress = "Adventurer Cable System <adventurer2410@gmail.com>";
        msg.From = new MailAddress(fromaddress);


        try
        {
            smtp.Send(msg);
        }
        catch
        {
            throw;
        }
    }
}