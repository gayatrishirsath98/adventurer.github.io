<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Employee.aspx.cs" Inherits="Admin_Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <form id="form1" runat="server">  
    <div>  
        <table>  
            <tr>  
                <td colspan="2">  
                    <h2>Employee Details</h2>  
                </td>  
            </tr>  
            <tr>  
                <td>ID</td>  
                <td><asp:TextBox ID="txtID" runat="server" Width="211px"></asp:TextBox></td>  
            </tr>  
            <tr>  
                <td>Name</td>  
                <td><asp:TextBox ID="txtName" runat="server" Width="211px"></asp:TextBox></td>  
            </tr>  
            <tr>  
                <td>BloodGroup</td>  
                <td><asp:TextBox ID="txtBloodGroup" runat="server" Width="211px"></asp:TextBox></td>  
            </tr>  
            <tr>  
                <td>Emergency Contact No.</td>  
                <td><asp:TextBox ID="txtContactNo" runat="server" Width="211px"></asp:TextBox></td>  
            </tr>  
            <tr>  
                <td>Photo:</td>  
                <td><asp:FileUpload ID="fileuploadEmpImage" runat="server" Width="180px" /></td>  
            </tr>  
            <tr>  
                <td colspan="2"><asp:Button ID="btnSubmit" runat="server" Text="Save" OnClick="btnSubmit_Click" /></td>  
            </tr>  
        </table>  
    </div>  
    <div>  
        <asp:GridView ID="grdEmployee" runat="server" AutoGenerateColumns="false">  
            <Columns>  
             <asp:BoundField HeaderText="Name" DataField="Name" />  
              <asp:BoundField HeaderText="Blood Group" DataField="BloodGroup" />  
              <asp:BoundField HeaderText="Phone No" DataField="PhoneNo" />  
                <asp:BoundField HeaderText="Image" DataField="Image" Visible="false" />  
                <asp:TemplateField HeaderText="Image">  
                    <ItemTemplate>  
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "EmployeeImageHandler.aspx?Id="+ Eval("Id") %>'  
                            Height="150px" Width="150px" />  
                    </ItemTemplate>  
                </asp:TemplateField>  
            </Columns>  
        </asp:GridView>  
    </div>  
    </form>  
</asp:Content>

