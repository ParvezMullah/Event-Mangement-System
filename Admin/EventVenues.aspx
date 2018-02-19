<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AdminMaster.master" CodeFile="EventVenues.aspx.cs" Inherits="Admin_EventVenues" %>

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
    <center> <h1 class="bg-success">Manage Venues</h1> </center>
    <div style="margin-left:auto;margin-right:auto;">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="VenueId" DataSourceID="SqlDataSource1" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" ShowFooter="True" OnRowDataBound="GridView1_RowDataBound">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                       &nbsp;<asp:LinkButton ID="LinkButton2" runat="server"  CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton3" runat="server"  CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VenueId" InsertVisible="False" SortExpression="VenueId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("VenueId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("VenueId") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="lblInsert" OnClick="lblInsert_Click" ValidationGroup="INSERT" runat="server">Insert</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VenueName" SortExpression="VenueName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("VenueName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rEditT1" runat="server" ErrorMessage="VenueName is Required" Text="*" ControlToValidate="TextBox1" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>                        
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("VenueName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtVenueName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rInsertVn" runat="server" ValidationGroup="INSERT" ErrorMessage="VenueName is Required" Text="*" ControlToValidate="txtVenueName" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VenueAddress" SortExpression="VenueAddress">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("VenueAddress") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rEditT2" runat="server" ErrorMessage="VenueAddress is Required" Text="*" ControlToValidate="TextBox2" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("VenueAddress") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="txtVenueAddress" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rEditVA" runat="server" ValidationGroup="INSERT" ErrorMessage="VenueName is Required" Text="*" ControlToValidate="txtVenueAddress" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VenueCharge" SortExpression="VenueCharge">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("VenueCharge") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rEditT3" runat="server" ErrorMessage="VenueCharge is Required" Text="*" ControlToValidate="TextBox3" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("VenueCharge") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="txt" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rEditVC" runat="server" ValidationGroup="INSERT" ErrorMessage="VenueName is Required" Text="*" ControlToValidate="txtVenueCharge" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    
                    </FooterTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="txtVenueCharge" runat="server" TextMode="Number"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="INSERT" ErrorMessage="VenueName is Required" Text="*" ControlToValidate="txtVenueCharge" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RoyalFoodCharge" SortExpression="RoyalFoodCharge">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("RoyalFoodCharge") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rEditT4" runat="server" ErrorMessage="VenueName is Required" Text="*" ControlToValidate="TextBox4" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("RoyalFoodCharge") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="txtRoyalFoodCharge" runat="server" TextMode="Number"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rEditRFC" runat="server" ValidationGroup="INSERT" ErrorMessage="VenueName is Required" Text="*" ControlToValidate="txtRoyalFoodCharge" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PremiumFoodCharge" SortExpression="PremiumFoodCharge">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("PremiumFoodCharge") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rEditT5" runat="server" ErrorMessage="PremiumFoodCharge is Required" Text="*" ControlToValidate="TextBox5" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("PremiumFoodCharge") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="txtPremiumFoodCharge" runat="server" TextMode="Number"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rEditTPFC" runat="server" ValidationGroup="INSERT" ErrorMessage="PremiumFoodCharge is Required" Text="*" ControlToValidate="txtPremiumFoodCharge" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="NormalFoodCharge" SortExpression="NormalFoodCharge">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("NormalFoodCharge") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rEditT6" runat="server" ErrorMessage="VenueName is Required" Text="*" ControlToValidate="TextBox6" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("NormalFoodCharge") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="txtNormalFoodCharge" runat="server" TextMode="Number"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rEditTNFC" runat="server" ValidationGroup="INSERT" ErrorMessage="VenueName is Required" Text="*" ControlToValidate="txtNormalFoodCharge" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RoyalDecorationCharge" SortExpression="RoyalDecorationCharge">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("RoyalDecorationCharge") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rEditT7" runat="server" ErrorMessage="VenueName is Required" Text="*" ControlToValidate="TextBox7" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("RoyalDecorationCharge") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="txtRoyalDecorationCharge" runat="server" TextMode="Number"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rEditTRDC" runat="server" ValidationGroup="INSERT" ErrorMessage="VenueName is Required" Text="*" ControlToValidate="txtRoyalDecorationCharge" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PremiumDecorationCharge" SortExpression="PremiumDecorationCharge">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("PremiumDecorationCharge") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rEditT8" runat="server" ErrorMessage="VenueName is Required" Text="*" ControlToValidate="TextBox8" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("PremiumDecorationCharge") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="txtPremiumDecorationCharge" runat="server" TextMode="Number"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rEditPDC" runat="server" ValidationGroup="INSERT" ErrorMessage="VenueName is Required" Text="*" ControlToValidate="txtPremiumDecorationCharge" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="NormalDecorationCharge" SortExpression="NormalDecorationCharge">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("NormalDecorationCharge") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rEditT9" runat="server" ErrorMessage="VenueName is Required" Text="*" ControlToValidate="TextBox9" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("NormalDecorationCharge") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="txtNormalDecorationCharge" runat="server" TextMode="Number"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rEditNDC" runat="server" ValidationGroup="INSERT" ErrorMessage="VenueName is Required" Text="*" ControlToValidate="txtNormalDecorationCharge" ForeColor="Red" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EventManagementDbConnectionString %>" DeleteCommand="DELETE FROM [tblVenues] WHERE [VenueId] = @VenueId" InsertCommand="INSERT INTO [tblVenues] ([VenueName], [VenueAddress], [VenueCharge], [RoyalFoodCharge], [PremiumFoodCharge], [NormalFoodCharge], [RoyalDecorationCharge], [PremiumDecorationCharge], [NormalDecorationCharge]) VALUES (@VenueName, @VenueAddress, @VenueCharge, @RoyalFoodCharge, @PremiumFoodCharge, @NormalFoodCharge, @RoyalDecorationCharge, @PremiumDecorationCharge, @NormalDecorationCharge)" SelectCommand="SELECT [VenueId], [VenueName], [VenueAddress], [VenueCharge], [RoyalFoodCharge], [PremiumFoodCharge], [NormalFoodCharge], [RoyalDecorationCharge], [PremiumDecorationCharge], [NormalDecorationCharge] FROM [tblVenues] ORDER BY [VenueId]" UpdateCommand="UPDATE [tblVenues] SET [VenueName] = @VenueName, [VenueAddress] = @VenueAddress, [VenueCharge] = @VenueCharge, [RoyalFoodCharge] = @RoyalFoodCharge, [PremiumFoodCharge] = @PremiumFoodCharge, [NormalFoodCharge] = @NormalFoodCharge, [RoyalDecorationCharge] = @RoyalDecorationCharge, [PremiumDecorationCharge] = @PremiumDecorationCharge, [NormalDecorationCharge] = @NormalDecorationCharge WHERE [VenueId] = @VenueId">
            <DeleteParameters>
                <asp:Parameter Name="VenueId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="VenueName" Type="String" />
                <asp:Parameter Name="VenueAddress" Type="String" />
                <asp:Parameter Name="VenueCharge" Type="Int32" />
                <asp:Parameter Name="RoyalFoodCharge" Type="Int32" />
                <asp:Parameter Name="PremiumFoodCharge" Type="Int32" />
                <asp:Parameter Name="NormalFoodCharge" Type="Int32" />
                <asp:Parameter Name="RoyalDecorationCharge" Type="Int32" />
                <asp:Parameter Name="PremiumDecorationCharge" Type="Int32" />
                <asp:Parameter Name="NormalDecorationCharge" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="VenueName" Type="String" />
                <asp:Parameter Name="VenueAddress" Type="String" />
                <asp:Parameter Name="VenueCharge" Type="Int32" />
                <asp:Parameter Name="RoyalFoodCharge" Type="Int32" />
                <asp:Parameter Name="PremiumFoodCharge" Type="Int32" />
                <asp:Parameter Name="NormalFoodCharge" Type="Int32" />
                <asp:Parameter Name="RoyalDecorationCharge" Type="Int32" />
                <asp:Parameter Name="PremiumDecorationCharge" Type="Int32" />
                <asp:Parameter Name="NormalDecorationCharge" Type="Int32" />
                <asp:Parameter Name="VenueId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </asp:Content>
