<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="AgentProfile.aspx.cs" Inherits="AgentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    --
    <!-- Font Awesome -->
    <%--<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,800,600,300,300italic,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">

    <!-- Material Design Bootstrap -->
    <link href="css/materialize.css" rel="stylesheet">--%>
    <style>
        .circle {
            height: 80px;
            width: 80px;
            border-radius: 50%;
            
        }

        .panel {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    
    <br />
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-md-4"></div>

            <div class="col-md-4">

                <div class="row">

                    <!-- Grid column -->
                    <div class="col-md-12 mb-md-0 mb-5">

                        <!-- Grid row -->
                        <div class="row">
                            <!-- Grid column -->

                            <div class="col-md-12">

                               
                                <asp:Panel ID="Panel1" runat="server" BorderColor="Black" BorderStyle="Solid" Width="600px" HorizontalAlign="Center">
                                     <div class="text-muted text-center">
                                    <h3>My Profile</h3>
                                </div>
                                    <!-- Card Regular -->
                                    <div class="card card-cascade">

                                        <!-- Card image -->
                                        <div class="view view-cascade overlay">
                                            <asp:Image ID="Image1" runat="server" class="circle"></asp:Image>
                                            <a>
                                                <div class="mask rgba-white-slight"></div>
                                            </a>
                                        </div>

                                        <!-- Card content -->
                                        <div class="card-body card-body-cascade text-center">

                                            <!-- Title -->
                                            <h4 class="card-title"><strong>
                                                <asp:Label ID="txt_name" runat="server" Text="Label"></asp:Label></strong></h4>
                                            <!-- Subtitle -->
                                            <h6 class="font-weight-bold indigo-text py-2">Agent</h6>
                                            <!-- Text -->
                                            <p class="card-text center">

                                                <label for="contact-email" class="">Area</label><br />

                                                <asp:Label ID="txt_Area" runat="server" Text="Label"></asp:Label><br />


                                                <label for="contact-name" class="">City</label><br />

                                                <asp:Label ID="txt_City" runat="server" Text="Label"></asp:Label><br />


                                                <label for="contact-email" class="">District</label><br />

                                                <asp:Label ID="txt_District" runat="server" Text="Label"></asp:Label><br />



                                                <label for="contact-Subject" class="">State</label><br />

                                                <asp:Label ID="txt_State" runat="server" Text="Label"></asp:Label><br />


                                                <label for="contact-Subject" class="">Mobile No</label><br />

                                                <asp:Label ID="txt_Mobile" runat="server" Text="Label"></asp:Label><br />


                                                <label for="contact-Subject" class="">Email</label><br />

                                                <asp:Label ID="txt_Email" runat="server" Text="Label"></asp:Label><br />


                                            </p>

                                            <!-- Facebook -->
                                            <a href="#" class="btn-floating btn-small btn-fb"><i class="fab fa-facebook-f"></i></a>
                                            <!-- Twitter -->
                                            <a href="#" class="btn-floating btn-small btn-tw"><i class="fab fa-twitter"></i></a>
                                            <!-- Google + -->
                                            <a href="#" class="btn-floating btn-small btn-dribbble"><i class="fab fa-dribbble"></i></a>

                                        </div>

                                        <!-- Card footer -->
                                        <div class="card-footer text-muted text-center">
                                          
                                        </div>

                                    </div>
                                    <!-- Card Regular -->

                                </asp:Panel>

                            </div>
                            <!-- Grid column -->

                        </div>
                        <!-- Grid row -->
                    </div>


                </div>
                <!-- Grid column -->

            </div>

            <div class="col-md-4"></div>

        </div>







    </form>
    <br />
    <br />
    <br />
</asp:Content>

