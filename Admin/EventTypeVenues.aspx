<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/AdminMaster.master" CodeFile="EventTypeVenues.aspx.cs" Inherits="Admin_EventTypeVenues" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('[id*=GridView1]').footable();
    });
</script>
    <center> <h1 class="bg-success">Manage Event Category and Venue</h1> </center>
    <div>
        <asp:GridView ID="GridView1" runat="server" CssClass="footable" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="VenueTypeId" ShowFooter="True" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VenueTypeId" InsertVisible="False" SortExpression="VenueTypeId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("VenueTypeId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("VenueTypeId") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:LinkButton ID="lblInsert" OnClick="lblInsert_Click" ValidationGroup="INSERT" runat="server">Insert</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VenueName" SortExpression="VenueName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" SelectedValue='<%# Bind("VenueName") %>' DataTextField="VenueName" DataValueField="VenueName">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EventManagementDbConnectionString %>" SelectCommand="SELECT [VenueName] FROM [tblVenues] ORDER BY [VenueName]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("VenueName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="VenueName" DataValueField="VenueName">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EventManagementDbConnectionString %>" SelectCommand="SELECT [VenueName] FROM [tblVenues] ORDER BY [VenueName]"></asp:SqlDataSource>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EventType" SortExpression="EventType">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" SelectedValue='<%# Bind("EventType") %>' DataTextField="EventTypeName" DataValueField="EventTypeName">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EventManagementDbConnectionString %>" SelectCommand="SELECT [EventTypeName] FROM [tblEventCategory]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("EventType") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                         <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="EventTypeName" DataValueField="EventTypeName">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EventManagementDbConnectionString %>" SelectCommand="SELECT [EventTypeName] FROM [tblEventCategory]"></asp:SqlDataSource>
    </div>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EventManagementDbConnectionString %>" DeleteCommand="DELETE FROM [tblVenueType] WHERE [VenueTypeId] = @VenueTypeId" InsertCommand="INSERT INTO [tblVenueType] ([VenueName], [EventType]) VALUES (@VenueName, @EventType)" SelectCommand="SELECT [VenueTypeId], [VenueName], [EventType] FROM [tblVenueType] ORDER BY [VenueName]" UpdateCommand="UPDATE [tblVenueType] SET [VenueName] = @VenueName, [EventType] = @EventType WHERE [VenueTypeId] = @VenueTypeId" >
            <DeleteParameters>
                <asp:Parameter Name="VenueName" Type="String" />
                <asp:Parameter Name="EventType" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="VenueName" Type="String" />
                <asp:Parameter Name="EventType" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="VenueTypeId" Type="Int32" />
                <asp:Parameter Name="VenueName" Type="String" />
                <asp:Parameter Name="EventType" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </asp:content>

