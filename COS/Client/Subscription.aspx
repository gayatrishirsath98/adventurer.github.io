<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="Subscription.aspx.cs" Inherits="Subscription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Font Awesome -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,800,600,300,300italic,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">

    <!-- Material Design Bootstrap -->
    <link href="css/materialize.css" rel="stylesheet">

    <%--  <link href="css/jquery-ui.css" rel="stylesheet" />--%>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
    <script>
       function ValidateDropDown() {
    var cmbID = "<%=cust_name.ClientID %>";
    if (document.getElementById(cmbID).selectedIndex == 0) {
        alert("Please select Customer");
        return false;
    }
    return true;
        }

        function ValidateDropDown() {
    var cmbID = "<%=DropDownList1.ClientID %>";
    if (document.getElementById(cmbID).selectedIndex == 0) {
        alert("Please select Duration");
        return false;
    }
    return true;
        }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />

    <form id="form1" runat="server" style="font-family: Arial; font-size: xx-large">

        <div class="row">
            <div class="col-lg-3"></div>



            <div class="col-lg-6">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

                <asp:UpdatePanel runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DropDownList1" EventName="SelectedIndexChanged" />
                    </Triggers>
                    <ContentTemplate>
                        <br />
                        <br />
                        <h4 class="center" style="color: brown;font-weight:bold">Subscription Here</h4>
                        <asp:Panel ID="Panel1" runat="server" BorderColor="Black" BorderStyle="Solid" Font-Size="Medium" BackColor="#FFFFCC" >
                            <br />


                            <!-- Grid row -->
                            <div class="row">

                                <!-- Grid column -->
                                <div class="col-md-6">

                                    <label for="contact-email" class="">Subscription ID :</label>


                                    <asp:Label ID="lbl_subid" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="col-md-6">

                                    <label for="contact-email" class="">Today Date :</label>


                                    <asp:Label ID="txt_currentdate" runat="server" Text="Label"></asp:Label>


                                </div>

                                <!-- Grid row -->
                                <div class="row">

                                    <!-- Grid column -->
                                    <div class="col-md-6">

                                        <asp:TextBox runat="server" ID="txt_custid" class="form-control" placeholder="Cust ID" Visible="false"></asp:TextBox>
                                        <asp:DropDownList ID="cust_name" data-validation="required" class="form-control pro-edt-select form-control-primary" runat="server" AppendDataBoundItems="True" DataValueField="Cust_name" OnSelectedIndexChanged="cust_name_SelectedIndexChanged" AutoPostBack="True">

                                            <asp:ListItem Value="0">-- Select Customer--</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                    <div class="col-md-6">

                                        <asp:DropDownList ID="DropDownList1" runat="server" data-validation="required" class="form-control pro-edt-select form-control-primary" AppendDataBoundItems="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                                            <%--<asp:DropDownList ID="Dropdownlist1" class="form-control pro-edt-select form-control-primary" runat="server">--%>
                                            <asp:ListItem Value="0">-- Select Duration--</asp:ListItem>
                                            <asp:ListItem Value="1 Month"></asp:ListItem>
                                            <asp:ListItem Value="3 Month"></asp:ListItem>
                                            <asp:ListItem Value="6 Month"></asp:ListItem>
                                            <asp:ListItem Value="1 Year"></asp:ListItem>
                                        </asp:DropDownList>

                                    </div>



                                    <div class="row">
                                        <div class="col-md-6">

                                            <label for="contact-email" class="">From Date :</label>


                                            <asp:Label ID="txt_fromdate" runat="server" Text=""></asp:Label>
                                        </div>

                                        <div class="col-md-6">

                                            <label for="contact-email" class="">To Date :</label>


                                            <asp:Label ID="txt_todate" runat="server" Text=""></asp:Label>

                                        </div>

                                    </div>

                                </div>


                                <br />

                                <div class="center">
                                    <asp:Button ID="btn_save" runat="server" Text="Submit" OnClick="btn_save_Click" OnClientClick="javascript:return ValidateDropDown();" CssClass="btn-success" class="button"  Width="110" Height="50" style="border-radius:10px;" />&nbsp;&nbsp;&nbsp;&nbsp;

                        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CssClass="btn-danger" class="button"  Width="110" Height="50" style="border-radius:10px;" OnClick="btn_cancel_Click"  />

                                    <br /><br />
                                    <b>
                                    <asp:Label ID="lbl_sms" runat="server" Text=""></asp:Label>
                                        </b>
                                    <br />
                                    <br />
                                </div>

                            </div>
                        </asp:Panel>
                        <br />
                        <br />

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <!-- Grid row -->







            <div class="col-lg-3"></div>

        </div>




        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

    </form>
</asp:Content>
