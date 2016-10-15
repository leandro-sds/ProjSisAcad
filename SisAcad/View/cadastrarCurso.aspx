<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="cadastrarCurso.aspx.cs" Inherits="SisAcad.View.listarCurso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!-- Page Head -->
    <div class="page-header">
      <h1 class="page-title">Cadastrar</h1>
    </div>
    <!-- End Page Head -->

    <!-- Page Content -->
    <div class="page-content container-fluid">
      <div class="panel">
        <div class="panel-body">
            <asp:FormView ID="FormView1" runat="server" CssClass="form-horizontal" DataSourceID="objCurso" DefaultMode="Insert">
                <InsertItemTemplate>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Nome: </label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("curso_Nome") %>' runat="server" CssClass="form-control" ID="curso_NomeTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Créditos: </label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("curso_TotCred") %>' runat="server" CssClass="form-control" ID="curso_TotCredTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Professor: </label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" DataSourceID="objProf" DataTextField="prof_Nome" DataValueField="prof_Id" Text='<%# Bind("curso_IdProf") %>'></asp:DropDownList>
                            <asp:ObjectDataSource runat="server" ID="objProf" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.ProfessorController"></asp:ObjectDataSource>
                        </div>
                    </div>
                    <asp:LinkButton runat="server" Text="Inserir" CssClass="btn btn-primary" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CssClass="btn btn-danger" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                </InsertItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource runat="server" ID="objCurso" DataObjectTypeName="SisAcad.Model.Curso" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.CursoController"></asp:ObjectDataSource>
        </div>
      </div>
    </div>
    <!-- End Page Content -->
</asp:Content>