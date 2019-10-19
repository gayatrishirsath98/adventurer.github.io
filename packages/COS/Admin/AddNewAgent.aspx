<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddNewAgent.aspx.cs" Inherits="Admin_NewAgentAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    333333<meta charset="utf-8"><meta http-equiv="x-ua-compatible" content="ie=edge"><title>Add Pack</title><meta name="description" content=""><meta name="viewport" content="width=device-width, initial-scale=1"><script type="text/javascript">
        function previewFile() {
            var preview = document.querySelector('#<%=Image1.ClientID%>');
            var file = document.querySelector('#<%=FileUpload1.ClientID %>').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }
    </script><!-- favicon-->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico"><!-- Google Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet"><!-- Bootstrap CSS	-->
    <link rel="stylesheet" href="css/bootstrap.min.css"><!-- Bootstrap CSS-->
    <link rel="stylesheet" href="css/font-awesome.min.css"><!-- nalika Icon CSS-->
    <link rel="stylesheet" href="css/nalika-icon.css">
    <!-- owl.carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.css">
    <link rel="stylesheet" href="css/owl.transitions.css">
    <!-- animate CSS-->    
    <link rel="stylesheet" href="css/animate.css"
        ><!-- normalize CSS-->
    <link rel="stylesheet" href="css/normalize.css">
    <!-- meanmenu icon CSS	 -->
    <link rel="stylesheet" href="css/meanmenu.min.css">
    <!-- main CSS	 -->
    <link rel="stylesheet" href="css/main.css">
    <!-- morrisjs CSS	 -->
    <link rel="stylesheet" href="css/morrisjs/morris.css">
    <!-- mCustomScrollbar CSS	-->
    <link rel="stylesheet" href="css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- metisMenu CSS -->
    <link rel="stylesheet" href="css/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="css/metisMenu/metisMenu-vertical.css">
    <!-- calendar CSS	-->
    <link rel="stylesheet" href="css/calendar/fullcalendar.min.css">
    <link rel="stylesheet" href="css/calendar/fullcalendar.print.min.css">
    <!-- style CSS	 -->
    <link rel="stylesheet" href="style.css">
    <!-- responsive CSS-->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- modernizr JS	 -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <form id="form1" runat="server">

        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="review-tab-pro-inner">
                        <ul id="myTab3" class="tab-review-design">
                            <li class="active"><a href="#description"><i class="icon nalika-edit" aria-hidden="true"></i>Add Agent</a></li>
                            <%--<li><a href="#reviews"><i class="icon nalika-picture" aria-hidden="true"></i> Pictures</a></li>
                                    <li><a href="#INFORMATION"><i class="icon nalika-chat" aria-hidden="true"></i> Review</a></li>--%>
                        </ul>
                        <div id="myTabContent" class="tab-content custom-product-edit">
                            <div class="product-tab-list tab-pane fade active in" id="description">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="review-content-section">
                                            <div class="input-group mg-b-pro-edt">
                                                <span class="input-group-addon"><i class="icon nalika-user" aria-hidden="true"></i></span>
                                                <%--<input type="text" class="form-control" placeholder="First Name">--%>
                                                <asp:TextBox runat="server" ID="txt_name" class="form-control" placeholder="Full Name" data-validation="required custom" data-validation-regexp="^([a-zA-Z ]+)$"></asp:TextBox>
                                            </div>
                                            <div class="input-group mg-b-pro-edt">
                                                <span class="input-group-addon"><i class="icon nalika-edit" aria-hidden="true"></i></span>
                                                <asp:TextBox runat="server" ID="txt_area"   class="form-control" placeholder="Area" data-validation="required"></asp:TextBox>
                                            </div>
                                            <div class="input-group mg-b-pro-edt">
                                                <span class="input-group-addon"><i class="fa fa-usd" aria-hidden="true"></i></span>
                                                <asp:TextBox runat="server" ID="txt_city"  class="form-control" placeholder="City / Villege" data-validation="required custom" data-validation-regexp="^([a-zA-Z ]+)$"></asp:TextBox>
                                            </div>
                                            <div class="input-group mg-b-pro-edt">
                                                <span class="input-group-addon"><i class="icon nalika-new-file" aria-hidden="true"></i></span>
                                                <asp:TextBox runat="server" ID="txt_dist"  class="form-control" placeholder="District" data-validation="required custom" data-validation-regexp="^([a-zA-Z ]+)$" ></asp:TextBox>
                                            </div>
                                            <div class="input-group mg-b-pro-edt">
                                                <span class="input-group-addon"><i class="icon nalika-favorites" aria-hidden="true"></i></span>
                                                <asp:TextBox runat="server" ID="txt_state"  class="form-control" placeholder="State" data-validation="required custom" data-validation-regexp="^([a-zA-Z ]+)$"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="review-content-section">
                                            <div class="input-group mg-b-pro-edt">
                                                <span class="input-group-addon"><i class="icon nalika-user" aria-hidden="true"></i></span>
                                                <asp:TextBox runat="server" ID="txt_email"  class="form-control" placeholder="Email" data-validation="required email"></asp:TextBox>
                                            </div>
                                            <div class="input-group mg-b-pro-edt">
                                                <span class="input-group-addon"><i class="icon nalika-favorites-button" aria-hidden="true"></i></span>
                                                <asp:TextBox runat="server" ID="txt_mobno" class="form-control" placeholder="Mobile No" data-validation="required custom length" data-validation-regexp="^([0-9]+)$" data-validation-length="10"></asp:TextBox>
                                            </div>
                                            <div class="input-group mg-b-pro-edt">
                                                <span class="input-group-addon"><i class="fa fa-usd" aria-hidden="true"></i></span>
                                                <asp:TextBox runat="server" ID="txt_password"  class="form-control" placeholder="Password" data-validation="required length" data-validation-length="min8"></asp:TextBox>
                                            </div>
                                            <div class="input-group mg-b-pro-edt">
                                                <span class="input-group-addon"><i class="fa fa-usd" aria-hidden="true"></i></span>
                                                <asp:TextBox runat="server" TextMode="Password" ID="txt_cpassword" class="form-control" placeholder="Confirm Password" data-validation="required confirmation" data-validation-confirm="txt_password"></asp:TextBox>
                                            </div>
                                            <div class="input-group mg-b-pro-edt row">
                                                <%--<span class="input-group-addon"><i class="icon nalika-like" aria-hidden="true"></i></span>
                                                        <input type="text" class="form-control" placeholder="Category">--%>

                                             
                                                    <div class="col-lg-6">
                                                             <Label><font color="white">Upload Image :</font></Label>
                                                        <asp:FileUpload ID="FileUpload1" runat="server" onchange="previewFile()" data-validation="required"/><br />
                                                        <%--<asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="btnUpload_Click" />--%>
                                                    </div>
                                                    <div class="col-lg-6">

                                                   <%--<input ID="avatarUpload" type="file" name="file" onchange="previewFile()"  runat="server" />--%>
                                                        <asp:Image ID="Image1" runat="server"  Height="160px" ImageUrl="~/Admin/upload/agentimage/NoUser.jpg" Width="160px" /><br />
                                                        <asp:Label ID="lbl_sms" runat="server" Text=""></asp:Label>

                                                    </div>

                                                
                                            </div>
                                          
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="text-center custom-pro-edt-ds">

                                            <asp:Button runat="server" ID="btn_save" Text="Save" class="btn btn-ctl-bt waves-effect waves-light m-r-10" OnClick="btn_save_Click" />
                                            <asp:Button runat="server" ID="btn_discard" Text="Discard" class="btn btn-ctl-bt waves-effect waves-light m-r-10" OnClick="btn_discard_Click" />
                                            <%--<a href="ChannelDetails.aspx"><i class="btn btn-ctl-bt waves-effect waves-light m-r-10" >Discard</i> </a>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
    <br />
    <br />
    <br />
    <br />


    


    <!-- jquery
		============================================ -->
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="js/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="js/jquery-price-slider.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="js/jquery.meanmenu.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="js/owl.carousel.min.js"></script>
    <!-- sticky JS
		============================================ -->
    <script src="js/jquery.sticky.js"></script>
    <!-- scrollUp JS
		============================================ -->
    <script src="js/jquery.scrollUp.min.js"></script>
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/scrollbar/mCustomScrollbar-active.js"></script>
    <!-- metisMenu JS
		============================================ -->
    <script src="js/metisMenu/metisMenu.min.js"></script>
    <script src="js/metisMenu/metisMenu-active.js"></script>
    <!-- morrisjs JS
		============================================ -->
    <script src="js/sparkline/jquery.sparkline.min.js"></script>
    <script src="js/sparkline/jquery.charts-sparkline.js"></script>
    <!-- calendar JS
		============================================ -->
    <script src="js/calendar/moment.min.js"></script>
    <script src="js/calendar/fullcalendar.min.js"></script>
    <script src="js/calendar/fullcalendar-active.js"></script>
    <!-- tab JS
		============================================ -->
    <script src="js/tab.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="js/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="js/main.js"></script>

     <script>
        $.validate({
            modules: 'security',
            onModulesLoaded: function () {
                var optionalConfig = {
                    fontSize: '12pt',
                    padding: '4px',
                    bad: 'Very bad',
                    weak: 'Weak',
                    good: 'Good',
                    strong: 'Strong'
                };

                $('asp[ID="txt_password"]').displayPasswordStrength(optionalConfig);
            }
        });
    </script>
</asp:Content>

