<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="listarAluno.aspx.cs" Inherits="SisAcad.View.Aluno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!-- Page -->
        <div class="page-header">
            <h1 class="page-title">Lista de Alunos</h1>
        </div>
        <div class="page-content container-fluid">
            <!-- Panel Header -->
            <div class="panel">
                <div class="panel-body">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" DataKeyNames="ID" AutoGenerateColumns="False" DataSourceID="objAluno">
                        <Columns>
                            <asp:BoundField DataField="aluno_Mat" HeaderText="Matricula" SortExpression="aluno_Mat"></asp:BoundField>
                            <asp:BoundField DataField="aluno_Nome" HeaderText="Nome" SortExpression="aluno_Nome"></asp:BoundField>
                            <asp:BoundField DataField="aluno_TotCred" HeaderText="Créditos" SortExpression="aluno_TotCred"></asp:BoundField>
                            <asp:BoundField DataField="aluno_DataNasc" HeaderText="Data de Nascimento" SortExpression="aluno_DataNasc"></asp:BoundField>
                            <asp:BoundField DataField="aluno_MGP" HeaderText="MGP" SortExpression="aluno_MGP"></asp:BoundField>
                            <asp:BoundField DataField="aluno_CodCurso" HeaderText="Curso" SortExpression="aluno_CodCurso"></asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="Id" datanavigateurlformatstring="~\View/Aluno.aspx?Codigo={0}" Text="Editar" HeaderText="Ação" Target="_self"/>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource runat="server" ID="objAluno" DataObjectTypeName="SisAcad.Model.Aluno" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.AlunoController" UpdateMethod="Update">
                    </asp:ObjectDataSource>
                </div>
            </div>
            <!-- End Panel Header -->
        </div>
  <!-- End Page -->
</asp:Content>
