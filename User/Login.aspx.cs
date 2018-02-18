using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using EventManagementSystem;
using System.Data.SqlClient;
using System.Configuration;

public partial class Account_Login : Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["UserMobile"] != null)
            {
                Response.Redirect("UserHome.aspx");
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            long mobile = Convert.ToInt64(Mobile.Text);
            string password = Password.Text.ToString();
            SqlConnection conn = new SqlConnection(connectionString);
            string query = "select count(Mobile) from tblUser where Mobile = @Mobile and Password=@Password";
            SqlCommand cmd2 = new SqlCommand(query, conn);
            cmd2.Parameters.AddWithValue("Mobile", mobile);
            cmd2.Parameters.AddWithValue("Password", password);
            try
            {
                conn.Open();
                int result = (int)cmd2.ExecuteScalar();
                if (result > 0)
                {
                    Session["UserMobile"] = mobile;
                    Response.Redirect("UserHome.aspx");
                }
                else
                {
                    FailureText.Text = "Invalid Credentials!";
                    FailureText.Visible = true;
                }
            }
            catch(Exception ex)
            {
                FailureText.Text = ex.Message;
                FailureText.Visible = true;
            }
            finally
            {
                conn.Close();
            }
        }
}