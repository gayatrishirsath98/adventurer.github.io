<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AgentDetails.aspx.cs" Inherits="Admin_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
        function ConfirmationBox(agentname) {
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
        <div style="background-color: teal; height: 100; padding: 9px; text-align: center">
            <h1 style="color: white;">Agent Details</h1>

        </div>
        <br />
        <asp:button id="btn_addagent" runat="server" text="Add New Agent" onclick="btn_addagent_Click" cssclass="pull-right" />
        <br />
        <br />
        <div style="height: 424px">

            <asp:gridview id="GridView1" runat="server" height="315px" width="1092px" horizontalalign="Justify" datakeynames="Agent_id" cellpadding="3" backcolor="White" bordercolor="#999999" borderstyle="None" borderwidth="1px" gridlines="Vertical" onrowdatabound="GridView1_RowDataBound">
                
                <EditRowStyle Font-Size="Medium" Height="40px" />
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Font-Size="Large" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" Width="40px" Wrap="True" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" Font-Size="Medium" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" Width="40px" />
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                 
                     <%--<asp:BoundField DataField="Agent_id" HtmlEncode="False" DataFormatString="<a href='DeleteAgent.aspx?code={0}'>Delete</a>" />--%>
                    <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Delete</asp:LinkButton>
                                                </ItemTemplate>

                                            </asp:TemplateField>
        
                      <asp:BoundField DataField="Agent_id" HtmlEncode="False" DataFormatString="<a href='EditAgent.aspx?code={0}'>Edit</a>" />
                </Columns>
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" Font-Size="Large" ForeColor="White" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:gridview>
        </div>

    </form>
</asp:Content>

