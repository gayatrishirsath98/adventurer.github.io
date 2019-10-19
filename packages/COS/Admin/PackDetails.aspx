<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="PackDetails.aspx.cs" Inherits="Admin_PackDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


     <style type="text/css">
        .Gridview {
            font-family: Verdana;
            font-size: 10pt;
            font-weight: normal;
            color: black;
        }
      
        #form1 {
            height: 505px;
        }
    </style>
     <script>
       function ConfirmationBox(packname) {
           var finalresult = confirm('Are you sure want to delete details?');
           if (finalresult) {
               return true;
           }
           else {
               return false;
           }
       }
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <div style="background-color:teal;height:100;padding:9px;text-align:center">
            <h1 style="color:white;">Pack Details</h1>

        </div><br />
        <asp:Button ID="btn_addpack" runat="server" Text="Add New Pack"  CssClass="pull-right" OnClick="btn_addpack_Click" /><br /><br />
        <div style="text-align:center;" >
            
    <asp:GridView ID="GridView1" runat="server" Width="827px" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="185px" DataKeyNames="Pack_id" OnRowDataBound="GridView1_RowDataBound">
         <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
          <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Delete</asp:LinkButton>
                    </ItemTemplate>

                </asp:TemplateField>
                      <asp:BoundField DataField="Pack_id" HtmlEncode="False" DataFormatString="<a href='EditPack.aspx?code={0}'>Edit</a>" />
        </Columns>
       <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="Black" ForeColor="White" Font-Size="Large" Height="20px" HorizontalAlign="Center" Font-Bold="True" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" Font-Size="Medium" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
  </div>
        
    </form>
</asp:Content>

