<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<style type="text/css">
        #form1 {
            height: 127px;
            width: 473px;
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <form id="form1" runat="server">
            <%--<asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="panel1" runat="server"><ContentTemplate>--%>
            <br />
            <br />
            <br />
            <br />

            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div class="row">

                        <div class="col-md-12">
                            <div class="center">
                                <h4>Customer Recharge Corner</h4>
                            </div>

                            <hr />

                        </div>

                        <div class="col-md-6">
                            <asp:textbox runat="server" placeholder="Enter Your Subscription ID" required="true" id="txt_subid"></asp:textbox>
                            <div class="center">
                                <asp:button runat="server" text="Check" id="btn_checksubcription" onclick="btn_checksubcription_Click" />
                            </div>

                        </div>
                        <div class="col-md-6">

                            <p class="text-danger">
                                <b>Note : </b>Subscription Id is Required For Recharge...
                            </p>
                            <p class="text-success">For New Subscription <b><a href="Subscription.aspx">Click Here</a></b></p>

                        </div>

                    </div>
                    <hr />
                    <asp:Panel ID="Panelcheck" runat="server">
                    <div class="center">
                        <h5>Customer Detail</h5>
                        <br />
                    </div>
                    <asp:panel id="Panel1" runat="server" bordercolor="Black"
                        height="50%" style="width: 100%" backcolor="#FFFFCC" borderstyle="Solid" horizontalalign="Center" width="100%">
                        <div class="row">

                            <br />

                            <div class="col-md-6">
                                <asp:Label runat="server" Text="Order No :"></asp:Label>
                                <asp:Label runat="server" Text="Order No :" ID="lbl_orderno"></asp:Label>


                                <br />
                                <br />
                                <asp:Label runat="server" Text="Customer Name :"></asp:Label>
                                <asp:Label runat="server" Text="" ID="lbl_custname"></asp:Label>



                                <asp:TextBox runat="server" ID="txt_custid"  class="form-control" placeholder="Cust ID" Visible="false"></asp:TextBox>

                            </div>
                            <div class="col-md-6">

                                <asp:Label runat="server" Text="Order Date :"></asp:Label>
                                <asp:Label runat="server" ID="lbl_todaydate"></asp:Label><br />
                                <br />

                                <asp:Label runat="server" Text="Address :"></asp:Label>
                                <asp:Label runat="server" ID="lbl_area"></asp:Label>,
                            <asp:Label runat="server" ID="lbl_city"></asp:Label>.
                                <asp:Label runat="server" Text="Contact :"></asp:Label>
                                <asp:Label runat="server" ID="lbl_contact"></asp:Label>
                                 <asp:Label runat="server" Text="Email :"></asp:Label>
                                <asp:Label runat="server" ID="lbl_email"></asp:Label>



                            </div>
                        </div>



                        <div class="row">
                            <br />
                            <br />
                            <div class="col-md-12">
                                <asp:Label runat="server" Text="Duration :" class="center"></asp:Label>

                                <asp:Label runat="server" Text="" ID="lbl_duration"></asp:Label>


                                <div class="row">
                                    <br />
                                    <div class="col-md-6">
                                        <label for="contact-email" class="">From Date</label>

                                        <asp:Label runat="server" Text="" ID="lbl_fromdate"></asp:Label>


                                    </div>
                                    <div class="col-md-6">
                                        <label for="contact-email" class="">To Date</label>

                                        <asp:Label runat="server" Text="" ID="lbl_todate"></asp:Label>



                                    </div>
                                </div>
                            </div>
                        </div>

                        <br />
                        <br />
                        <br />

                    </asp:panel>
                    <br />
                    <br />

                    <!-- Select Packs  -->
                    <div class="center" id="sp">
                        <h5>Select Pack</h5>
                    </div>

                    <asp:panel id="Panel2" runat="server" bordercolor="Black"
                        height="150%" style="width: 100%" backcolor="#FFFFCC" borderstyle="Solid" horizontalalign="Center" width="100%">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-6">
                                        <br />
                                        Serial No :
                                <asp:TextBox ID="txt_orderdetailno" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txt_packid" runat="server" Visible="false"></asp:TextBox>
                                        Select Pack :
                        <asp:DropDownList ID="DropDownList3" class="form-control pro-edt-select form-control-primary" runat="server" AppendDataBoundItems="True" DataValueField="Pack_name" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                            <asp:ListItem Value="0">-- Select Pack--</asp:ListItem>

                        </asp:DropDownList>
                                        Pack Prize :
                        <asp:TextBox ID="txt_prize" runat="server"></asp:TextBox>
                                        <br />
                                     
                                        <asp:Button ID="btn_addpack" runat="server" Text="Add TO List" OnClick="btn_addpack_Click"/><br />
                                       <br /> <strong style="color:brown;"><asp:Label ID="lbl_sms" runat="server" Text=""></asp:Label></strong>
                                    </div>
                                    <div class="col-md-6">
                                        <br />
                                        <br />
                                        <asp:Image ID="Image1" runat="server" />
                                    </div>
                                </div>



                            </div>
                            <div class="row">
                                 <div class="col-md-1"></div>
                                 <div class="col-md-8">
                                <br />
                                <br />
                            
                                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="192px" Width="705px" HorizontalAlign="Justify" DataKeyNames="Pack_id" OnRowDataBound="GridView1_RowDataBound">
                                        <AlternatingRowStyle BackColor="#DCDCDC" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Remove</asp:LinkButton>
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                            
                                        </Columns>
                                                                                                                                                             <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#000065" />


                                    </asp:GridView>                            

                                    <br />                                  
                                    
                                    <br />
                               


                            </div>
                                   <div class="col-md-3"></div>
                                
                            </div>
                           


                        </div>

                        <!-- Calculation Part -->
                        <div class="row">
                            <div class="col-md-6">
                                <label for="contact-email" class="">Total</label>
                                <asp:TextBox runat="server" ID="txt_subtotal"></asp:TextBox>
                                <label for="contact-email" class="">Base Prize</label>
                                <asp:TextBox runat="server" ID="txt_ConCharge"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label for="contact-email" class="">GST (18%)</label>
                                <asp:TextBox runat="server" ID="txt_gst" Width="410px"></asp:TextBox>

                                <label for="contact-email" class="">Total Prize</label>
                                <asp:TextBox runat="server" ID="txt_totalprize" Width="400px"></asp:TextBox>
                            </div>
                        </div>
                    </asp:panel>
                    <br />




                    <div class="center-align">
                        <asp:button id="btn_submit" cssclass="btn-success" runat="server" text="Submit" onclick="btn_submit_Click" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:button id="btn_reset" cssclass="btn-default" runat="server" text="Reset" onclick="btn_reset_Click" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:button id="btn_cancel" cssclass="btn-danger" runat="server" text="Cancel" onclick="btn_cancel_Click" />

                    </div>



                </asp:Panel>
                </div>


            </div>
            <div class="col-md-1"></div>


            <br />
            <br />
            <br />

            <%-- </ContentTemplate></asp:UpdatePanel>--%>
        </form>
    </div>

    <script>
       $('#btn_addpack').click(function(e) {
    // prevent click action
    e.preventDefault();
    // your code here
    return false;
});


    </script>


</asp:Content>

