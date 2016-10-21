<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="cadastrarProfessor.aspx.cs" Inherits="SisAcad.View.cadastrarProfessor" %>
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
      
      <div class="panel">
        <div class="panel-body">
            <asp:FormView ID="FormView1" runat="server" CssClass="form-horizontal" DataSourceID="objProf" DefaultMode="Insert">
                <InsertItemTemplate>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Nome</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("prof_Nome") %>' runat="server" CssClass="form-control" ID="prof_NomeTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <asp:LinkButton runat="server" Text="Inserir" CssClass="btn btn-primary" CommandName="Insert" ID="InsertButton" CausesValidation="True" />
                            <asp:LinkButton runat="server" Text="Cancelar" CssClass="btn btn-danger" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                        </div>
                    </div>
                </InsertItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource runat="server" ID="objProf" DataObjectTypeName="SisAcad.Model.Professor" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.ProfessorController"></asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
