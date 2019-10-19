using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

public partial class Order : System.Web.UI.Page
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
       

        if (!IsPostBack) {
            //Panelcheck.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = false;
        }

        //bind PACK name to dropdownlist
        FillCombo1();

        //display order detail id
        displayorderid();

        DateTime today = DateTime.Now;
        lbl_todaydate.Text = today.ToString("dd-MM-yyyy");

        //auto Order id display
        int a;
        con.Open();
        string query = "Select Max(Order_id) from tbl_orderheader";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            string val = dr[0].ToString();
            if (val == "")
            {
                lbl_orderno.Text = "1";
            }
            else
            {
                a = Convert.ToInt32(dr[0].ToString());
                a = a + 1;
                lbl_orderno.Text = a.ToString();
            }
        }
        con.Close();

        

    }

    //display order detail id
    void displayorderid()
    {
        int a;
        con.Open();

        string query1 = "Select Max(Orderdetail_id) from tbl_orderdetails";

        cmd = new SqlCommand(query1, con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            string val = dr[0].ToString();
            if (val == "")
            {
                txt_orderdetailno.Text = "1";
            }
            else
            {
                a = Convert.ToInt32(dr[0].ToString());
                a = a + 1;
                txt_orderdetailno.Text = a.ToString();
            }
        }

        con.Close();
        //  dataGridView1.DataSource = null;
    }


   


    //bind pack to dropdownlist
    void FillCombo1()
    {
        if (!Page.IsPostBack)
        {
            con.Open();           
            SqlCommand cmd = new SqlCommand("select Pack_name from tbl_pack", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DropDownList3.DataSource = dt;
            DropDownList3.DataBind();
            con.Close();
            
        }
    }

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        cmd = new SqlCommand("select * from tbl_pack where Pack_name='" + DropDownList3.Text + "'", con);
        con.Close();
        con.Open();
        cmd.ExecuteNonQuery();
        SqlDataReader dr;
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            string pid = (string)dr["Pack_id"].ToString();
            txt_packid.Text = pid;
            string prize = (string)dr["Pack_prize"].ToString();
            txt_prize.Text = prize;
            Image1.ImageUrl = "~/Admin/upload/packimage/" + (string)dr["ImageName"].ToString();

        }
        con.Close();
    }

    protected void btn_addpack_Click(object sender, EventArgs e)
    {
       
            //already pack exit 
            DataSet ds = new DataSet();
        cmd = new SqlCommand("Select Pack_ID,Order_ID from tbl_orderdetails where Pack_ID='" + txt_packid.Text + "' AND Order_ID='" + lbl_orderno.Text + "'", con);
        adapt = new SqlDataAdapter(cmd);
        adapt.Fill(ds);
        int i = ds.Tables[0].Rows.Count;
        if (i > 0)
        {
           // Response.Write("<script>alert('Pack Name " + DropDownList3.Text + " Already Selected..!')</script>");
            lbl_sms.Text = " " + DropDownList3.Text + " Already Selected..";
            ds.Clear();
            // DisplayData1();
            DisplaySelectedPack();
            Total();
           
        }
        else
        {
            con.Open();
            string query = "Insert into tbl_orderdetails(Pack_ID,Order_ID) Values('" + this.txt_packid.Text + "','" + this.lbl_orderno.Text + "')";
            cmd = new SqlCommand(query, con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();           
            //Response.Write("<script>alert('Pack is Selected..!')</script>");
            lbl_sms.Text = " " + DropDownList3.Text + " is Added to List.";
            con.Close();

            //disply selected pack
            DisplaySelectedPack();
            txt_ConCharge.Text = 130.ToString();

            //calculation
            Total();

            //increment id
            displayorderid();

            // DisplayData1();

            //  btn_confirm.Enabled = true;
            //Panel1.Visible = true;
            Panel2.Visible = true;
            lbl_sms1.Text = "";

        }
        
    }

    void DisplaySelectedPack()
    {

        con.Open();
        DataTable dt = new DataTable();
        //dataGridView1.Columns.Add("SrNo", "Serial No");
        adapt = new SqlDataAdapter("select tbl_pack.Pack_id,Pack_name,Pack_prize,Pack_type,Totalchannels from tbl_orderdetails,tbl_pack where tbl_orderdetails.Pack_id=tbl_pack.Pack_id AND Order_id='" + lbl_orderno.Text + "'", con);
        adapt.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        con.Close();

    }

    void Total()
    {
        int a;
        txt_ConCharge.Text = 130.ToString();
        double sum = 0, gst = 0, TotalAmount = 0, charge = 130, sum1 = 0, TotalAmount1;
        for (a = 0; a < GridView1.Rows.Count; a++)
        {
            //sum += Convert.ToDouble(GridView1.Rows[i].Cells[1].Value);
            sum += Convert.ToDouble(GridView1.Rows[a].Cells[3].Text);

        }

        txt_subtotal.Text = sum.ToString();
        sum1 = sum + charge;
        gst = sum1 * 0.18;
        txt_gst.Text = gst.ToString();
        TotalAmount = sum1 + gst;
        if (lbl_duration.Text == "1 Month")
        {
            TotalAmount1 = TotalAmount * 1;
            txt_totalprize.Text = TotalAmount1.ToString();
        }

        else if (lbl_duration.Text == "3 Month")
        {
            TotalAmount1 = TotalAmount * 3;
            txt_totalprize.Text = TotalAmount1.ToString();
        }
        else if (lbl_duration.Text == "6 Month")
        {
            TotalAmount1 = TotalAmount * 6;
            txt_totalprize.Text = TotalAmount1.ToString();
        }
        else if (lbl_duration.Text == "1 Year")
        {
            TotalAmount1 = TotalAmount * 12;
            txt_totalprize.Text = TotalAmount1.ToString();
        }
        // txt_totalamount.Text = TotalAmount.ToString();
    }


     protected void btn_submit_Click(object sender, EventArgs e)
    {

        //already exist recharge for this subscription id 
        DataSet ds = new DataSet();
        cmd = new SqlCommand("select tbl_orderheader.Sub_id from tbl_orderheader where Sub_id='" + txt_subid.Text + "'", con);
        adapt = new SqlDataAdapter(cmd);
        adapt.Fill(ds);
        int i = ds.Tables[0].Rows.Count;
        if (i > 0)
        {
           //Response.Write("<script>alert(' Recharge Already Exist..!')</script>");
            lbl_sms1.Text = " Recharge Already Exist..!";
           
            ds.Clear();
            // DisplayData1();

        }

        else
        {
            if (GridView1.Rows.Count != 0)
            {

                string query = "Insert into tbl_orderheader(Order_date,Total_amount,CustomerID,Sub_id,SubTotal,GST,Con_Charges) Values('" + this.lbl_todaydate.Text + "','" + this.txt_totalprize.Text + "','" + this.txt_custid.Text + "','" + this.txt_subid.Text + "','" + this.txt_subtotal.Text + "','" + this.txt_gst.Text + "','" + this.txt_ConCharge.Text + "')";
                con.Close();
                con.Open();
                cmd = new SqlCommand(query, con);
                SqlDataReader dr;

                dr = cmd.ExecuteReader();
                btn_submit.Enabled = false;

                Session["order_no"] = lbl_orderno.Text;
                Session["customerid"] = txt_custid.Text;
                Session["orderdetailid"] = txt_orderdetailno.Text;
                Session["subid"] = txt_subid.Text;
                Session["custname"] = lbl_custname.Text;
                Session["custcontact"] = lbl_contact.Text;
                Session["email"] = lbl_email.Text;
                Session["amount"] = txt_totalprize.Text;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Order Save Successfully..!');window.location ='Payment.aspx?price=" + txt_totalprize.Text + "';", true);
                //Response.Write("<script>alert('Order Save Successfully..!')</script>");       
                con.Close();
                sendmail();
                //Response.Redirect("Payment.aspx?price=" + txt_totalprize.Text);
            }
            else
            {

                lbl_sms1.Text = " Please Add Packs";
            }
        }

    }

    //subscription id is valid or not
    bool checkSIDValid()
   {
        
        DataSet ds = new DataSet();
        cmd = new SqlCommand("Select Sub_id from tbl_subscription where Sub_id='" + txt_subid.Text + "'", con);
        adapt = new SqlDataAdapter(cmd);
        adapt.Fill(ds);
        int i = ds.Tables[0].Rows.Count;
        if (i < 0)
        {
            Response.Write("<script>alert('Invalid Subscription ID Please Enter Valid Subscription ID')</script>");
            ds.Clear();
            Panel2.Visible = false;
            Panel3.Visible = false;
            
        }
        return false;



    }
    void RechargeIsExist()
    {

        //already subscription exist
        DataSet ds = new DataSet();
        cmd = new SqlCommand("Select Sub_id from tbl_orderheader where Sub_id='" + txt_subid.Text + "'", con);
        adapt = new SqlDataAdapter(cmd);
        adapt.Fill(ds);
        int i = ds.Tables[0].Rows.Count;
        if (i > 0)
        {
            Response.Write("<script>alert('Order Exist for this Subscription..! Create a new Subscription..!')</script>");
            ds.Clear();


        }
    }


    protected void btn_checksubcription_Click(object sender, EventArgs e)
    {
        //if (checkSIDValid())
        //{
        //    RechargeIsExist();
        //}
        
        //else
        //{
            cmd = new SqlCommand("select * from tbl_subscription,tbl_customer where tbl_subscription.CustID = tbl_customer.Cust_id And Sub_id='" + txt_subid.Text + "'", con);
        //con.Close();
        con.Open();
         cmd.ExecuteNonQuery();
        SqlDataReader dr;
         dr = cmd.ExecuteReader();       

        while (dr.Read())
        {
            string cid = (string)dr["Cust_id"].ToString();
            txt_custid.Text = cid;
            string pid = (string)dr["Cust_name"].ToString();
            lbl_custname.Text = pid;
            string duration = (string)dr["Duration"].ToString();
            lbl_duration.Text = duration;
            string fromdate = (string)dr["Sub_fromdate"].ToString();
            lbl_fromdate.Text = fromdate;
            string todate = (string)dr["Sub_todate"].ToString();
            lbl_todate.Text = todate;

            string area = (string)dr["Area"].ToString();
            lbl_area.Text = area;
            string city = (string)dr["City"].ToString();
            lbl_city.Text = city;
            string Mobile_No = (string)dr["Mobile_No"].ToString();
            lbl_contact.Text = Mobile_No;
            string Email = (string)dr["Email"].ToString();
            lbl_email.Text = Email;
            Panel2.Visible = true;
            Panel3.Visible = true;

        }
        con.Close();
    // }
       // Panelcheck.Visible = true;

    }


    void sendmail()
    {      
     
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("adventurer2410@gmail.com", "Adventurer@0901");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Hello, " + lbl_custname.Text + "  Your  Order is confirmed - Please Pay your Payment (Order ID:" + lbl_orderno.Text + "  )";
            msg.Body = "Your Order is Placed Successfully,Subscription is valid for " + lbl_duration.Text + " from " + lbl_fromdate.Text + " To " + lbl_todate.Text + ". Thanks (Note: This is a system generated email, hence please do not reply to this email)";
            string toaddress = lbl_email.Text;
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



    protected void btn_reset_Click(object sender, EventArgs e)
    {
        txt_subid.Text = "";
        lbl_custname.Text = "";
        lbl_duration.Text = "";
        lbl_fromdate.Text = "";
        lbl_todate.Text = "";
        lbl_area.Text = "";
        lbl_city.Text = "";
        txt_ConCharge.Text = "";
        txt_custid.Text = "";
        txt_gst.Text = "";
        txt_packid.Text = "";
        txt_prize.Text = "";
        txt_subtotal.Text = "";
        txt_totalprize.Text = "";
        

    }

    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Index.aspx");
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
    }

    //remove pack from list
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lnk = sender as LinkButton;
        GridViewRow gridRow = lnk.NamingContainer as GridViewRow;
        int packid = Convert.ToInt32(GridView1.DataKeys[gridRow.RowIndex].Value.ToString());
        con.Open();
        cmd.CommandText = "delete from tbl_orderdetails where Pack_id='" + packid + "' And Order_id='" + lbl_orderno.Text + "'";
        cmd.Connection = con;
        int a = cmd.ExecuteNonQuery();
        con.Close();
        if(a>0)
        {
            DisplaySelectedPack();
            Total();
        }
    }
}