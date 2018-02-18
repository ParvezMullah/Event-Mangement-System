using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class User_BookingHistory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserMobile"] == null)
        {
            Response.Redirect("~/default.aspx");
        }
        if (!IsPostBack)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            string query = "select EventType,VenueName,VenueAddress,EventDate,FoodType,DecorationType,TotalCost from tblEventBooking where mobile=@mobile order by EVentId";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("mobile", Session["UserMobile"]);
                conn.Open();
                try
                {
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                }
                catch(Exception ex)
                {
                    Response.Write(ex.Message);
                }
                finally
                {
                    conn.Close();
                }
                
            }
        }
    }
}