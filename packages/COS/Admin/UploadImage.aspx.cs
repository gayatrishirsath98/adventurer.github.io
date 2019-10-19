using System;
using System.IO;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_UploadImage : System.Web.UI.Page
   
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    //SqlCommand cmd;
    //SqlDataAdapter adapt;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {

        if (FileUpload1.HasFile)
        {
            string strname = FileUpload1.FileName.ToString();
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Admin/upload/") + strname);
            con.Open();
            SqlCommand cmd = new SqlCommand("update tbl_admin set Image='" + strname + "' where Admin_id='" + Session["admin_id"].ToString() + "' ", con);
            cmd.ExecuteNonQuery();
            con.Close();
            lbl_sms.Visible = true;
            lbl_sms.Text = "Image Uploaded successfully";

        }
        else
        {
            lbl_sms.Visible = true;
            lbl_sms.Text = "Plz upload the image!!!!";
        }

        //string folderPath = Server.MapPath("~/Admin/upload/");

        ////Check whether Directory (Folder) exists.
        //if (!Directory.Exists(folderPath))
        //{
        //    //If Directory (Folder) does not exists Create it.
        //    Directory.CreateDirectory(folderPath);
        //}

        ////Save the File to the Directory (Folder).
        //FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));

        //Display the Picture in Image control.
        Image1.ImageUrl = "~/Admin/upload/" + Path.GetFileName(FileUpload1.FileName);
    }
}