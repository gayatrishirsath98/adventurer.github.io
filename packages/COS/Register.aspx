<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Font Awesome -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,800,600,300,300italic,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">

    <!-- Material Design Bootstrap -->
    <link href="css/materialize.css" rel="stylesheet">


   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <br />
    <br />
    <br />
    <br />
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-8">
                <h3 style="color: forestgreen; text-align: center; font-family: Arial">Register Here</h3>
                <br />
                <table>
                    <tr>
                        <td>
                            <div class="md-form mb-0">
                            <asp:TextBox runat="server" ID="txt_name" class="form-control" data-validation="required custom" data-validation-regexp="^([A-Za-z ]+)$" data-validation-error-msg="Customer name has to be an character value"></asp:TextBox>

                            <label for="contact-name" class="">Your Full name</label>
                                </div></td>
                         
                        <td>
                            <div class="md-form mb-0">
                                <asp:TextBox runat="server" ID="txt_email" class="form-control" data-validation="required email"></asp:TextBox>
                                <label for="contact-email" class="">Your email</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="md-form mb-0">
                                <asp:TextBox runat="server" ID="txt_area" class="form-control" data-validation="required"></asp:TextBox>
                                <label for="contact-name" class="">Area</label>
                            </div>
                        </td>
                        <td>
                            <div class="md-form mb-0">
                                <asp:TextBox runat="server" ID="txt_city" class="form-control" data-validation="required"></asp:TextBox>
                                <label for="contact-email" class="">Village/City</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="md-form mb-0">
                                <asp:TextBox runat="server" ID="txt_district" class="form-control" data-validation="required"></asp:TextBox>
                                <label for="contact-Subject" class="">District</label>
                            </div>
                        </td>
                        <td>
                            <div class="md-form mb-0">
                                <asp:TextBox runat="server" ID="txt_state" class="form-control" data-validation="required"></asp:TextBox>
                                <label for="contact-Subject" class="">State</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="md-form mb-0">
                                <asp:TextBox runat="server" ID="txt_contact" class="form-control" data-validation="required  length number" data-validation-length="10"></asp:TextBox>
                                <label for="contact-Subject" class="">Contact No</label>
                            </div>
                        </td>
                        <td>
                            <div class="md-form mb-0">
                                <asp:TextBox runat="server" ID="txt_aadhar" class="form-control" data-validation="required length number" data-validation-length="12"></asp:TextBox>
                                <label for="contact-Subject" class="">Aadhar No</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="imgCaptcha" runat="server" BackColor="Yellow" ForeColor="Black" />
                            <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" /></td>
                        <td>
                            <asp:TextBox ID="txtCaptcha" runat="server" Width="200px" class="form-control" data-validation="required"></asp:TextBox>

                            <label for="contact-Subject" class="">Enter Above Code</label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblErrorMsg" runat="server" Font-Bold="true" ForeColor="Red" Text=""></asp:Label>

                        </td>
                    </tr>

                </table>
                <div class="text-center text-md-left center">
                    <asp:Button ID="btn_save" class="btn btn-success btn-md" runat="server" Text="Register" OnClick="btn_save_Click" />
                    <%-- <a class="btn btn-success btn-md">Save</a>--%>
                    <asp:Button ID="btn_cancel" class="btn btn-primary btn-md" runat="server" Text="Cancel" OnClick="btn_cancel_Click" />
                    <%-- <a class="btn btn-primary btn-md">Cancel</a>--%>
                </div>
            </div>
            <div class="col-lg-2"></div>
        </div>







    </form>

</asp:Content>

