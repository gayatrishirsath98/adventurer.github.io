<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="DailyReport.aspx.cs" Inherits="DailyReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


     <script>
        function PrintReport() {
            var getpanel = document.getElementById("<%=Panel2.ClientID%>");
            var MainWindow = window.open('', '', 'height=500,width=800');
            MainWindow.document.write('<html><head><title>Daily Order Report</title>')
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
                <h4 style="color:crimson;text-align:center">Daily Order Report </h4><br />
                <div class="row">
                    <div class="col-md-4">
                        
                    </div>
                    <div class="col-md-4">
                         <asp:label runat="server" text=" Date"></asp:label>
                         <asp:textbox runat="server" ID="txt_date" required="true" placeholder="DD/MM/YYYY"></asp:textbox>
                    </div>
                    <div class="col-md-4">
                       
                            </div>
                         <div class="center">
                             
                         <asp:Button ID="btn_show" CssClass="btn-default" runat="server" Text="Show" OnClick="btn_show_Click"  />
                             </div>
                
                </div>

               

            </div>
            <div class="col-md-1"></div>
        </div>
               

           
        
         <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <br />
                <asp:Panel ID="Panel2" runat="server">

                    <br />
     <asp:GridView ID="GridView1" runat="server" Height="315px" Width="1092px" HorizontalAlign="Justify" CellPadding="3" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" GridLines="Vertical" AllowSorting="True">
                        <Columns>
                            <asp:BoundField DataField="Order_id" HtmlEncode="False" DataFormatString="<a href='ViewDatewiseDetail.aspx?code={0}'>View Details</a>" />
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
    <br /><br /><br />
    
</form>
</asp:Content>

