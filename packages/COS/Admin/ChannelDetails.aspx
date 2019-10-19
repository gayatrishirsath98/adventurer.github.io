<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ChannelDetails.aspx.cs" Inherits="ChannelDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8">
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
       function ConfirmationBox(channelname) {
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

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <div class="row">
           <%-- <div class="col-lg-1"></div>--%>

           <%-- <div class="col-lg-10 fa-align-center">--%>
                <div style="background-color:teal;height:100;padding:9px;text-align:center">
            <h1 style="color:white;">Channel Details</h1>

        </div>
        <br />
        <asp:Button ID="btn_addchannel" runat="server" Text="Add New Channel" CssClass="pull-right" OnClick="btn_addchannel_Click" /><br />
        <br />
        <div style="height: 424px">
            <asp:GridView ID="GridView1" runat="server" Width="827px" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="185px" DataKeyNames="Channel_id" OnRowDataBound="GridView1_RowDataBound">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>

                    <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Delete</asp:LinkButton>
                    </ItemTemplate>

                </asp:TemplateField>

                    <asp:BoundField DataField="Channel_id" HtmlEncode="False" DataFormatString="<a href='EditChannel.aspx?code={0}'>Edit</a>" />
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




            </div>
          <%--  <div class="col-lg-1"></div>
        </div>
        --%>

    </form>
</asp:Content>

