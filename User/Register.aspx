<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account.</h4>
        <hr />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Mobile" CssClass="col-md-2 control-label">Mobile Number</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Mobile" CssClass="form-control"/>
                <asp:Label ID="lblmsg" runat="server" Visible="false"></asp:Label>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Mobile"
                    CssClass="text-danger" ErrorMessage="The Mobile field is required." /><br />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="Mobile"
                    CssClass="text-danger" ErrorMessage="Must be 10 digit,numeric and must start with 9,8 or 7" ValidationExpression="^[789]\d{9}$" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 control-label">Full Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Name" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                    CssClass="text-danger" ErrorMessage="The Name field is required." /><br>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="Name"
                    CssClass="text-danger" ErrorMessage="Should Contain Only Alphabet and Space" ValidationExpression="[a-zA-Z ]*$" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." /><br>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="Minimum 8 characters at least 1 Alphabet and 1 Number" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="Button1" runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />                 
            </div>
        </div>
    </div>
</asp:Content>

