﻿<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="listarProfessor.aspx.cs" Inherits="SisAcad.View.listarProfessor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!-- Page -->
    <div class="page-header">
      <h1 class="page-title">Listar Professor</h1>
    </div>
    <div class="page-content container-fluid">
      <!-- Panel Header -->
      <div class="panel">
        <div class="panel-body">
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
      </div>
      <!-- End Panel Header -->
    </div>
  <!-- End Page -->
</asp:Content>
