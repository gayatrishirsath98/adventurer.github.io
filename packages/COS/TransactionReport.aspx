<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="TransactionReport.aspx.cs" Inherits="TransactionReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

     <script>
        function PrintReport() {
            var getpanel = document.getElementById("<%=panel1.ClientID%>");
            var MainWindow = window.open('', '', 'height=500,width=800');
            MainWindow.document.write('<html><head><title>Transaction Report</title>')
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
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <asp:Panel ID="panel1" runat="server">
                    <br />
                    <h4 style="color: crimson; text-align: center">Transaction Report </h4>
                    <br />
                    <div class="row">
                        <div class="col-md-6">
                            <asp:Label runat="server" Text="From Date"></asp:Label>
                            <asp:TextBox runat="server" ID="txt_fromdate" required="true"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <asp:Label runat="server" Text="To Date"></asp:Label>
                            <asp:TextBox runat="server" ID="txt_todate" required="true"></asp:TextBox>
                        </div>

                        <div class="col-md-12">
                            <table>
                                <tr>

                                    <td>
                                        <asp:RadioButton ID="rbtn_success" runat="server" GroupName="mode" Text="Success" /></td>
                                    <td>
                                        <asp:RadioButton ID="rbtn_failure" runat="server" GroupName="mode" Text="Failure" /></td>
                                    <td>
                                        <asp:RadioButton ID="rbtn_offline" runat="server" GroupName="mode" Text="Offline" /></td>
                                    <td>
                                        <asp:RadioButton ID="rbtn_online" runat="server" GroupName="mode" Text="Online" /></td>
                                </tr>
                            </table>


                        </div>
                        <br />
                        <div class="center">

                            <asp:Button ID="btn_show" CssClass="btn-default" runat="server" Text="Show" OnClick="btn_show_Click" />
                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-8">
                                <asp:GridView ID="GridView1" runat="server" Height="315px" Width="900px" HorizontalAlign="Justify" CellPadding="3" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" GridLines="Vertical">

                                    <EditRowStyle Font-Size="Medium" Height="40px" />
                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Font-Size="Large" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" Width="40px" Wrap="True" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EEEEEE" Font-Size="Medium" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" Width="20px" />
                                    <AlternatingRowStyle BackColor="#DCDCDC" />
                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" Font-Size="Large" ForeColor="White" />
                                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#000065" />
                                </asp:GridView>
                            </div>
                            <div class="col-md-3"></div>


                        </div>



                    </div>
                    <br /><br />
                     <div class="center">

                            <asp:Button ID="btn_print" CssClass="btn-success" runat="server" Text="Print" OnClientClick="return PrintReport();" />
                        </div>
                </asp:Panel>
            </div>
            <div class="col-md-1"></div>
        </div>
    </form>
    <br />
    <br />
    <br />
</asp:Content>

