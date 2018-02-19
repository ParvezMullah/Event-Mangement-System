using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        string userName = txtUserName.Text;
        string Password = txtPassword.Text;
        SqlConnection conn = new SqlConnection(connectionString);
        string Query = "Select AdminPassword from tbladmin where AdminId=@AdminId";
        SqlCommand cmd = new SqlCommand(Query, conn);
        cmd.Parameters.AddWithValue("AdminId", userName);
        try
        {
            conn.Open();
            string dbPassword = cmd.ExecuteScalar().ToString();
            if (dbPassword == Password)
            {
                Session["Admin"] = userName;
                Response.Redirect("AdminHome.aspx");
            }
            else
            {
                FailureText.Visible = true;
            }

        }
        catch
        {
            FailureText.Visible = true;
        }
        finally
        {
            conn.Close();
        }
    }
    protected void txtUserName_TextChanged(object sender, EventArgs e)
    {
        FailureText.Visible = false;
    }
    protected void txtPassword_TextChanged(object sender, EventArgs e)
    {
        FailureText.Visible = false;
    }
}