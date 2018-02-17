using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_EventTypeVenues : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lblInsert_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["VenueName"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("DropDownList1")).SelectedValue;
        SqlDataSource1.InsertParameters["EventType"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("DropDownList2")).SelectedValue;
        SqlDataSource1.Insert();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lb = (LinkButton)e.Row.FindControl("LinkButton2");
            if (lb != null)
            {
                lb.Attributes.Add("onclick", "return confirm('Are you sure to delete record with VenueTypeId = "
                                + DataBinder.Eval(e.Row.DataItem, "VenueTypeId") + "');");
            }
        }
    }
}