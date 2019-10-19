<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="SummaryReport.aspx.cs" Inherits="Admin_SummaryReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <%--  <link href="css/jquery-ui.css" rel="stylesheet" />--%>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
     <script>
        function PrintReport() {
            var getpanel = document.getElementById("<%=panel1.ClientID%>");
            var MainWindow = window.open('', '', 'height=500,width=800');
            MainWindow.document.write('<html><head><title>Summary Report</title>')
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

    <style type="text/css">
        .Gridview {
            font-family: Arial;
            font-size: 8pt;
            font-weight: normal;
            color: black;
        }
         .GridPosition
    {
    	position:absolute;
    	left:-435px;
        right:116px;
    	top:179px;
    	height:200px;
    	width:1228px;
    

    }

        #form1 {
            height: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">   

    <form id="form1" runat="server" style="background-color:darkgray">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <asp:Panel ID="panel1" runat="server">
                   <br />
                    <h4 style="color: crimson; text-align: center">Summary Report </h4>
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                             <asp:DropDownList ID="DropDownList1" class="form-control pro-edt-select form-control-primary" runat="server" AppendDataBoundItems="True" DataValueField="Agent_name" AutoPostBack="True"  required="true">
                    <asp:ListItem Value="0">-- Select Agent--</asp:ListItem>

                </asp:DropDownList>

                        </div><br /><br />
                       
                        <div class="col-md-12">
                            <div class="row"><br />
                                 <div class="col-md-6" style="font-size:large;"><asp:RadioButton ID="rbtn_allcustomer" runat="server" GroupName="mode" Text="Customer List" /></div>
                                <div class="col-md-6" style="font-size:large;"> <asp:RadioButton ID="rbtn_orders" runat="server" GroupName="mode" Text="Total Orders" />
                              </div>

                            </div>

                        </div>
                        <br />
                        <div style="text-align:center;">

                            <asp:Button ID="btn_show" CssClass="btn-default" runat="server" Text="Show" OnClick="btn_show_Click"/>
                            

                            <asp:Button ID="btn_print" CssClass="btn-success" runat="server" Text="Print" OnClientClick="return PrintReport();" />

                           
                        </div>
                        <br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="GridPosition Gridview" GridLines="Vertical" Height="315px" HorizontalAlign="Justify">
                                <EditRowStyle Font-Size="Medium" Height="40px" />
                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <HeaderStyle BackColor="Black" Font-Bold="True" Font-Size="Large" ForeColor="White" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" Width="40px" Wrap="True" />
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
                    <br /><br />
                    
                </asp:Panel>
            </div>
            <div class="col-md-1"></div>                  
            
               
        </div>
    </form>
    <br />
    <br />
    <br />
    
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

</asp:Content>

