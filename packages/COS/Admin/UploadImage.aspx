<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="UploadImage.aspx.cs" Inherits="Admin_UploadImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
         <hr /><br /><br /><br /><br />
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-6">
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="btnUpload_Click" />
                <hr />
                <asp:Image ID="Image1" runat="server" Height="100" Width="100" />
                <asp:Label ID="lbl_sms" runat="server" Text=""></asp:Label>
                 <hr /><br /><br /><br /><br />
            </div>
            <div class="col-lg-3"></div>
        </div>
        
    </form>

</asp:Content>

