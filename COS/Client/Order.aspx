<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .button:hover {
            opacity: 1;
            
        }
         .pcss {
            font-family: Arial;
            font-size: 12pt;
            font-weight: bold;
            color: black;
        }

        
    </style>
    <script>
       function ValidateDropDown() {
    var cmbID = "<%=DropDownList3.ClientID %>";
    if (document.getElementById(cmbID).selectedIndex == 0) {
        alert("Please select Packs");
        return false;
    }
    return true;
        }

       


    </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <form id="form1" runat="server">
           

            <br />
            <br />
            <br />
            <br />

            <div class="row">
                <div class="col-md-1"></div>
                 <div class="col-md-10">
                    <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="panel1" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList3" EventName="SelectedIndexChanged" />
                        </Triggers>
                        <ContentTemplate>

                            <div class="row">

                                <div class="col-md-12">
                                    <div class="center">
                                        <h4 style="color: brown;font-weight:bold;text-align:center">Customer Recharge Corner</h4>
                                    </div>

                                    <hr />

                                </div>

                                <div class="col-md-6">
                                    <asp:TextBox runat="server" placeholder="Enter Your Subscription ID" required="true" ID="txt_subid"></asp:TextBox>
                                    <div class="center">
                                        <asp:Button runat="server" CssClass="btn-success" class="button" Text="Check" ID="btn_checksubcription" OnClick="btn_checksubcription_Click" Width="110" Height="50" style="border-radius:10px;"/>
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
                          
                               
                                <asp:Panel ID="Panel3" runat="server" Cssclass="pcss" BorderColor="Black"
                                    Height="50%" Style="width: 100%" BackColor="#FFFFCC" BorderStyle="Solid" HorizontalAlign="Center" Width="100%">
                                  <br /> <div class="center">
                                    <h5 style="color: brown;font-weight:bold">Customer Detail</h5>
                                 
                                </div>
                                    <div class="row">

                                        <br />

                                        <div class="col-md-6">
                                            <asp:Label runat="server" Text="Order No :"></asp:Label>
                                            <asp:Label runat="server" Text="Order No :" ID="lbl_orderno"></asp:Label>


                                            <br />
                                            <br />
                                            <asp:Label runat="server" Text="Customer Name :"></asp:Label>
                                            <asp:Label runat="server" Text="" ID="lbl_custname"></asp:Label>



                                            <asp:TextBox runat="server" ID="txt_custid" class="form-control" placeholder="Cust ID" Visible="false"></asp:TextBox>

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
                                                    <label for="contact-email" class="">From Date :</label>

                                                    <asp:Label runat="server" Text="" ID="lbl_fromdate"></asp:Label>


                                                </div>
                                                <div class="col-md-6">
                                                    <label for="contact-email" class="">To Date :</label>

                                                    <asp:Label runat="server" Text="" ID="lbl_todate"></asp:Label>



                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <br />
                                    <br />
                                    <br />

                                </asp:Panel>
                                <br />
                                <br />

                                <!-- Select Packs  -->


                                <asp:Panel ID="Panel2" runat="server" Cssclass="pcss" BorderColor="Black"
                                    Height="157%" Style="width: 100%" BackColor="#FFFFCC" BorderStyle="Solid" HorizontalAlign="Center" Width="100%">
                                                                  <br /> <div class="center" id="sp">
                                    <h5 style="color: brown;font-weight:bold">Select Pack</h5>
                                </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <br />
                                                    Serial No :
                                <asp:TextBox ID="txt_orderdetailno" runat="server" ReadOnly="true"></asp:TextBox>
                                                    <asp:TextBox ID="txt_packid" runat="server" Visible="false"></asp:TextBox>
                                                    Select Pack :
                        <asp:DropDownList ID="DropDownList3" class="form-control pro-edt-select form-control-primary" runat="server" AppendDataBoundItems="True" DataValueField="Pack_name" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                            <asp:ListItem Value="0">-- Select Pack--</asp:ListItem>

                        </asp:DropDownList>
                                                    Pack Prize :
                        <asp:TextBox ID="txt_prize" runat="server" ReadOnly="true"></asp:TextBox>
                                                    <br />

                                                    <asp:Button ID="btn_addpack" runat="server" CssClass="btn-success" OnClientClick="javascript:return ValidateDropDown();" class="button" Text="Add TO List" OnClick="btn_addpack_Click"  Width="110" Height="50" style="border-radius:10px;"/><br />
                                                    <br />
                                                    <strong style="color: brown;">
                                                        <asp:Label ID="lbl_sms" runat="server" Text=""></asp:Label></strong>
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

                                                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" Height="192px" Width="705px" HorizontalAlign="Center" DataKeyNames="Pack_id" OnRowDataBound="GridView1_RowDataBound" CellSpacing="8">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Action">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Remove</asp:LinkButton>
                                                            </ItemTemplate>

                                                        </asp:TemplateField>

                                                    </Columns>
                                                    <EditRowStyle BackColor="White" BorderColor="Black" BorderStyle="Solid" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                                    <HeaderStyle BackColor="#FF8080" BorderColor="Black" BorderStyle="Solid" Font-Bold="True" ForeColor="Black" />
                                                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="White" ForeColor="#330099" />
                                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                                                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                                                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                                                    <SortedDescendingHeaderStyle BackColor="#7E0000" />


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
                                            <label for="contact-email" class="font-weight-bold">Total</label>
                                            <asp:TextBox runat="server" ID="txt_subtotal" ReadOnly="true"></asp:TextBox>
                                            <label for="contact-email" class="">Base Prize</label>
                                            <asp:TextBox runat="server" ID="txt_ConCharge" ReadOnly="true"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="contact-email" class="">GST (18%)</label>
                                            <asp:TextBox runat="server" ID="txt_gst" Width="410px" ReadOnly="true"></asp:TextBox>

                                            <label for="contact-email" class="">Total Prize</label>
                                            <asp:TextBox runat="server" ID="txt_totalprize" Width="400px" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br /><br />
                                    <div class="center-align">
                                     <asp:Label ID="lbl_sms1" runat="server"  style="color:red;" Text=""></asp:Label><br />
                 <asp:Button ID="btn_submit" CssClass="btn-success" runat="server" Text="Submit" class="button" OnClick="btn_submit_Click" OnClientClick="javascript:return ValidateDropDown();" Width="100" Height="50" style="border-radius:10px;"/>
                 &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_reset" CssClass="btn-default" runat="server" Text="Reset" class="button" OnClick="btn_reset_Click"  Width="100" Height="50" style="border-radius:10px;" />
                 &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_cancel" CssClass="btn-danger" runat="server" Text="Cancel" class="button" OnClick="btn_cancel_Click"  Width="100" Height="50" style="border-radius:10px;"/>

                                       

             </div>
                                </asp:Panel>
                                <br />
                          
                            </div>         
                 

                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
                <div class="col-md-1"></div>
                </div>


                <br />
                <br />
                <br />

          
      </form>
   



</div>

</asp:Content>

