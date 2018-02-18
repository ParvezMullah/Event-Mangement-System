using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class User_EventBooking : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            string query = "select distinct EventType from tblVenueType";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmdEventType = new SqlCommand(query, conn);
                conn.Open();
                ddlEvent.DataSource = cmdEventType.ExecuteReader();
                ddlEvent.DataTextField = "EventType";
                ddlEvent.DataValueField = "EventType";
                ddlEvent.DataBind();
                ListItem li = new ListItem("--Select Event Type--", "-1");
                ddlEvent.Items.Insert(0, li);
            }
        }
    }
    protected void ddlEvent_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Visible = false;
        string query = "select distinct VenueName from tblVenueType where EventType = @EventType";
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            SqlCommand cmdVenue = new SqlCommand(query, conn);
            cmdVenue.Parameters.AddWithValue("EventType", ddlEvent.SelectedItem.ToString());
            conn.Open();
            ddlVenue.DataSource = cmdVenue.ExecuteReader();
            ddlVenue.DataTextField = "VenueName";
            ddlVenue.DataValueField = "VenueName";
            ddlVenue.DataBind();
            ListItem li = new ListItem("--Select Venue--", "-1");
            ddlVenue.Items.Insert(0, li);
        }
    }
    protected void btnPrice_Click(object sender, EventArgs e)
    {
        Label1.Visible = true;
        int totalCost = 0;
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select top 1 * from tblVenues where VenueName = @VenueName"))
            {
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("VenueName", ddlVenue.SelectedItem.ToString());
                conn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    if(sdr.Read())
                    {
                        int venueCharge = Convert.ToInt32(sdr["VenueCharge"]);
                        int foodCharge = Convert.ToInt32(sdr[ddlFood.SelectedValue.ToString()]);
                        int decorationCharge = Convert.ToInt32(sdr[ddlDecoration.SelectedValue.ToString()]);
                        totalCost = venueCharge + foodCharge + decorationCharge;
                        totalCost += totalCost * (Convert.ToInt32(ddlQuantity.SelectedItem.ToString()))/1000;
                    }
                    Label1.Text ="Total Cost  Will Be " + totalCost.ToString() + " Rs.";
                    Label1.Visible = true;
                }
                conn.Close();
            }           
        }
    }
}