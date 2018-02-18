<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UserMaster.master" CodeFile="EventBooking.aspx.cs" Inherits="User_EventBooking" %>


<asp:content id="Content2" contentplaceholderid="MainContent" runat="Server">
      <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css" />

    <div style="margin-left:auto;margin-right:auto;">
        <table class="table">
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False" Font-Bold="true"></asp:Label></td>
            </tr>
            <tr>
                <td>Select The Event</td>
                <td>
                    <asp:DropDownList ID="ddlEvent" runat="server" CssClass="form-control"  AutoPostBack="True" ValidationGroup="g1" OnSelectedIndexChanged="ddlEvent_SelectedIndexChanged"></asp:DropDownList>

                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="g1" ControlToValidate="ddlEvent" ErrorMessage="*" ForeColor="Red" InitialValue="-1" ToolTip="true"></asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr>
                <td>Select The Venue</td>
                <td>
                    <asp:DropDownList ID="ddlVenue" runat="server" CssClass="form-control" ValidationGroup="g1">
                        <asp:ListItem Selected="True" Value="-1">--Select Venue--</asp:ListItem>
                    </asp:DropDownList>

                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ValidationGroup="g1" InitialValue="-1" ErrorMessage="*" ControlToValidate="ddlVenue" ForeColor="Red" ToolTip="true"></asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr>
                <td>Select The Event Date</td>
                <td>
                    <asp:TextBox ID="ddlDate" runat="server" CssClass="form-control" placeholder="MM/dd/yyyy" ValidationGroup="g1" OnTextChanged="ddlDate_TextChanged" TextMode="Date"></asp:TextBox>

                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ValidationGroup="g1" ControlToValidate="ddlDate" ErrorMessage="*" SetFocusOnError="true" ForeColor="Red" ToolTip="true"></asp:RequiredFieldValidator>
                    
                </td>
            </tr>
            <tr>
                <td>Select The Attendant Quantity</td>
                <td>
                    <asp:DropDownList ID="ddlQuantity" runat="server" CssClass="form-control" ValidationGroup="g1">
                        <asp:ListItem Value="-1">--Select Attendant Quantity--</asp:ListItem>
                        <asp:ListItem>200</asp:ListItem>
                        <asp:ListItem>400</asp:ListItem>
                        <asp:ListItem>600</asp:ListItem>
                       
                    </asp:DropDownList>

                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="g1" InitialValue="-1" ControlToValidate="ddlQuantity" ErrorMessage="*" ForeColor="Red" ToolTip="true"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Select The Food Type</td>
                <td>
                    <asp:DropDownList ID="ddlFood" runat="server" CssClass="form-control" ValidationGroup="g1">
                         <asp:ListItem Selected="True" Value="-1">--Select Food Type--</asp:ListItem>
                        <asp:ListItem Value="RoyalFoodCharge">Royal</asp:ListItem>
                        <asp:ListItem Value="PremiumFoodCharge">Premium</asp:ListItem>
                        <asp:ListItem Value="NormalFoodCharge">Normal</asp:ListItem>
                    </asp:DropDownList>

                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="g1" InitialValue="-1" ControlToValidate="ddlFood" ErrorMessage="*" ForeColor="Red" ToolTip="true"></asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr>
                <td>Select The Decoration Type</td>
                <td>
                    <asp:DropDownList ID="ddlDecoration" runat="server" CssClass="form-control" ValidationGroup="g1">
                         <asp:ListItem Selected="True" Value="-1">--Select Decoration Type--</asp:ListItem>
                        <asp:ListItem Value="RoyalDecorationCharge">Royal</asp:ListItem>
                        <asp:ListItem Value="PremiumDecorationCharge">Premium</asp:ListItem>
                        <asp:ListItem Value="NormalDecorationCharge">Normal</asp:ListItem>
                    </asp:DropDownList>

                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="g1" InitialValue="-1" ControlToValidate="ddlDecoration" ErrorMessage="*" ForeColor="Red" ToolTip="true"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnProceed" runat="server" CssClass="btn btn-primary" Text="Proceed" ValidationGroup="g1" OnClick="btnProceed_Click"/>                   
                </td>
                <td>
                    <asp:Button ID="btnPrice" runat="server" CssClass="btn btn-info" Text="CalculatePrice" OnClick="btnPrice_Click" ValidationGroup="g1" />
                </td>
            </tr>
        </table>
    </div>
        <div style="margin-left:auto;margin-right:auto;">
            <asp:Panel id="panel1" runat="server" Visible="false">
                <table class="table">
                    <tr>
                        <td>Select Bank</td>
                        <td>
                            <asp:DropDownList ID="ddlBank" runat="server" CssClass="form-control" ValidationGroup="g2" style="margin-left: 0px">
                                <asp:ListItem Selected="True" Value="-1">--Select Your Bank--</asp:ListItem>
                                <asp:ListItem>State Bank Of India</asp:ListItem>
                                <asp:ListItem>Axis Bank</asp:ListItem>
                                <asp:ListItem>HDFC Bank</asp:ListItem>
                                <asp:ListItem>Indian Bank</asp:ListItem>
                                <asp:ListItem>Kotak Mahindra Bank</asp:ListItem>
                            </asp:DropDownList></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="g2" InitialValue="-1" ControlToValidate="ddlBank" ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>Select Card</td>
                        <td>
                            <asp:DropDownList ID="ddlCard" runat="server" CssClass="form-control" ValidationGroup="g2" style="margin-left: 1px">
                                <asp:ListItem Selected="True" Value="-1">--Select Your Card--</asp:ListItem>
                                <asp:ListItem>Visa Card</asp:ListItem>
                                <asp:ListItem>maestro</asp:ListItem>
                                <asp:ListItem>RuPay</asp:ListItem>
                            </asp:DropDownList></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="g2" InitialValue="-1" ControlToValidate="ddlCard" ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator></td>
                    </tr>
                       <tr>
                           <td class="auto-style1">
                               Enter Your Full Name
                           </td>
                           <td>
                               <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Your Full Name" ValidationGroup="g2"></asp:TextBox>
                           </td>
                           <td>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="g2" ControlToValidate="txtName" ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator>
                           </td>
                       </tr>
                    <tr>
                        <td>
                            Enter Card Information
                        </td>
                        <td>
                            <asp:TextBox ID="txtCard" runat="server" CssClass="form-control" ValidationGroup="g2" placeholder="Enter the card Number" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="g2" runat="server" ControlToValidate="txtCard" ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCsv" runat="server" ValidationGroup="g2" CssClass="form-control" placeholder="Enter the CVV number" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="g2" ControlToValidate="txtCsv" ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator>
                        </td>                      
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnBook" runat="server" CssClass="btn btn-success btn-lg" Text="Book" ValidationGroup="g2" OnClick="btnBook_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
</asp:content>