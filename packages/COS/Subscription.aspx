<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Subscription.aspx.cs" Inherits="Subscription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Font Awesome -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,800,600,300,300italic,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">

    <!-- Material Design Bootstrap -->
    <link href="css/materialize.css" rel="stylesheet">

    <%--  <link href="css/jquery-ui.css" rel="stylesheet" />--%>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <br />
    <form id="form1" runat="server">

        <div class="row">
            <div class="col-lg-3"></div>
           


            <div class="col-lg-6">
                <br /><br />
                <h3 class="h1-responsive font-weight-bold center my-3" style="color:black;" >Subscription Here</h3>
                 <asp:Panel ID="Panel1" runat="server" BorderColor="Black" BorderStyle="Solid" Font-Size="Medium"><br />
               
               
                <!-- Grid row -->
                <div class="row">

                    <!-- Grid column -->
                    <div class="col-md-6">

                        <label for="contact-email" class="">Subscription ID :</label>
                        <asp:TextBox ID="lbl_subid" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">

                        <label for="contact-email" class="">Today Date</label>
                        <asp:TextBox runat="server" ID="txt_currentdate" class="form-control"></asp:TextBox>


                    </div>

                    <!-- Grid row -->
                    <div class="row">

                        <!-- Grid column -->
                        <div class="col-md-6">

                            <asp:TextBox runat="server" ID="txt_custid" class="form-control" placeholder="Cust ID" Visible="false"></asp:TextBox>
                            <asp:DropDownList ID="cust_name" class="form-control pro-edt-select form-control-primary" runat="server" AppendDataBoundItems="True" DataValueField="Cust_name" OnSelectedIndexChanged="cust_name_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Value="0">-- Select Customer--</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                        <div class="col-md-6">

                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control pro-edt-select form-control-primary" AppendDataBoundItems="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
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

                                <label for="contact-email" class="">From Date</label>
                                <asp:TextBox runat="server" ID="txt_fromdate" class="form-control"></asp:TextBox>

                            </div>

                            <div class="col-md-6">

                                <label for="contact-email" class="">To Date</label>
                                <asp:TextBox runat="server" ID="txt_todate" class="form-control"></asp:TextBox>


                            </div>

                        </div>

                    </div>


                    <br />

                    <div class="center">
                        <asp:Button ID="btn_save" runat="server" Text="Submit" OnClick="btn_save_Click" CssClass="btn-success" />&nbsp;&nbsp;&nbsp;&nbsp;

                        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CssClass="btn-danger"/>

                        <br />
                        <asp:Label ID="lbl_sms" runat="server" Text=""></asp:Label>
                        <br />
                        <br />
                    </div>

                </div>
                  </asp:Panel>
                <br /><br />
            </div>
            <!-- Grid row -->
             

                  <div class="col-lg-3"></div>

        </div>
  



        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
        
</form>
</asp:Content>
