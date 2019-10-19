using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_DisplayPackList : System.Web.UI.Page
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

        FillDropdownList();
        btn_print.Visible = false;
       


    }
    void FillDropdownList()
    {
        if (!Page.IsPostBack)
        {
            con.Open();
            //SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
            SqlCommand cmd = new SqlCommand("select Pack_name from tbl_pack", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataBind();
            con.Close();

            //displayid();


        }

    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        cmd = new SqlCommand("select * from tbl_pack where Pack_name='" + DropDownList1.Text + "'", con);
        con.Close();
        con.Open();
        cmd.ExecuteNonQuery();
        SqlDataReader dr;
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            string packid = (string)dr["Pack_id"].ToString();
            txt_packid.Text = packid;

        }
        con.Close();
        Bindgrid();

    }

    void Bindgrid()
    {

        con.Open();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        //dataGridView1.Columns.Add("SrNo", "Serial No");
        adapt = new SqlDataAdapter("select Channel_name,Channel_prize,Language,Details from tbl_channel where Pack_id='" + txt_packid.Text  + "'", con);
        adapt.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        con.Close();
        int rowcnt = ds.Tables[0].Rows.Count;
        if (rowcnt > 0)
        {
            ds.Tables[0].Columns["Channel_name"].ColumnName = "Channel_name";
            ds.Tables[0].Columns["Channel_prize"].ColumnName = "Channel_prize";
            ds.Tables[0].Columns["Language"].ColumnName = "Language";
            ds.Tables[0].Columns["Details"].ColumnName = "Details";
            

            GridView1.DataSource = ds.Tables[0];
            btn_print.Visible = true;
            lbl_count.Text = rowcnt.ToString();
        }
        else
        {

            GridView1.DataSource = null;
            GridView1.DataSource = null;
            Response.Write("<script>alert('No Record Found ..!')</script>");
            btn_print.Visible = false;
            lbl_count.Visible = false;
            //Label1.Visible = false;
            lbl_count.Text = " ";

        }

    }
   


}