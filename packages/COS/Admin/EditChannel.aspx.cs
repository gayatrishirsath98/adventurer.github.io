using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_EditChannel : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand com;
    protected void Page_Load(object sender, EventArgs e)
    {
        DisplayPackdetail();
    }

    void DisplayPackdetail()
    {
        string channelid = Request.QueryString["code"];
        con.Open();

        string str = "select * from tbl_channel where Channel_id='" + channelid + "'";

        com = new SqlCommand(str, con);

        SqlDataAdapter da = new SqlDataAdapter(com);

        DataSet ds = new DataSet();

        da.Fill(ds);

        txt_channelname.Text = ds.Tables[0].Rows[0]["Channel_name"].ToString();

        txt_prize.Text = ds.Tables[0].Rows[0]["Channel_prize"].ToString();
        txt_language.Text = ds.Tables[0].Rows[0]["Language"].ToString();
        txt_detail.Text = ds.Tables[0].Rows[0]["Details"].ToString();
        txt_packid.Text = ds.Tables[0].Rows[0]["Pack_id"].ToString();
      //  Image1. = ds.Tables[0].Rows[0]["ImageName"].ToString();

        //Image1 = "~/Admin/upload/id=" + agentid;

        con.Close();

    }
    protected void btn_update_Click(object sender, EventArgs e)
    {
        string channelid = Request.QueryString["code"];
        string EmpImgName = Path.GetFileName(FileUpload1.PostedFile.FileName);

        FileUpload1.SaveAs(Server.MapPath("~/Admin/upload/channelimage/" + EmpImgName));

        SqlCommand cmdupdate = new SqlCommand("Update tbl_channel SET Channel_name='" + txt_channelname.Text + "', Channel_prize='" + txt_prize.Text + "',Language='" + txt_language.Text + "', Details='" + txt_detail.Text + "',Pack_id='" + txt_packid.Text + "',ImageName='" + EmpImgName.ToString() + "', ImagePath='" + "~/ Admin/upload/channelimage/" + EmpImgName + "'where Channel_id= " + channelid + "", con);
        con.Open();
        cmdupdate.CommandType = CommandType.Text;
        cmdupdate.ExecuteNonQuery();
        Response.Write("<script>alert('Update Successfully..!')</script>");
        Response.Redirect("PackDetails.aspx");
    }

    protected void btn_discard_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChannelDetails.aspx");
    }
}