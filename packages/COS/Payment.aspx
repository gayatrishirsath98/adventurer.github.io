<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <br />
   
     <form id="form1" runat="server">
         
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
             <div class="center">
                <h2>PAY PAYEMNT</h2>
            </div>
            <br />
             <asp:Panel ID="Panel1" runat="server" BorderColor="Black"
                    Height="50%" Style="width: 100%" BackColor="#FFFFCC" BorderStyle="Solid" HorizontalAlign="Center" Width="100%">
           
                          <br />
    
                
            <div class="row">
                <div class="col-md-6 center">
                   Amount(In Word) : <asp:Label ID="lbl_amountInWord" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lbl_transationid" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-md-6 center">
                    Amount :<b><asp:Label ID="lbl_amount" runat="server" Text=""></asp:Label> /-</b> 
                </div>
            </div>
            <div class="center">
               <hr />
            <asp:Image runat="server" id="paymoney" Height="180px" ImageUrl="~/img/PaymentOption.jpg" Width="366px"></asp:Image>
                <input type="hidden" runat="server" id="key" name="key" value="gtKFFx" />
                <input type="hidden" runat="server" id="salt" name="salt" value="eCwWELxi" />
                <input type="hidden" runat="server" id="hash" name="hash" value=""  />
                <input type="hidden" runat="server" id="txnid" name="txnid" value="" />
               <br /><br /> <asp:Button ID="btn_Onlinepayment" runat="server" Text="Pay Online" class="btn-primary" OnClick="btn_Onlinepayment_Click" BorderColor="Black" BorderStyle="Solid" TabIndex="1" /><br /><br />
                 
                <p class="center">OR</p><br />

                
                <asp:Button ID="btn_OfflinePaymenr" runat="server" Text="Pay Offine" class="btn-primary" OnClick="btn_OfflinePaymenr_Click" BorderColor="Black" BorderStyle="Solid" ForeColor="White" />

            </div>
                          <br />
    <br />
               </asp:Panel>
             <br />
    <br />
        </div>
        <div class="col-md-3"></div>
    </div>

         </form>
      <br />
    <br />

</asp:Content>

