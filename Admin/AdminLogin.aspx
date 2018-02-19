<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="AdminLogin.aspx.cs" Inherits="Admin_AdminLogin" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
     <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                  <center> <h4>Admin log in.</h4></center>  
                    <hr />
                    
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" AssociatedControlID="txtUserName" CssClass="col-md-2 control-label">Admin ID</asp:Label>
                        <div class="col-md-10">
                            <asp:Label ID="FailureText" runat="server" Text="Invalid Credentials!" ForeColor="Red" Visible="false"></asp:Label>
                            <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control" OnTextChanged="txtUserName_TextChanged" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                                CssClass="text-danger" ErrorMessage="The Id field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" AssociatedControlID="txtPassword" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" OnTextChanged="txtPassword_TextChanged" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button ID="tbnLogin" runat="server" OnClick="btnLogin_Click" Text="Log in" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
            </section>
        </div>

    </div>
   
</asp:Content>
