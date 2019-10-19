using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Admin_AddNewPack : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand cmd;
    SqlDataAdapter adapt;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("Select * from tbl_pack where Pack_name='" + txt_packname.Text + "'", con);

        adapt = new SqlDataAdapter(cmd);
        adapt.Fill(ds);
        int i = ds.Tables[0].Rows.Count;
        if (i > 0)
        {

            Response.Write("<script>alert('Pack Name " + txt_packname.Text + " Already Exists')</script>");
            ds.Clear();
        }

        else
        {
            if (FileUpload1.PostedFile != null)
            {
                try
                {
                    string EmpImgName = Path.GetFileName(FileUpload1.PostedFile.FileName);

                    FileUpload1.SaveAs(Server.MapPath("~/Admin/upload/packimage/" + EmpImgName));

                    //Image1.ImageUrl = "~/Admin/upload/agentimage/" + Path.GetFileName(FileUpload1.FileName);

                    con.Open();

                    string query = "Insert into tbl_pack(Pack_name,Pack_prize,Pack_type,Totalchannels,Details,ImageName,ImagePath) Values('" + this.txt_packname.Text + "','" + this.txt_prize.Text + "','" + this.txt_type.Text + "','" + this.txt_totalchannel.Text + "','" + this.txt_details.Text + "','" + EmpImgName.ToString() + "','" + "~/ Admin/upload/packimage/" + EmpImgName + "')";
                    cmd = new SqlCommand(query, con);
                    SqlDataReader dr;

                    dr = cmd.ExecuteReader();
                    Response.Write("<script>alert('Insert Successfully..!')</script>");
                    txt_packname.Text = "";
                    txt_prize.Text = "";
                    txt_type.Text = "";
                    txt_totalchannel.Text = "";
                    txt_details.Text = "";



                   
                    con.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }

            }
        }
    }



    protected void btn_discard_Click(object sender, EventArgs e)
    {
        Response.Redirect("PackDetails.aspx");
    }
}