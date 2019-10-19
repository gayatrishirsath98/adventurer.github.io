using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_EditPack : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand com;
    protected void Page_Load(object sender, EventArgs e)
    {
       // DisplayPackdetail();
    }

    void DisplayPackdetail()
    {
        string packid = Request.QueryString["code"];
        con.Open();

        string str = "select * from tbl_pack where Pack_id='" + packid + "'";

        com = new SqlCommand(str, con);

        SqlDataAdapter da = new SqlDataAdapter(com);

        DataSet ds = new DataSet();

        da.Fill(ds);

        txt_packname.Text = ds.Tables[0].Rows[0]["Pack_name"].ToString();

        txt_prize.Text = ds.Tables[0].Rows[0]["Pack_prize"].ToString();
        txt_type.Text = ds.Tables[0].Rows[0]["Pack_type"].ToString();
        txt_totalchannel.Text = ds.Tables[0].Rows[0]["Totalchannels"].ToString();
        txt_details.Text = ds.Tables[0].Rows[0]["Details"].ToString();

       
        //Image1 = "~/Admin/upload/id=" + agentid;

        con.Close();

    }
    protected void btn_update_Click(object sender, EventArgs e)
    {
        string packid = Request.QueryString["code"];
        string EmpImgName = Path.GetFileName(FileUpload1.PostedFile.FileName);

        FileUpload1.SaveAs(Server.MapPath("~/Admin/upload/packimage/" + EmpImgName));

        SqlCommand cmdupdate = new SqlCommand("Update tbl_pack SET Pack_name='" + txt_packname.Text + "', Pack_prize='" + txt_prize.Text + "', Pack_type='" + txt_type.Text + "', TotalChannels='" + txt_totalchannel.Text + "',Details='" + txt_details.Text + "',ImageName='" + EmpImgName.ToString() + "', ImagePath='" + "~/ Admin/upload/packimage/" + EmpImgName + "'where Pack_id= " + packid + "", con);
        con.Open();
        cmdupdate.CommandType = CommandType.Text;
       cmdupdate.ExecuteNonQuery();
        Response.Write("<script>alert('Update Successfully..!')</script>");
        Response.Redirect("PackDetails.aspx");
        //txt_cname.Text = "";
        //        txt_city.Text = "";
        //        txt_area.Text = "";
        //        txt_contact.Text = "";
        //        txt_email.Text = "";
        //        txt_aadhar.Text = "";
        //        comboBox1.Text = "";
        //  btn_update.Enabled = false;

        //  Response.Write("<script>alert('Error..!')</script>");
    }

    protected void btn_discard_Click(object sender, EventArgs e)
    {
        Response.Redirect("PackDetails.aspx");
    }
}