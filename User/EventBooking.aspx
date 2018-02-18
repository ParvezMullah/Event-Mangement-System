<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EventBooking.aspx.cs" Inherits="User_EventBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 185px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="form-inline">
    <div style="margin-left:auto;margin-right:auto;">
        <table>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False" Font-Bold></asp:Label></td>
            </tr>
            <tr>
                <td>Select The Event</td>
                <td>
                    <asp:DropDownList ID="ddlEvent" runat="server" AutoPostBack="True" ValidationGroup="g1" OnSelectedIndexChanged="ddlEvent_SelectedIndexChanged"></asp:DropDownList>

                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="g1" ControlToValidate="ddlEvent" ErrorMessage="*" ForeColor="Red" InitialValue="-1" ToolTip="true"></asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr>
                <td>Select The Venue</td>
                <td>
                    <asp:DropDownList ID="ddlVenue" runat="server" ValidationGroup="g1">
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
                    <asp:TextBox ID="ddlDate" runat="server" placeholder="MM/dd/yyyy" ValidationGroup="g1" OnTextChanged="ddlDate_TextChanged"></asp:TextBox>

                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ValidationGroup="g1" ControlToValidate="ddlDate" ErrorMessage="*" SetFocusOnError="true" ForeColor="Red" ToolTip="true"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="g1" ControlToValidate="ddlDate" SetFocusOnError="true" ErrorMessage="Date should be in MM/dd/yyyy format" ForeColor="Red" ValidationExpression="^(0?[1-9]|1[0-2])/(0?[1-9]|1[0-9]|2[0-9]|3[01])/\d{4}$"></asp:RegularExpressionValidator>
                    
                </td>
            </tr>
            <tr>
                <td>Select The Attendant Quantity</td>
                <td>
                    <asp:DropDownList ID="ddlQuantity" runat="server" ValidationGroup="g1">
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
                    <asp:DropDownList ID="ddlFood" runat="server" ValidationGroup="g1">
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
                    <asp:DropDownList ID="ddlDecoration" runat="server" ValidationGroup="g1">
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
                    <asp:Button ID="btnProceed" runat="server" Text="Proceed" ValidationGroup="g1" OnClick="btnProceed_Click"/>                   
                </td>
                <td>
                    <asp:Button ID="btnPrice" runat="server" Text="CalculatePrice" OnClick="btnPrice_Click" ValidationGroup="g1" />
                </td>
            </tr>
        </table>
    </div>
        <div style="margin-left:auto;margin-right:auto;">
            <asp:Panel id="panel1" runat="server" Visible="false">
                <table>
                    <tr>
                        <td>Select Bank</td>
                        <td>
                            <asp:DropDownList ID="ddlBank" runat="server" ValidationGroup="g2" style="margin-left: 0px">
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
                            <asp:DropDownList ID="ddlCard" runat="server" ValidationGroup="g2" style="margin-left: 1px">
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
                               <asp:TextBox ID="txtName" runat="server" placeholder="Enter Your Full Name" ValidationGroup="g2"></asp:TextBox>
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
                            <asp:TextBox ID="txtCard" runat="server" ValidationGroup="g2" placeholder="Enter the card Number" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="g2" runat="server" ControlToValidate="txtCard" ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCsv" runat="server" ValidationGroup="g2" placeholder="Enter the CSV number" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="g2" ControlToValidate="txtCard" ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator>
                        </td>                      
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnBook" runat="server" Text="Book" ValidationGroup="g2" OnClick="btnBook_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>

    </form>
</body>
</html>
