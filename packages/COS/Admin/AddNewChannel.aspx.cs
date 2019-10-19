using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddNewChannel : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand cmd;
    SqlDataAdapter adapt;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        FillCombo();
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("Select * from tbl_channel where Channel_name='" + txt_channelname.Text + "'", con);

        adapt = new SqlDataAdapter(cmd);
        adapt.Fill(ds);
        int i = ds.Tables[0].Rows.Count;
        if (i > 0)
        {

            Response.Write("<script>alert('Channel Name " + txt_channelname.Text + " Already Exists')</script>");
            ds.Clear();
        }

        else
        {
            if (FileUpload1.PostedFile != null)
            {
                //try
                //{
                    string EmpImgName = Path.GetFileName(FileUpload1.PostedFile.FileName);

                    FileUpload1.SaveAs(Server.MapPath("~/Admin/upload/channelimage/" + EmpImgName));

                    //Image1.ImageUrl = "~/Admin/upload/agentimage/" + Path.GetFileName(FileUpload1.FileName);

                    con.Open();

                    string query = "Insert into tbl_channel(Channel_name,Channel_prize,Language,Details,Pack_id,ImageName,ImagePath) Values('" + this.txt_channelname.Text + "','" + this.txt_prize.Text + "','" + this.txt_language.Text + "','" + this.txt_detail.Text + "','" + this.txt_packid.Text + "','" + EmpImgName.ToString() + "','" + "~/ Admin/upload/channelimage/" + EmpImgName + "')";
                    cmd = new SqlCommand(query, con);
                    SqlDataReader dr;

                    dr = cmd.ExecuteReader();
                   Response.Write("<script>alert('Insert Successfully..!')</script>");
                    txt_channelname.Text = "";
                    txt_prize.Text = "";
                    txt_language.Text = "";
                    txt_detail.Text = "";
                    txt_packid.Text = "";



                
                    con.Close();
           //     }
           //catch (Exception ex)
           //     {
           //         Response.Write(ex.Message);
           //     }

            }
        }
    }

    protected void btn_discard_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChannelDetails.aspx");
    }

    protected void packlist_name_SelectedIndexChanged(object sender, EventArgs e)
    {
        cmd = new SqlCommand("select * from tbl_pack where Pack_name='" + packlist_name.Text + "'", con);
        con.Close();
        con.Open();
        cmd.ExecuteNonQuery();
        SqlDataReader dr;
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            string pid = (string)dr["Pack_id"].ToString();
            txt_packid.Text = pid;
     

        }
        con.Close();

    }
    void FillCombo()
    {
        
        if (!Page.IsPostBack)
        {
            con.Open();
            //SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
            SqlCommand cmd = new SqlCommand("select Pack_name from tbl_pack", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            packlist_name.DataSource = dt;
            packlist_name.DataBind();
            con.Close();
        }
    }
}