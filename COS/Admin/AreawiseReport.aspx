<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AreawiseReport.aspx.cs" Inherits="Admin_ArreawiseReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
        function PrintReport() {
            var getpanel = document.getElementById("<%=panel1.ClientID%>");
            var MainWindow = window.open('', '', 'height=500,width=800');
            MainWindow.document.write('<html><head><title>Areawise Report</title>')
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
    	left:-420px;
        right:116px;
    	top:30px;
    	height:200px;
    	width:1228px;
    

    }

        #form1 {
            height: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <form id="form1" runat="server" style="background-color:darkgray">
        <div class="row">
            <div class="col-md-1"></div>
             <div class="col-md-10">
                      <asp:Panel ID="panel1" runat="server">
                 <br />
                 <h4 style="color: crimson; text-align: center">Areawise Report </h4>
                  <div class="row">
                         <br /> 
                       <div class="col-md-4">
                              <asp:DropDownList ID="DropDownList3" class="form-control pro-edt-select form-control-primary" runat="server" AppendDataBoundItems="True"  AutoPostBack="True"  required="true" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                    <asp:ListItem Value="0">-- Select Agent/Customer--</asp:ListItem>
                                   <asp:ListItem Value="Agent"></asp:ListItem>
                                   <asp:ListItem Value="Customer"></asp:ListItem>

                </asp:DropDownList>
                        </div>
                         <div class="col-md-4">
                               <asp:DropDownList ID="DropDownList1" class="form-control pro-edt-select form-control-primary" runat="server" AppendDataBoundItems="True" DataValueField="District" AutoPostBack="True"  required="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Value="0">-- Select District--</asp:ListItem>

                </asp:DropDownList>
                         </div>
                        <div class="col-md-4">
                              <asp:DropDownList ID="DropDownList2" class="form-control pro-edt-select form-control-primary" runat="server" AppendDataBoundItems="True" DataValueField="City" AutoPostBack="True"  required="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                    <asp:ListItem Value="0">-- Select City/Village--</asp:ListItem>

                </asp:DropDownList>
                             
                        </div> <br /><br /><br /><div style="text-align:center;"><asp:Button ID="btn_print" CssClass="btn-success" runat="server" Text="Print" OnClientClick="return PrintReport();" /></div> <br />                 
                      <div class="row">
                          
                          <div class="col-lg-12">
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
                         
                      </div>
                  
                       
</asp:Panel>
             </div>
             <div class="col-md-1"></div>
            </div>
        </form>
</asp:Content>

