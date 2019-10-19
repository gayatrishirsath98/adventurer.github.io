using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\Ganesh\Project\COS\db_cos.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand cmd;
    SqlDataAdapter adapt;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_change_Click(object sender, EventArgs e)
    {

        con.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from tbl_agent where Agent_id='" + Session["agent_id"] + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        //string username = ds.Tables[0].Rows[0][1].ToString();
        string OLdpassword = ds.Tables[0].Rows[0][8].ToString();
        if (OLdpassword == txt_currentpassword.Text)
        {
            if (OLdpassword != txt_newpassword.Text)
            {
                if (txt_newpassword.Text == txt_confirmpassword.Text)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update tbl_agent set Password='" + txt_newpassword.Text + "' where Agent_id='" + Session["agent_id"] + "'", con);
                    int querystatus = cmd.ExecuteNonQuery();
                    if (querystatus > 0)
                    {
                        lbl_Error.ForeColor = System.Drawing.Color.Green;
                        // lbl_Error.Text = "Password Updated Successfully..";
                        Response.Write("<script>alert('Password Updated Successfully..!')</script>");
                    }
                    else
                    {
                        lbl_Error.ForeColor = System.Drawing.Color.Red;
                        lbl_Error.Text = "Execution error";
                    }
                }
                else
                {
                    lbl_Error.ForeColor = System.Drawing.Color.Red;
                    lbl_Error.Text = "Password miss match";
                }
            }
            else
            {
                lbl_Error.ForeColor = System.Drawing.Color.Red;
                lbl_Error.Text = "Old & New Password are Same..!";
            }
        }
        else
        {
            lbl_Error.ForeColor = System.Drawing.Color.Red;
            lbl_Error.Text = "Old password is incorrect";
        }


    }

    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Index.aspx");
    }
}