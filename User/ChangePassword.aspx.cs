using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class User_ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserMobile"] == null)
        {
            Response.Redirect("~/default.aspx");
        }
    }
    protected void btnChange_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        using(SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "Select top 1 Password from tblUser where mobile =@mobile";
            using(SqlCommand cmd = new SqlCommand(query,conn))
            {
                cmd.Parameters.AddWithValue("mobile", Session["UserMobile"].ToString());
                try
                {
                    conn.Open();
                    string password = cmd.ExecuteScalar().ToString();
                    conn.Close();
                    if(password != txtCurrentPassword.Text.ToString())
                    {
                        lblError.Text = "Current Password Is Incorrect.";
                        lblError.ForeColor = System.Drawing.Color.Red;
                        lblError.Visible = true;
                    }
                    else
                    {
                        string change = "update tbluser set password=@password where mobile=@mobile";
                        using(SqlCommand cmd1 = new SqlCommand(change,conn))
                        {
                            cmd1.Parameters.AddWithValue("password", txtNewPassword.Text.ToString());
                            cmd1.Parameters.AddWithValue("mobile", Session["UserMobile"].ToString());
                            conn.Open();
                            cmd1.ExecuteNonQuery();
                            lblError.Text = "Password Updated Successfully!";
                            lblError.ForeColor = System.Drawing.Color.Green;
                            lblError.Visible = true;
                        }
                    }
                }
                catch(Exception exc)
                {
                    Response.Write(exc.Message);
                }
            }
        }
    }
    protected void txtCurrentPassword_TextChanged(object sender, EventArgs e)
    {
        lblError.Visible = false;
    }

}