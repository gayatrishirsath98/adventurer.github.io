<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="DisplayChannel.aspx.cs" Inherits="DisplayChannel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .circle {
            /*height: 100%;
            width: 100%;
            border-radius: 95%;*/
            /*display: block;
            clear: both;
            width: 100%;
            float: left;
            margin: 0;
            padding: 15px;
            border-radius: 15px 15px 0 0;
            background: #f6f6f6;
            box-sizing: border-box;*/
            height: 200px;
            width: 50%;
            background-color: powderblue;
        }
        .card:hover {
  background-color: lightcyan;
  transform: scale(1.10) translateZ(0);
}

       
        span.copyavailabeinup {
            width: 100%;
            float: left;
            font-family: 'DINPro-Light';
            font-size: 14px;
            font-style: italic;
            text-align: center;
            background: none;
            padding: 5px 5px;
            margin: 0;
            color: #ff3300;
        }

        p.bharatoldprice {
            display: inline-block;
            padding: 0px 5px;
            position: relative;
        }


       
    </style>


    <!-- Material Design Bootstrap -->
    <link href="css/materialize.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="css/mdb.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <br />
    <br />
    <br />
    <br />
    <form id="form1" runat="server">

     <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <%-- <asp:ListView ID="ListView1" runat="server" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">--%>
               <div class="center">
                                <h5>Avialble Channels</h5>
                 </div>
                <div class="container">
                
                <asp:datalist id="DataList1" runat="server" class="vex-res" cellspacing="30" repeatcolumns="4" repeatdirection="Horizontal">
                   
                    <ItemTemplate>
                        <div class="list">
                           
                            
                                <div class="card hoverable purple-gradient">
                                    <div class="card-body" align="center">
                                       <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImageName", "~/Admin/upload/channelimage/{0}")%>'></asp:Image>
                                      <hr />
                                      <b><%#Eval("Channel_name") %></b> 
                              
                                        <asp:Label ID="lbl_packid" runat="server" Visible="false" Text='<%#Eval("Pack_id") %>'></asp:Label>
                                      <span class="copyavailabeinup">&nbsp;</span>
                                        <h6><i aria-hidden="true" class="fa fa-inr"></i>
                                              <p class="bharatoldprice"><b><%#Eval("Channel_prize")%></b> per Monthy</p></h6>
                                       
                                        <br />
                                        
                                    </div>

                               
                               </div>
                        </div>
                    </ItemTemplate>
                </asp:datalist>
                    </div>
               
            </div>
            <div class="col-md-1">
               
            </div>

        </div>
            
        </form>
     <style>
        .card-body {
            padding: 5px;
        }
    </style>
    <!-- wow js active -->
    <script type="text/javascript">
        new WOW().init();
        $("#mouseover").hover(function () {
            $(this).addClass("show");
        });
    </script>
    <!-- Wow js -->
    <script type="text/javascript" src="js/wow.min.js"></script>
     <br />
    <br />
    <br />
    <br />
</asp:Content>

