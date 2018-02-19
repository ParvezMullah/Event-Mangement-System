<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="User_ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <marquee behavior="alternate"><h1>Recover Password</h1></marquee>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <asp:TextBox ID="txtMobile" runat="server" CssClass="input-lg form-control" placeholder="Mobile Number" TextMode="Number" OnTextChanged="txtMobile_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMobile" ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator>
                <asp:Label ID="lblError" runat="server" Text="Mobile Number Does Not Exists!" CssClass=" alert-danger" Visible="false"></asp:Label><br/>
                <asp:Button ID="btnChange" runat="server" class="col-xs-12 btn btn-primary btn-load btn-lg" data-loading-text="Changing Password..." Text="Send Password" OnClick="btnChange_Click" />
             </div>
        </div>
    </div>
</asp:Content>

