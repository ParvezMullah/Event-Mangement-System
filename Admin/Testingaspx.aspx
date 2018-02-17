<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Testingaspx.aspx.cs" Inherits="Admin_Testingaspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="EventTypeName" DataValueField="EventTypeName">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EventManagementDbConnectionString %>" SelectCommand="SELECT [EventTypeName] FROM [EventCategory]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
