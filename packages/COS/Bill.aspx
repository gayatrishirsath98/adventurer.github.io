<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Bill.aspx.cs" Inherits="Bill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        function PrintBill() {
            var getpanel = document.getElementById("<%=Panel1.ClientID%>");
            var MainWindow = window.open('', '', 'height=500,width=800');
            MainWindow.document.write('<html><head><title>Print Bill</title>')
             MainWindow.document.write('</head><body>');
            MainWindow.document.write(getpanel.innerHTML);
            MainWindow.document.write('</body></html>');
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
    <br />
    <br />
    <form id="form1" runat="server">

        <div class="row">
            <div class="col-md-2"></div>

            <div class="col-md-8" style="background-color: aliceblue; align-content: center;">
                <asp:panel id="Panel1" runat="server"
                    height="50%" style="width: 100%" horizontalalign="Center" width="100%">
   
                    <div class="row" style="background-color:lightpink"><br />
                        <div class="col-md-3">
                                <asp:Image runat="server" ID="lbl_logo" ImageUrl="~/img/logo3.png"  width="50%" height="50"></asp:Image>
                        </div>
                        <div class="col-md-9">
                            <table>
                                <tr>
                                    <td>
                                       &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Image runat="server" ID="lbl_logoname" ImageUrl="~/img/logo.png"></asp:Image>

                                    </td>
                                    </tr>
                                <tr>
                                    <td style="text-align:center;">
                                        <h4>Adventurer, Dawa Bazar, Gole Colony, Nashik, Maharashtra</h4>
                                    </td>
                                </tr>
                            </table>
                           
                        </div>
                    </div>


                    <br />


                     <h3 style="text-align: center; color:crimson">Bill Reciept</h3>
                <hr />
               
               
                <div class="row">
                    <div class="col-md-6">
                        <asp:Label ID="Label3" runat="server" Text="Order No :"></asp:Label>
                        <asp:Label ID="lbl_orderid" runat="server" Text=""></asp:Label>                       
                       
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="Label1" runat="server" Text="Bill No :"></asp:Label>
                        <asp:Label ID="lbl_billno" runat="server" Text=""></asp:Label><br />
                       
                        <asp:Label ID="Label2" runat="server" Text="Bill Date :"></asp:Label>
                        <asp:Label ID="lbl_billdate" runat="server" Text=""></asp:Label>
                    


                    </div>
                </div>
              
                <hr />
                <div class="row">  
                     <div class="center">
                            <h4> Customer Details</h4>
                        </div>
                    <div class="col-md-6">

                        <table>
                            <tr>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label runat="server" Text="Name :"></asp:Label>
                                     <asp:Label runat="server" Text="Label" ID="lbl_custname"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label runat="server" Text="Address :"></asp:Label>
                                
                                    <asp:Label runat="server" ID="lbl_area"></asp:Label>,
                                  
                                        <asp:Label runat="server" ID="lbl_city"></asp:Label>.</td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-6">
                        <table>
                            <tr>
                                
                                <td>
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label runat="server" Text="Contact :"></asp:Label></td>

                                <td>
                                    <asp:Label runat="server" ID="lbl_contact"></asp:Label><br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label runat="server" Text="Email :"></asp:Label></td>
                                <td>
                                    <asp:Label runat="server" ID="lbl_email"></asp:Label></td>
                            </tr>
                        </table>
                    </div>

                </div>
                <hr />
               
                <div class="row">
                    <div class="center">
                            <h4>Duration </h4>
                        </div>
                    <div class="col-md-12 center">
                        <asp:Label runat="server" Text="Validity :"></asp:Label>
                        <asp:Label runat="server" ID="lbl_validity"></asp:Label>
                    </div>
                   
                    <div class="col-md-6">
                        <asp:Label runat="server" Text="From Date :"></asp:Label>
                        <asp:Label runat="server" ID="lbl_fromdate"></asp:Label>
                    </div>
                    <div class="col-md-6">
                        <asp:Label runat="server" Text="To Date :"></asp:Label>
                        <asp:Label runat="server" ID="lbl_todate"></asp:Label>

                    </div>
                </div>
                <hr />

                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <div class="center">
                            <h4>Pack Details</h4>
                        </div>
                        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="611px">
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <hr />
            
                <div class="row">
                    <div class="col-md-6">
                        <table>
                            
                            <tr>
                                <td>
                                    <asp:Label runat="server" Text="Connection Charges :"></asp:Label>
                                
                                    <asp:Label runat="server" ID="lbl_concharges"></asp:Label></td>
                            </tr>
                             
                            <tr>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<asp:Label runat="server" Text="GST(18%) :"></asp:Label>
                                
                                    <asp:Label runat="server" ID="lbl_gst"></asp:Label></td>
                            </tr>
                        </table>
                    </div>

                    <div class="col-md-6">
                        <table>
                           
                            <tr>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label runat="server" Text="Total :"></asp:Label>
                                
                                    <asp:Label runat="server" ID="lbl_total"></asp:Label></td>
                            </tr>
                             
                            <tr>
                                <td>
                                    <asp:Label runat="server" Text="Total Amount :"></asp:Label>
                             
                                    <asp:Label runat="server" ID="lbl_totalamount"></asp:Label></td>
                            </tr>



                        </table>
                       
                    </div>
                    
                     <div class="col-md-12">
                            <table>
                                  
                                <tr>
                                    <td style="text-align:right;">
                                        <asp:Label runat="server" Text="Total Amount( In Words):"></asp:Label>
                                    
                                        <asp:Label runat="server" ID="lbl_amountInWord"></asp:Label></td>
                                </tr>
                            </table>
                        </div>
                </div>
                <hr />
                <br />
                <div class="row">

                    <div class="col-md-6">
                        <asp:Label runat="server" Text="Customer Signature "></asp:Label>    <br />
                        <asp:Label runat="server" ID="lbl_cname"></asp:Label>
                    </div>
                    <div class="col-md-6" style="text-align: right;">
                        <asp:Label runat="server" Text="Agent Signature "></asp:Label>    <br />
                        <asp:Label runat="server" ID="lbl_agentname"></asp:Label>
                    </div>
                </div>
                <br />
                <hr />
                <div class="row center">
                    <asp:Button runat="server" ID="btn_print" OnClientClick="return PrintBill();" Text="Print" />

                </div>
                <br />


                 </asp:panel>
            </div>


            <div class="col-md-2"></div>
        </div>



        <br />
        <br />
        <br />

    </form>
</asp:Content>

