using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_EventVenues : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            Response.Redirect("AdminLogin.aspx");
        }
    }
    protected void lblInsert_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["VenueName"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtVenueName")).Text;
        SqlDataSource1.InsertParameters["VenueAddress"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtVenueAddress")).Text;
        SqlDataSource1.InsertParameters["VenueCharge"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtVenueCharge")).Text;
        SqlDataSource1.InsertParameters["RoyalFoodCharge"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtRoyalFoodCharge")).Text;
        SqlDataSource1.InsertParameters["PremiumFoodCharge"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtPremiumFoodCharge")).Text;
        SqlDataSource1.InsertParameters["NormalFoodCharge"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtNormalFoodCharge")).Text;
        SqlDataSource1.InsertParameters["RoyalDecorationCharge"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtRoyalDecorationCharge")).Text;
        SqlDataSource1.InsertParameters["PremiumDecorationCharge"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtPremiumDecorationCharge")).Text;
        SqlDataSource1.InsertParameters["NormalDecorationCharge"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtNormalDecorationCharge")).Text;
        SqlDataSource1.Insert();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lb = (LinkButton)e.Row.FindControl("LinkButton3");
            if(lb != null)
            {
                lb.Attributes.Add("onclick", "return confirm('Are you sure to delete record with Venue Name = "
                                + DataBinder.Eval(e.Row.DataItem, "VenueName") + "');");
            }
        }
    }
}