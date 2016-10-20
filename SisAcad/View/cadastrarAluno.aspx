<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="cadastrarAluno.aspx.cs" Inherits="SisAcad.View.cadastrarAluno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!-- Page -->
  <div class="page animsition">
    <div class="page-header">
      <h1 class="page-title">Cadastrar Aluno</h1>
    </div>
    <div class="page-content container-fluid">
      <!-- Panel Header -->
      <div class="panel">
        <div class="panel-body">
            <asp:FormView ID="FormView1" runat="server" DataSourceID="objAluno">
                <EditItemTemplate>
                    Id:
                    <asp:TextBox Text='<%# Bind("Id") %>' runat="server" ID="IdTextBox" /><br />
                    aluno_Mat:
                    <asp:TextBox Text='<%# Bind("aluno_Mat") %>' runat="server" ID="aluno_MatTextBox" /><br />
                    aluno_Nome:
                    <asp:TextBox Text='<%# Bind("aluno_Nome") %>' runat="server" ID="aluno_NomeTextBox" /><br />
                    aluno_TotCred:
                    <asp:TextBox Text='<%# Bind("aluno_TotCred") %>' runat="server" ID="aluno_TotCredTextBox" /><br />
                    aluno_DataNasc:
                    <asp:TextBox Text='<%# Bind("aluno_DataNasc") %>' runat="server" ID="aluno_DataNascTextBox" /><br />
                    aluno_MGP:
                    <asp:TextBox Text='<%# Bind("aluno_MGP") %>' runat="server" ID="aluno_MGPTextBox" /><br />
                    aluno_CodCurso:
                    <asp:TextBox Text='<%# Bind("aluno_CodCurso") %>' runat="server" ID="aluno_CodCursoTextBox" /><br />
                    <asp:LinkButton runat="server" Text="Atualizar" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Id:
                    <asp:TextBox Text='<%# Bind("Id") %>' runat="server" ID="IdTextBox" /><br />
                    aluno_Mat:
                    <asp:TextBox Text='<%# Bind("aluno_Mat") %>' runat="server" ID="aluno_MatTextBox" /><br />
                    aluno_Nome:
                    <asp:TextBox Text='<%# Bind("aluno_Nome") %>' runat="server" ID="aluno_NomeTextBox" /><br />
                    aluno_TotCred:
                    <asp:TextBox Text='<%# Bind("aluno_TotCred") %>' runat="server" ID="aluno_TotCredTextBox" /><br />
                    aluno_DataNasc:
                    <asp:TextBox Text='<%# Bind("aluno_DataNasc") %>' runat="server" ID="aluno_DataNascTextBox" /><br />
                    aluno_MGP:
                    <asp:TextBox Text='<%# Bind("aluno_MGP") %>' runat="server" ID="aluno_MGPTextBox" /><br />
                    aluno_CodCurso:
                    <asp:TextBox Text='<%# Bind("aluno_CodCurso") %>' runat="server" ID="aluno_CodCursoTextBox" /><br />
                    <asp:LinkButton runat="server" Text="Inserir" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                </InsertItemTemplate>
                <ItemTemplate>
                    Id:
                    <asp:Label Text='<%# Bind("Id") %>' runat="server" ID="IdLabel" /><br />
                    aluno_Mat:
                    <asp:Label Text='<%# Bind("aluno_Mat") %>' runat="server" ID="aluno_MatLabel" /><br />
                    aluno_Nome:
                    <asp:Label Text='<%# Bind("aluno_Nome") %>' runat="server" ID="aluno_NomeLabel" /><br />
                    aluno_TotCred:
                    <asp:Label Text='<%# Bind("aluno_TotCred") %>' runat="server" ID="aluno_TotCredLabel" /><br />
                    aluno_DataNasc:
                    <asp:Label Text='<%# Bind("aluno_DataNasc") %>' runat="server" ID="aluno_DataNascLabel" /><br />
                    aluno_MGP:
                    <asp:Label Text='<%# Bind("aluno_MGP") %>' runat="server" ID="aluno_MGPLabel" /><br />
                    aluno_CodCurso:
                    <asp:Label Text='<%# Bind("aluno_CodCurso") %>' runat="server" ID="aluno_CodCursoLabel" /><br />
                    <asp:LinkButton runat="server" Text="Novo" CommandName="New" ID="NewButton" CausesValidation="False" />
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource runat="server" ID="objAluno" DataObjectTypeName="SisAcad.Model.Aluno" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.AlunoController"></asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Header -->
    </div>
  </div>
  <!-- End Page -->
</asp:Content>
