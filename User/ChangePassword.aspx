<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="User_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <marquee behavior="alternate"><h1>Change Password</h1></marquee>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="input-lg form-control" placeholder="Old Password" TextMode="Password" OnTextChanged="txtCurrentPassword_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCurrentPassword" ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator>
                <asp:Label ID="lblError" runat="server" Text="Incorrect Current Password" CssClass=" alert-danger" Visible="false"></asp:Label>
                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="input-lg form-control" placeholder="New Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red" ControlToValidate="txtNewPassword" ErrorMessage="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtNewPassword"
                    CssClass="text-danger" ErrorMessage="Minimum 8 characters at least 1 Alphabet and 1 Number" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" />
                <asp:TextBox ID="txtReEnterOldPassword" runat="server" CssClass="input-lg form-control" placeholder="Re-Enter New Password" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtReEnterOldPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="red" ControlToValidate="txtReEnterOldPassword" ErrorMessage="*" SetFocusOnError="true"></asp:RequiredFieldValidator><br />
                <asp:Button ID="btnChange" runat="server" class="col-xs-12 btn btn-primary btn-load btn-lg" data-loading-text="Changing Password..." Text="Change Password" OnClick="btnChange_Click" />
            </div>
        </div>
    </div>
</asp:Content>

