<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="BookingHistory.aspx.cs" Inherits="Admin_BookingHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=GridView1]').footable();
        });
    </script>
    <style>
        #custom-search-input {
            padding: 3px;
            border: solid 1px #E4E4E4;
            border-radius: 6px;
            background-color: #fff;
        }

            #custom-search-input input {
                border: 0;
                box-shadow: none;
            }

            #custom-search-input button {
                margin: 2px 0 0 0;
                background: none;
                box-shadow: none;
                border: 0;
                color: #666666;
                padding: 0 8px 0 10px;
                border-left: solid 1px #ccc;
            }

                #custom-search-input button:hover {
                    border: 0;
                    box-shadow: none;
                    border-left: solid 1px #ccc;
                }

            #custom-search-input .glyphicon-search {
                font-size: 23px;
            }
    </style>
    <div class="container" style="margin: 25px 50px;">
        <center>  <h2>Custom search field</h2> </center>
        <div class="row">
            <div class="col-md-6">
                <div id="custom-search-input">
                    <div class="input-group col-md-12">
                        <asp:TextBox ID="txtSearchByMobile" ValidationGroup="m" runat="server" class="form-control input-lg" TextMode="Number" MaxLength="10" placeholder="Search By Mobile"></asp:TextBox>
                        <span class="input-group-btn">
                            <asp:Button ID="btnSearch" runat="server" ValidationGroup="m" class="btn btn-info btn-lg" Text="Search" OnClick="btnSearch_Click" />
                        </span>
                    </div>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSearchByMobile" ValidationGroup="m" ErrorMessage="" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddlVenue" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlVenue_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddlEventCategory" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlEventCategory_SelectedIndexChanged"></asp:DropDownList>
            </div>
        </div>
    </div>
    <asp:GridView ID="GridView1" runat="server" CssClass="footable" CellPadding="3" GridLines="None" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
</asp:Content>

