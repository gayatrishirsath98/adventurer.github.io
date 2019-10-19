using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Employee : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand command;
    SqlDataAdapter adapt;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindGridData();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //Condition to check if the file uploaded or not   
        if (fileuploadEmpImage.HasFile)
        {
            //getting length of uploaded file  
            int length = fileuploadEmpImage.PostedFile.ContentLength;
            //create a byte array to store the binary image data  
            byte[] imgbyte = new byte[length];
            //store the currently selected file in memeory  
            HttpPostedFile img = fileuploadEmpImage.PostedFile;
            //set the binary data  
            img.InputStream.Read(imgbyte, 0, length);
            int id = Convert.ToInt32(txtID.Text);
            string name = txtName.Text;
            string bloodGroup = txtBloodGroup.Text;
            string phoneNo = txtContactNo.Text;

            //Open The Connection  
            con.Open();
            command = new SqlCommand("INSERT INTO Employee (Id,Name,BloodGroup,PhoneNo,Image) VALUES (@id,@Name,@BloodGroup,@ContactNo,@imagedata)", con);
            command.Parameters.Add("@id", SqlDbType.Int).Value = id;
            command.Parameters.Add("@Name", SqlDbType.VarChar, 150).Value = name;
            command.Parameters.Add("@BloodGroup", SqlDbType.NVarChar, 250).Value = bloodGroup;
            command.Parameters.Add("@ContactNo", SqlDbType.VarChar, 50).Value = phoneNo;
            command.Parameters.Add("@imagedata", SqlDbType.Image).Value = imgbyte;

            int count = command.ExecuteNonQuery();
            //Close The Connection  
            con.Close();
            if (count == 1)
            {
                //BindGridData();  
                txtID.Text = string.Empty;
                txtName.Text = string.Empty;
                txtBloodGroup.Text = string.Empty;
                txtContactNo.Text = string.Empty;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Record added successfully')", true);
                //call the method to bind the grid  
                BindGridData();
                getimage();
            }
        }
    }
    private void BindGridData()
        {
            
          command = new SqlCommand("SELECT Id,Name,BloodGroup,PhoneNo,Image from [Employee]", con);
            SqlDataAdapter daimages = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            daimages.Fill(dt);
            grdEmployee.DataSource = dt;
            grdEmployee.DataBind();
        }
    public void getimage()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("Select Image from Employee where Id='"+txtID.Text+"'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                byte[] imagedata = (byte[])dr["Image"];
                string img = Convert.ToBase64String(imagedata, 0, imagedata.Length);
                grdEmployee.BackImageUrl = "data:Admin/upload;base64," + img;


            }
        }
        else
        {

        }
    }


}