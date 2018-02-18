<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Contact Us</h3>
    <address>
        Chinmay Tower<br />
        Kanjurmarg, Mumbai 400079<br />
        <abbr title="Phone">P:</abbr>
        022-02565925
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@ChinmayEvents.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@ChinmayEvents.com</a>
    </address>
</asp:Content>
