<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="cadastrarCurso.aspx.cs" Inherits="SisAcad.View.listarCurso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!-- Page -->
    <div class="page-header">
      <h1 class="page-title">Cadastrar Curso</h1>
    </div>
    <div class="page-content container-fluid">
      <!-- Panel Header -->
      <div class="panel">
        <div class="panel-body">
            <asp:FormView ID="FormView1" runat="server" CssClass="form-horizontal" DataSourceID="objCurso" DefaultMode="Insert">
                <%-- INSERT --%>
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

                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <asp:LinkButton runat="server" Text="Inserir" CssClass="btn btn-primary" CommandName="Insert" ID="InsertButton" CausesValidation="True" />
                            <asp:LinkButton runat="server" Text="Cancelar" CssClass="btn btn-danger" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                        </div>
                    </div>
                </InsertItemTemplate>
                 <%-- INSERT --%>
            </asp:FormView>
            <asp:ObjectDataSource runat="server" ID="objCurso" DataObjectTypeName="SisAcad.Model.Curso" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.CursoController"></asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Header -->
    </div>
  <!-- End Page -->
</asp:Content>
