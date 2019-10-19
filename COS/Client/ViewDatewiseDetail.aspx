<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="ViewDatewiseDetail.aspx.cs" Inherits="ViewDatewiseDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <br /><br /><br />
    <form id="form1" runat="server">
         <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10"><br />
        <asp:Panel ID="Panel2" runat="server" 
                        Height="150%" Style="width: 100%"  HorizontalAlign="Center" Width="100%"><br />
            <h3 style="color:crimson;">Pack Details</h3><br />
            <div class="row">
                <div class="col-md-1"></div>
                 <div class="col-md-10">

                <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Justify"  CellPadding="3" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" GridLines="Vertical">
               
                <EditRowStyle Font-Size="Medium" Height="40px" />
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Font-Size="Large" Height="50px" HorizontalAlign="Justify" VerticalAlign="Middle" Width="40px" Wrap="True" />
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
                 <div class="col-md-1"></div>
            </div>
                <br />
            </asp:Panel>
                <br />
                <div class="row center">
                    <asp:Button runat="server" ID="btn_back" CssClass="btn-danger" Text="Back" />

                </div>
                </div>
                 <div class="col-md-1"></div>
             </div>
    </form>

       <br /><br /><br />



</asp:Content>

