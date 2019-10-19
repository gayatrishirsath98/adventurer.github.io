<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="Contactus.aspx.cs" Inherits="Client_Contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- Font Awesome -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,800,600,300,300italic,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">

    <!-- Material Design Bootstrap -->
    <link href="css/materialize.css" rel="stylesheet">


   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br /><br /><br />    
    <!--Section: Contact v.2-->
    <div class="row">
        <div class="col-md-2"></div>
         <div class="col-md-8">

             <section class="mb-4">

    <!--Section heading-->
    <h3 class="h1-responsive font-weight-bold text-center my-4 center">Contact us</h3>
    <!--Section description-->
    <p class="text-center w-responsive mx-auto mb-5">Do you have any questions? Please do not hesitate to contact us directly. Our team will come back to you within
        a matter of hours to help you.</p>

    <div class="row">

        <!--Grid column-->
        <div class="col-md-9 mb-md-0 mb-5">
            <form id="form1" runat="server">

                <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                            <asp:TextBox ID="txt_name" runat="server" class="form-control" data-validation="required custom" data-validation-regexp="^([A-Za-z ]+)$"></asp:TextBox>
                          
                            <label for="name" class="">Your name</label>
                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                             <asp:TextBox ID="txt_email" runat="server" class="form-control" data-validation="required email"></asp:TextBox>
                         
                            <label for="email" class="">Your email</label>
                        </div>
                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->

                <!--Grid row-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="md-form mb-0">
                             <asp:TextBox ID="txt_subject" runat="server" class="form-control" data-validation="required"></asp:TextBox>
                          
                            <label for="subject" class="">Subject</label>
                        </div>
                    </div>
                </div>
                <!--Grid row-->

                <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-12">
                        
                        <div class="md-form">
                             <asp:TextBox ID="txt_message" runat="server" class="form-control md-textarea" data-validation="required"></asp:TextBox>
                           
                          
                            <label for="message">Your message</label>
                        </div>

                    </div>
                </div>
                <!--Grid row-->
                 <div class="text-center text-md-left">
                <asp:Button ID="btn_send" runat="server" Text="Send" class="btn btn-default" OnClick="btn_send_Click1"/>
                
            </div>
            <div class="status"></div>

            </form>

           
        </div>
        <!--Grid column-->

       

    </div>

</section>
<!--Section: Contact v.2-->

         </div>
         <div class="col-md-2"></div>
    </div>




    <br /><br /><br />   


</asp:Content>

