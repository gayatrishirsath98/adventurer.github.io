<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="GraphicalReport.aspx.cs" Inherits="GraphicalReport" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <asp:Panel ID="Panel1" runat="server">
        <div class="row">
            <div class="col-md-12">
                 <asp:Chart ID="Chart1" runat="server" BorderlineColor="Black" Height="433px" Width="1300px">
            <Series>
                <asp:Series Name="Series1"></asp:Series>
            </Series>
            <Legends>
                <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="false" Name="Default" LegendStyle="Column"></asp:Legend>
            </Legends>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                    <AxisY Title="Order(Number Of Times)" TitleFont="Microsoft Sans Serif, 12pt, style=Bold">
                    </AxisY>
                    <AxisX Title="Pack Names" TitleFont="Microsoft Sans Serif, 12pt, style=Bold">
                    </AxisX>
                </asp:ChartArea>
            </ChartAreas>
            <Titles>
                <asp:Title  Font="Microsoft Sans Serif, 14.25pt, style=Bold" ForeColor="Red" Name="Title1" Text="Which Pack Ordered Maximum Time">
                </asp:Title>
            </Titles>
        </asp:Chart>
            </div>
             <div class="col-md-12">
                 <asp:Chart ID="Chart2" runat="server" BorderlineColor="Black" Height="433px" Width="1300px">
            <Series>
                <asp:Series Name="Series1"></asp:Series>
            </Series>
            <Legends>
                <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="false" Name="Default" LegendStyle="Column"></asp:Legend>
            </Legends>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                    <AxisY Title="Order(Number Of Times)" TitleFont="Microsoft Sans Serif, 12pt, style=Bold">
                    </AxisY>
                    <AxisX Title="Pack Names" TitleFont="Microsoft Sans Serif, 12pt, style=Bold">
                    </AxisX>
                </asp:ChartArea>
            </ChartAreas>
            <Titles>
                <asp:Title  Font="Microsoft Sans Serif, 14.25pt, style=Bold" ForeColor="Red" Name="Title1" Text="Which Pack Ordered Maximum Time">
                </asp:Title>
            </Titles>
        </asp:Chart>

            </div>
        </div>

       
    </asp:Panel>
    <br />
    <br />
    <br />
</asp:Content>

