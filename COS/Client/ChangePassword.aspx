<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
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
                                <asp:Panel ID="Panel1" runat="server">

                                <div>
                                    <h3 style="text-align: center; color: darkslateblue">Change Password</h3>
                                </div>
                                <br />
                                <div class="md-form mb-0">
                                    <asp:textbox runat="server" id="txt_currentpassword" class="form-control"></asp:textbox>
                                    <label for="contact-name" class="">Current Password</label>
                                </div>
                                <div class="md-form mb-0">
                                    <asp:textbox runat="server" id="txt_newpassword" class="form-control"></asp:textbox>
                                    <label for="contact-email" class="">New Password</label>
                                </div>
                                <div class="md-form mb-0">
                                    <asp:textbox runat="server" id="txt_confirmpassword" class="form-control"></asp:textbox>
                                    <label for="contact-name" class="">Confirm Password</label>
                                </div>

                                <div>
                                    <asp:label runat="server" id="lbl_Error" text=""></asp:label>
                                </div>

                        </asp:Panel>

                            </div>
                            <!-- Grid column -->

                        </div>
                        <!-- Grid row -->

                    </div>
                    <br />
                    <br />
                    <!-- Grid row -->
                    <div class="text-center center">
                        <asp:button id="btn_change" class="btn-success" runat="server" text="Change" onclick="btn_change_Click" />
                        <asp:button id="btn_cancel" runat="server" class="btn-danger" text="Cancel" onclick="btn_cancel_Click" />
                        <%-- <a class="btn btn-success btn-md">Save</a>--%>
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

