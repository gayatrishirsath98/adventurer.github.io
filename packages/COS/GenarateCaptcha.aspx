<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="GenarateCaptcha.aspx.cs" Inherits="GenarateCaptcha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <br />
    <br />
    <form id="form1" runat="server">
    <table>
     
      <tr><td></td>
      <td valign="middle">
     
          <table>
          <tr><td style="height: 50px; width: 100px;">
              <asp:Image ID="imgCaptcha" runat="server" /></td>
              <td valign="middle">
              <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" /></td></tr>
              <asp:Label ID="lblErrorMsg" runat="server" Text=""></asp:Label>

          </table>
          <tr><td>Enter Below Code : </td><td>
    <asp:TextBox ID="txtCaptcha" runat="server" Width="200px"></asp:TextBox></td></tr>
   
     
<asp:Button ID="btnRegiser" runat="server" Text="Register" OnClick="btnRegiser_Click"  />

 </table>
        </form>
</asp:Content>

