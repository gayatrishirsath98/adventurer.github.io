<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="DisplayPackChannel.aspx.cs" Inherits="DisplayPackChannel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
            padding: 5px 10px;
            margin: 0;
            color: #ff3300;
        }

        p.bharatoldprice {
            display: inline-block;
            padding: 0px 10px;
            position: relative;
        }


       
    </style>


    <!-- Material Design Bootstrap -->
    <link href="css/materialize.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="css/mdb.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                                <h5 class="zoomOut">Avialble Packs</h5>
                 </div>
                <asp:datalist id="DataList1" runat="server" class="vex-res" cellspacing="30" repeatcolumns="4" repeatdirection="Horizontal">
                   
                    <ItemTemplate>
                        <div class="list">

                            
                                <div class="card hoverable">
                                    <div class="card-body" align="center">
                                        
                                             <a href="DisplayPackChannel.aspx?key='<%#Eval("Pack_id") %>'">
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImageName", "~/Admin/upload/packimage/{0}")%>'></asp:Image></a>
                    
                                       
                                       <hr />
                                      <h4><%#Eval("Pack_name") %></h4> 
                                          <br />
                                        <asp:Label ID="lbl_packid" runat="server" Visible="false" Text='<%#Eval("Pack_id") %>'></asp:Label>
                                       <h5><%#Eval("Totalchannels") %> Channels &amp; Services</h5>
                                         <span class="copyavailabeinup">&nbsp;</span>
                                        <h6><i aria-hidden="true" class="fa fa-inr"></i>
                                              <p class="bharatoldprice"><b><%#Eval("Pack_prize")%></b> Monthy</p><h6
                                       
                                        <br />
                                        Type :<strong><%#Eval("Pack_type") %></strong><br />

                                    </div>

                               
                               </div>
                        </div>
                    </ItemTemplate>
                </asp:datalist>
                <%-- </asp:ListView>--%>
            </div>
            <div class="col-md-1">
                <%--<div class="mapdatabox" id="1270_bharatcombo" data-id="1270" data-packageid="1270" data-genre="DPO" data-name="BHARAT COMBO" data-price="165" data-ncf="0" data-ishd="0" data-channelcount="30" data-group="" data-type="dpo">
                    <img src="/images/packs/bharat.jpg" alt="BHARAT COMBO"><h4>BHARAT COMBO </h4>
                    <h5>30 Channels &amp; Services</h5>
                    <span class="copyavailabeinup">&nbsp;</span><h6><i aria-hidden="true" class="fa fa-inr"></i>
                        <p class="bharatoldprice">150</p>
                        <i aria-hidden="true" class="fa fa-inr"></i>140*<span>Monthly</span></h6>
                    <aside onclick="ShowBouquetChannelList('BHARAT COMBO','0',1270,'S');">View Details</aside>
                    <div class="comparebox">
                        <input id="BHARAT COMBO-1270" pack-name="BHARAT COMBO" pack-id="1270" type="checkbox" value="remember me" name="remember" onclick="mycheckbox('BHARAT COMBO',1270);"><label class="remember_mecombo" for="BHARAT COMBO-1270"><span>Compare</span></label></div>
                </div>--%>
            </div>

        </div>


    </form>
    <br />
    <br />
    <br />
    <br />
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

</asp:Content>
