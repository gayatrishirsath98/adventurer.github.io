﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="CustomerwiseReport.aspx.cs" Inherits="CustomerwiseReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script>
        function PrintReport() {
            var getpanel = document.getElementById("<%=Panel2.ClientID%>");
            var MainWindow = window.open('', '', 'height=500,width=800');
            MainWindow.document.write('<html><head><title>Customer Order Report</title>')
              MainWindow.document.write('</head><body><center>');
            MainWindow.document.write(getpanel.innerHTML);
            MainWindow.document.write('</center></body></html>');
            MainWindow.document.close();
            setTimeout(function () {
                MainWindow.print();
            }, 500);
            return false;

        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <form runat="server" id="form1">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <br />
                <h4 style="color:crimson;text-align:center">Customer Order Report </h4><br />
                <asp:DropDownList ID="DropDownList1" class="form-control pro-edt-select form-control-primary" runat="server" AppendDataBoundItems="True" DataValueField="Cust_name" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" required="true">
                    <asp:ListItem Value="0">-- Select Customer--</asp:ListItem>

                </asp:DropDownList>

                <asp:TextBox ID="txt_custid" runat="server" Visible="false"></asp:TextBox>

            </div>
            <div class="col-md-3"></div>
        </div>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <br />
                <asp:Panel ID="Panel2" runat="server">

                    <br />
                     <p>
                   <b> <asp:Label ID="Label1" runat="server" Text="Total Orders : "></asp:Label></b>
                    <asp:Label ID="lbl_count" runat="server"></asp:Label>
                    </p>
                    <asp:GridView ID="GridView1" runat="server" Height="315px" Width="1092px" HorizontalAlign="Justify" CellPadding="3" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" GridLines="Vertical">
                        <Columns>
                            <asp:BoundField DataField="Order_id" HtmlEncode="False" DataFormatString="<a href='ViewOrderDetail.aspx?code={0}'>View Details</a>" />
                        </Columns>
                        <EditRowStyle Font-Size="Medium" Height="40px" />
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Font-Size="Large" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" Width="40px" Wrap="True" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" Font-Size="Medium" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" Width="40px" />
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" Font-Size="Large" ForeColor="White" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                    <br />
                    <br />
                </asp:Panel>
                <br />
                <div class="row center">
                    <asp:Button runat="server" ID="btn_print" CssClass="btn-success" OnClientClick="return PrintReport()();" Text="Print" />

                </div>
            </div>
            <div class="col-md-1"></div>
        </div>


      
    </form>
    <br />
    <br />
    <br />
</asp:Content>

