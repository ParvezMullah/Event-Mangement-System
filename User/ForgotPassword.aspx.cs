using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net;
using System.Collections.Specialized;

public partial class User_ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void txtMobile_TextChanged(object sender, EventArgs e)
    {
        lblError.Visible = false;
    }
    protected void btnChange_Click(object sender, EventArgs e)
    {
        string pass = "";
        double mobile = Convert.ToDouble(txtMobile.Text.ToString());
        string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "Select Password from tblUser where mobile =@mobile";            
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("mobile", mobile);
                try
                {
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        pass = ds.Tables[0].Rows[0]["password"].ToString();
                        sendpassword(mobile, pass);                        
                    }
                    else
                    {
                        lblError.Text = "Mobile Number Does Not Exists!";
                        lblError.ForeColor = System.Drawing.Color.Red;
                        lblError.Visible = true;
                    }
                }
                catch(Exception exc)
                {
                    Response.Write(exc.Message);
                }
                finally
                {
                    conn.Close();
                }
            }
        }

    }

    private void sendpassword(double mobileno, String password1)
    {

        string message = "Hi " + " , Your Password is " + password1 + " .(Chinmay Events)";

        String message1 = HttpUtility.UrlEncode(message);
        using (var wb = new WebClient())
        {
            byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
                {
                {"apikey" , "FammnpFW0Ks-gRKkiQvnke2nG940NkDbbl4jUV4elK"},
                {"numbers" , mobileno.ToString()},
                {"message" , message1},
                {"sender" , "TXTLCL"}
                });
            string result = System.Text.Encoding.UTF8.GetString(response);
            string mobilelast = "*******" + (mobileno.ToString()).Substring(8);
            lblError.Text = "Your Password Has Been Sent to Registered Mobile Number " + mobileno;
            lblError.ForeColor = System.Drawing.Color.Green;
            lblError.Visible = true;
        }
    }
}