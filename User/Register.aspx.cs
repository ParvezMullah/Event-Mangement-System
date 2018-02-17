using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using EventManagementSystem;
using System.Data.SqlClient;
using System.Configuration;

public partial class Account_Register : Page
{
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        long mobile = Convert.ToInt64(Mobile.Text);
        string password = Password.Text.ToString();
        string name = Name.Text.ToString();
        SqlConnection conn = new SqlConnection(connectionString);
        try
        {
            string isExist = "select count(mobile) from tblUser where mobile = @mobile";
            SqlCommand cmd1 = new SqlCommand(isExist, conn);
            cmd1.Parameters.AddWithValue("mobile", mobile);
            conn.Open();
            int count = Convert.ToInt32(cmd1.ExecuteScalar());
            if (count == 0)
            {
                string insert = "insert into tblUser values(@mobile,@FullName,@Password)";
                SqlCommand cmd2 = new SqlCommand(insert, conn);
                cmd2.Parameters.AddWithValue("mobile", mobile);
                cmd2.Parameters.AddWithValue("FullName",name );
                cmd2.Parameters.AddWithValue("Password", password);
                cmd2.ExecuteNonQuery();
                lblmsg.Text = "Registration Successful!";
                lblmsg.ForeColor = System.Drawing.Color.Green;
                lblmsg.Visible = true;
            }
            else
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "User Already exists!";
               lblmsg.Visible = true;
            }

        }
        catch(Exception ex){
            lblmsg.Text = ex.Message;
            lblmsg.Visible = true;
        }
        finally
        {
            conn.Close();
        }
    }
 
}