using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GenarateCaptcha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillCapctha();
        }
    }

    void FillCapctha()
    {
        try
        {
            Random random = new Random();
            string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            StringBuilder captcha = new StringBuilder();
            for (int i = 0; i < 5; i++)
                captcha.Append(combination[random.Next(combination.Length)]);
            Session["captcha"] = captcha.ToString();
            imgCaptcha.ImageUrl = "GenerateCap.aspx?" + DateTime.Now.Ticks.ToString();
        }
        catch
        {
            throw;
        }
    }

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        FillCapctha();
    }

    protected void btnRegiser_Click(object sender, EventArgs e)
    {
        if (Session["captcha"].ToString() != txtCaptcha.Text)

            lblErrorMsg.Text = "Invalid Captcha Code";

        else

        {
            lblErrorMsg.Text = "valid Captcha Code";
        }
    }
}