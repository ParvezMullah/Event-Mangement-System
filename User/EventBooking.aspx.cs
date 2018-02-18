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
    static int totalCost = 0;
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
        string query = "select tblVenues.venueName,tblVenues.venueAddress from tblVenues ,tblVenueType where tblVenueType.EventType=@EventType and tblVenues.VenueName=tblVenueType.VenueName";
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            SqlCommand cmdVenue = new SqlCommand(query, conn);
            cmdVenue.Parameters.AddWithValue("EventType", ddlEvent.SelectedItem.ToString());
            conn.Open();
            ddlVenue.DataSource = cmdVenue.ExecuteReader();
            ddlVenue.DataTextField = "VenueName";
            ddlVenue.DataValueField = "VenueAddress";
            ddlVenue.DataBind();
            ListItem li = new ListItem("--Select Venue--", "-1");
            ddlVenue.Items.Insert(0, li);
            conn.Close();
        }
    }
    protected void btnPrice_Click(object sender, EventArgs e)
    {
        Label1.Visible = true;
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
    protected void btnBook_Click(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {           
                    using (SqlCommand cmd1 = new SqlCommand("select top 1 * from tblVenues where VenueName = @VenueName"))
                    {
                        cmd1.Connection = conn;
                        cmd1.Parameters.AddWithValue("VenueName", ddlVenue.SelectedItem.ToString());
                        conn.Open();
                        using (SqlDataReader sdr = cmd1.ExecuteReader())
                        {
                            if (sdr.Read())
                            {
                                int venueCharge = Convert.ToInt32(sdr["VenueCharge"]);
                                int foodCharge = Convert.ToInt32(sdr[ddlFood.SelectedValue.ToString()]);
                                int decorationCharge = Convert.ToInt32(sdr[ddlDecoration.SelectedValue.ToString()]);
                                totalCost = venueCharge + foodCharge + decorationCharge;
                                totalCost += totalCost * (Convert.ToInt32(ddlQuantity.SelectedItem.ToString())) / 1000;
                            }
                            Label1.Text = "Total Cost  Will Be " + totalCost.ToString() + " Rs.";
                            Label1.Visible = true;
                        }
                    }
                    string fullName = "Parvez Mullah";
                    long mobile = 8080808089;
                    string eventType = ddlEvent.SelectedItem.ToString();
                    string eventDate = ddlDate.Text;
                    string venueName = ddlVenue.SelectedItem.ToString();
                    string venueAddress = ddlVenue.SelectedValue.ToString();
                    string foodType = ddlFood.SelectedItem.ToString();
                    string decorationType = ddlDecoration.SelectedItem.ToString();
                    string query = "insert into tblEventBooking values(@fullName,@mobile,@eventType,@eventDate,@venueName,@venueAddress,@foodType,@decorationType,@totalCost)";
                    try
                    {
                        SqlCommand insert = new SqlCommand(query,conn);
                        insert.Parameters.AddWithValue("fullName",fullName);
                        insert.Parameters.AddWithValue("mobile",mobile);
                        insert.Parameters.AddWithValue("eventType",eventType);
                        insert.Parameters.AddWithValue("eventDate",eventDate);
                        insert.Parameters.AddWithValue("venueName",venueName);
                        insert.Parameters.AddWithValue("venueAddress",venueAddress);
                        insert.Parameters.AddWithValue("foodType",foodType);
                        insert.Parameters.AddWithValue("decorationType",decorationType);
                        insert.Parameters.AddWithValue("totalCost", totalCost);
                        insert.ExecuteNonQuery();
                        Label1.Text = "Event Booked Successfully!";
                        Label1.Visible = true;
                        panel1.Visible = false;
                    }
                    catch(Exception ex)
                    {
                        Label1.Text = ex.Message.ToString();
                        Label1.Visible = true;
                    }
                    finally
                    {
                        conn.Close();
                    }
        }
    }
    protected void ddlDate_TextChanged(object sender, EventArgs e)
    {
        Label1.Visible = false;
    }
    protected void btnProceed_Click(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select count(EventId) from tblEventBooking where VenueName = @VenueName and EventDate = @EventDate"))
            {
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("VenueName", ddlVenue.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("EventDate", ddlDate.Text.ToString());
                conn.Open();
                int count;
                try
                {
                    count = Convert.ToInt32(cmd.ExecuteScalar());
                }
                finally
                {
                    conn.Close();
                }
                if (count > 0)
                {
                    Label1.Text = "This Venue Is Booked On The Selected Date.";
                    Label1.Visible = true;
                }
                else
                {
                    panel1.Visible = true;
                }
            }
        }
    }
}