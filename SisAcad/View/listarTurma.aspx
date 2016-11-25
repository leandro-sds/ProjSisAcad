<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="listarTurma.aspx.cs" Inherits="SisAcad.View.listarTurma" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!-- Page -->
    <!-- Panel Header -->
    <div class="page-header">
      <h1 class="page-title">Cadastrar</h1>
    </div>
    <!-- End Panel Header -->
    <!-- Page Content -->
    <div class="page-content container-fluid">
      <!-- Panel Content -->
      <div class="panel">
        <div class="panel-body">
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-1 control-label">Semestre</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="tbSemestre" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label">Curso</label>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="ddlCurso" CssClass="form-control" runat="server" DataSourceID="objCurso" DataTextField="curso_Nome" DataValueField="curso_Cod"></asp:DropDownList>
                        <asp:ObjectDataSource runat="server" ID="objCurso" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.CursoController"></asp:ObjectDataSource>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-2 col-sm-offset-1">
                        <asp:Button ID="btnPesq" CssClass="btn btn-primary" runat="server" Text="Pesquisar" />
                    </div>
                </div>
            </div>

            <asp:GridView ID="gridTurma" runat="server" DataSourceID="objTurma"></asp:GridView>
            <asp:ObjectDataSource runat="server" ID="objTurma"></asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
