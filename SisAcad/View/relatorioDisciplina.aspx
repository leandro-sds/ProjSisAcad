<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="relatorioDisciplina.aspx.cs" Inherits="SisAcad.View.relatorioDisciplina" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <ajax:ToolkitScriptManager runat="server" ID="id"></ajax:ToolkitScriptManager>

     <ajax:BarChart ID="BarChart1" runat="server"
                ChartHeight="300" ChartWidth="450" ChartType="Column"
                ChartTitle="United States versus European Widget Production"
                CategoriesAxis="2007,2008,2009,2010,2011,2012"
                ChartTitleColor="#0E426C" CategoryAxisLineColor="#D08AD9"
                ValueAxisLineColor="#D08AD9" BaseLineColor="#A156AB">
                <Series>
                    <ajax:BarChartSeries name="United States" barcolor="#6C1E83"
                        data="110, 189, 255, 95, 107, 140" />
                    <ajax:BarChartSeries Name="Europe" BarColor="#D08AD9"
                        Data="49, 77, 95, 68, 70, 79" />
                </Series>
            </ajax:BarChart>
    <!-- Page -->
    <!-- Panel Header -->
    <div class="page-header">
      <h1 class="page-title">Relatório</h1>
    </div>
    <!-- End Panel Header -->
    <!-- Page Content -->
    <div class="page-content container-fluid">
      <!-- Panel Content -->
      <div class="panel">
        <div class="panel-body">
            
           
            
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
