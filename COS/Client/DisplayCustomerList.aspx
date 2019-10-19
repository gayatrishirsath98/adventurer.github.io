<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="DisplayCustomerList.aspx.cs" Inherits="DisplayCustomerList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
        function PrintReport() {
            var getpanel = document.getElementById("<%=Panel2.ClientID%>");
            var MainWindow = window.open('', '', 'height=500,width=800');
            MainWindow.document.write('<html><head><title>Datewise Order Report</title>')
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <br /><br /><br />
    <form id="form1" runat="server">
            <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <br />
                
                <h4 style="color:crimson;text-align:center">Customer List </h4>
                <asp:Panel ID="Panel2" runat="server">
      
                            <p>
                   <b> <asp:Label ID="Label1" runat="server" Text="Total Customer : "></asp:Label></b>
                    <asp:Label ID="lbl_count" runat="server"></asp:Label>
                    </p>
                            
                    
                    
     <asp:GridView ID="GridView1" runat="server" Height="315px" Width="1092px" HorizontalAlign="Justify" CellPadding="3" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" GridLines="Vertical" AllowSorting="True">
                        
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
    <br /><br /><br />
    
</form>
</asp:Content>

