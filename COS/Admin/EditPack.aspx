<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="EditPack.aspx.cs" Inherits="Admin_EditPack" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Edit Pack</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">





    <script type="text/javascript">
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
    </script>



    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- nalika Icon CSS
		============================================ -->
    <link rel="stylesheet" href="css/nalika-icon.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.css">
    <link rel="stylesheet" href="css/owl.transitions.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="css/normalize.css">
    <!-- meanmenu icon CSS
		============================================ -->
    <link rel="stylesheet" href="css/meanmenu.min.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="css/main.css">
    <!-- morrisjs CSS
		============================================ -->
    <link rel="stylesheet" href="css/morrisjs/morris.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- metisMenu CSS
		============================================ -->
    <link rel="stylesheet" href="css/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="css/metisMenu/metisMenu-vertical.css">
    <!-- calendar CSS
		============================================ -->
    <link rel="stylesheet" href="css/calendar/fullcalendar.min.css">
    <link rel="stylesheet" href="css/calendar/fullcalendar.print.min.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <br />
    <form id="form1" runat="server">

        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="review-tab-pro-inner">
                        <ul id="myTab3" class="tab-review-design">
                            <li class="active"><a href="#description"><i class="icon nalika-edit" aria-hidden="true"></i>Add Pack</a></li>
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
                                                <asp:TextBox runat="server" ID="txt_packname" 
                                                    class="form-control" placeholder="Pack Name"></asp:TextBox>
                                            </div>
                                            <div class="input-group mg-b-pro-edt">
                                                <span class="input-group-addon"><i class="icon nalika-edit" aria-hidden="true"></i></span>
                                                <asp:TextBox runat="server" ID="txt_prize"   class="form-control" placeholder="Pack Prize"></asp:TextBox>
                                            </div>
                                            <div class="input-group mg-b-pro-edt">
                                                <span class="input-group-addon"><i class="fa fa-usd" aria-hidden="true"></i></span>
                                                <asp:TextBox runat="server" ID="txt_type" data-validation="length alphanumeric" data-validation-length="min2" class="form-control" placeholder="Pack Type"></asp:TextBox>
                                            </div>
                                            <div class="input-group mg-b-pro-edt">
                                                <span class="input-group-addon"><i class="icon nalika-new-file" aria-hidden="true"></i></span>
                                                <asp:TextBox runat="server" ID="txt_totalchannel" data-validation="length alphanumeric" data-validation-length="min2" class="form-control" placeholder="Total Channel"></asp:TextBox>
                                            </div>
                                             <div class="input-group mg-b-pro-edt">
                                                <span class="input-group-addon"><i class="icon nalika-new-file" aria-hidden="true"></i></span>
                                                <asp:TextBox runat="server" ID="txt_details"  class="form-control" placeholder="Description(Optional)"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                      
                                            <div class="input-group mg-b-pro-edt row">
                                                <%--<span class="input-group-addon"><i class="icon nalika-like" aria-hidden="true"></i></span>
                                                        <input type="text" class="form-control" placeholder="Category">--%>

                                             
                                                    <div class="col-lg-6">
                                                             <Label><font color="white">Upload Image :</font></Label>
                                                        <asp:FileUpload ID="FileUpload1" runat="server" onchange="previewFile()" /><br />
                                                        <%--<asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="btnUpload_Click" />--%>
                                                    </div>
                                                    <div class="col-lg-6">

                                                   <%--<input ID="avatarUpload" type="file" name="file" onchange="previewFile()"  runat="server" />--%>
                                                        <asp:Image ID="Image1" runat="server"  Height="160px" ImageUrl="~/Admin/upload/packimage/NoUser.jpg" Width="160px" /><br />
                                                        <asp:Label ID="lbl_sms" runat="server" Text=""></asp:Label>

                                                    </div>

                                                
                                            </div>
                                            <%--  <select name="select" class="form-control pro-edt-select form-control-primary">
															<option value="opt1">Select One Value Only</option>
															<option value="opt2">2</option>
															<option value="opt3">3</option>
															<option value="opt4">4</option>
															<option value="opt5">5</option>
															<option value="opt6">6</option>
														</select>--%>
                                        </div>
                                  
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="text-center custom-pro-edt-ds">

                                            <asp:Button runat="server" ID="btn_update" Text="Update" class="btn btn-ctl-bt waves-effect waves-light m-r-10" OnClick="btn_update_Click"/>
                                            <asp:Button runat="server" ID="btn_discard" Text="Discard" class="btn btn-ctl-bt waves-effect waves-light m-r-10" OnClick="btn_discard_Click"/>
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


    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
    <script>
        $.validate({
            lang: 'es',
            modules: 'location',
            onModulesLoaded: function () {
                $('input[name="user_country"]').suggestCountry();
                $('input[name="user_home_state"]').suggestState();
            }
        });
    </script>


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
</asp:Content>

