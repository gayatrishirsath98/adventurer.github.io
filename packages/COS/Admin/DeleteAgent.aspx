<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="DeleteAgent.aspx.cs" Inherits="Admin_DeleteAgent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<script type="text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want to Delete data?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <%--<asp:Button ID="btnconfirm" runat="server" Font-Bold="True" ForeColor="Red" Style="z-index: 101; left: 272px; position: absolute; top: 208px"
            Text="Confrimation MsgBox"
            OnClientClick=" return confirm_meth()" Width="160px" OnClick="btnconfirm_Click" />--%>

      <%--  <asp:Button ID="btnconfirm" runat="server" OnClick="OnConfirm" Text="Raise Confirm" OnClientClick="Confirm()" />--%>


    </form>

</asp:Content>

