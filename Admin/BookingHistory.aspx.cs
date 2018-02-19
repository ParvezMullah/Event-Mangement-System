using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class Admin_BookingHistory : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            Response.Redirect("AdminLogin.aspx");
        }
        if (!IsPostBack)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            string query = "select top 10 EventType,VenueName,VenueAddress,EventDate,FoodType,DecorationType,TotalCost from tblEventBooking order by EVentId";
            string fillVenues = "select distinct VenueName,VenueId from tblVenues order by VenueName";
            string fillEventCategory = "select * from tblEventCategory";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlCommand cmd2 = new SqlCommand(fillVenues, conn);
                SqlCommand cmd3 = new SqlCommand(fillEventCategory, conn);
                try
                {
                    conn.Open();
                    ddlVenue.DataSource = cmd2.ExecuteReader();
                    ddlVenue.DataTextField = "VenueName";
                    ddlVenue.DataValueField = "VenueId";
                    ddlVenue.DataBind();
                    ListItem li = new ListItem("--Select Venue--", "-1");
                    ddlVenue.Items.Insert(0, li);
                    conn.Close();
                    conn.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                    conn.Close();
                    conn.Open();
                    ddlEventCategory.DataSource = cmd3.ExecuteReader();
                    ddlEventCategory.DataTextField = "EventTypeName";
                    ddlEventCategory.DataValueField = "Id";
                    ddlEventCategory.DataBind();
                    ListItem ll = new ListItem("--Select Event Category--", "-1");
                    ddlEventCategory.Items.Insert(0, ll);
                    conn.Close();
                }
                catch (Exception ex)
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
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        string query = "select top 10 EventType,VenueName,VenueAddress,EventDate,FoodType,DecorationType,TotalCost from tblEventBooking where mobile=@mobile order by EVentId";
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("mobile", Convert.ToDouble(txtSearchByMobile.Text));
            try
            {
                conn.Open();
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
    protected void ddlVenue_SelectedIndexChanged(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        string query = "select top 10 EventType,VenueName,VenueAddress,EventDate,FoodType,DecorationType,TotalCost from tblEventBooking where VenueName=@VenueName order by EVentId";
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("VenueName", ddlVenue.SelectedItem.ToString());
            try
            {
                conn.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
    }
    protected void ddlEventCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        string query = "select top 10 EventType,VenueName,VenueAddress,EventDate,FoodType,DecorationType,TotalCost from tblEventBooking where EventType=@EventType order by EVentId";
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("EventType", ddlEventCategory.SelectedItem.ToString());
            try
            {
                conn.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
            }
            catch (Exception ex)
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