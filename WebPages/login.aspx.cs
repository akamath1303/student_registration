using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_login : System.Web.UI.Page
{
    DataManager dm = new DataManager();
    clsEncryptDecrypt objpass = new clsEncryptDecrypt();
    SqlConnection objsql = new SqlConnection(ConfigurationManager.AppSettings["ConnStr"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            TextName.Focus();
        }
    }
    
    private void ShowMessageAndRedirect(string msg, string url)
    {
        try
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("function Redirect()");
            sb.Append("{");
            sb.Append(" window.location.href='" + url + "'");
            sb.Append("}");
            sb.Append("alert('" + msg + "');");
            sb.Append("setTimeout('Redirect()',1000);");
            Response.Write("<script>" + sb + "</script>");
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
    }

    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        try
        {
            string Username = TextName.Text;
            string Password = objpass.Encrypt(TextPassword.Text);
            //string Password = TextPassword.Text;
            string qry = "select * from Login where Login_username='"+Username+"' and Login_password='"+Password+"' and Login_ActiveFlag=1";
            int res = 0;
            objsql.Open();
            SqlCommand cmd = new SqlCommand(qry, objsql);
            SqlDataReader d = cmd.ExecuteReader();
            while (d.Read())
            {
                res = int.Parse(d["Login_MasterId"].ToString());
            }
            objsql.Close();
            if (res > 0)
            {
                ShowMessageAndRedirect("Login Successfull", "studentinfo.aspx");
            }
            else
            {
                ShowMessageAndRedirect("Invalid", "login.aspx");
            }
       }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
    }
    protected void ButtonReset_Click(object sender, EventArgs e)
    {
        TextName.Text = "";
        TextPassword.Text = "";
    }
    protected void LinkButtonForgot_Click(object sender, EventArgs e)
    {
        Response.Redirect("forgotpassword.aspx");
    }
}