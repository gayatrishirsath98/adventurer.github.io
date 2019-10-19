<%@ Page Title="" Language="C#" MasterPageFile="~/Client1.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Font Awesome -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,800,600,300,300italic,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">

    <!-- Material Design Bootstrap -->
    <link href="css/materialize.css" rel="stylesheet">


    <!-- Material Design Bootstrap -->
    <link href="css/progressbar.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <br />
    <br />
   
    <br />
    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <!-- Default form login -->
            <form runat="server" id="form1" class="text-center border border-light p-5">

                 <asp:Panel ID="Panel1" runat="server"  BorderStyle="Inset">
                <p class="h4 mb-4 center">Sign in</p>
                <br />  


               <asp:textbox class="form-control mb-4" id="txt_email" placeholder="E-mail" runat="server" required="true"></asp:textbox>

                <asp:textbox class="form-control mb-4" id="txt_password" placeholder="Password" runat="server" required="true"></asp:textbox>
                <div class="d-flex justify-content-around">
                    <div>

                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="defaultLoginFormRemember">
                        </div>
                    </div>

                </div>


                <asp:button class="btn btn-success" runat="server" text="Sign in" id="btn_login" onclick="btn_login_Click" />
                <!-- Register -->
                <p>
                    Not a member? <a href="Register.aspx">Register</a>
                </p>
                
             </asp:Panel>
            </form>
            <!-- Default form login -->
        </div>
        <div class="col-lg-4"></div>
    </div>

    <!-- Wow js -->
    <script type="text/javascript" src="js/wow.min.js"></script>
       
    <br /><br />
</asp:Content>

