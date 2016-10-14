<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="listarCurso.aspx.cs" Inherits="SisAcad.View.listarCurso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!-- Page -->
  <div class="page animsition">
    <div class="page-header">
      <h1 class="page-title">Cadastrar</h1>
    </div>
    <div class="page-content container-fluid">
      <!-- Panel Header -->
      <div class="panel">
        <div class="panel-body">
            <asp:FormView ID="FormView1" runat="server" DataSourceID="objCurso" DefaultMode="Insert">
                <EditItemTemplate>
                    curso_TotCred:
                    <asp:TextBox Text='<%# Bind("curso_TotCred") %>' runat="server" ID="curso_TotCredTextBox" /><br />
                    curso_Nome:
                    <asp:TextBox Text='<%# Bind("curso_Nome") %>' runat="server" ID="curso_NomeTextBox" /><br />
                    curso_IdProf:
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="objProfGet" DataTextField="prof_Nome" DataValueField="prof_Mat"></asp:DropDownList>
                    <asp:ObjectDataSource runat="server" ID="objProfGet" OldValuesParameterFormatString="original_{0}" SelectMethod="Get" TypeName="SisAcad.Controllers.ProfessorController"></asp:ObjectDataSource>
                    <asp:LinkButton runat="server" Text="Atualizar" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                </EditItemTemplate>

                <%-- INSERT --%>
                <InsertItemTemplate>
                    curso_TotCred:
                    <asp:TextBox Text='<%# Bind("curso_TotCred") %>' runat="server" ID="curso_TotCredTextBox" /><br />

                    curso_Nome:
                    <asp:TextBox Text='<%# Bind("curso_Nome") %>' runat="server" ID="curso_NomeTextBox" /><br />

                    curso_IdProf:
                   <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="objProf" DataTextField="prof_Nome" DataValueField="prof_Id" Text='<%# Bind("curso_IdProf") %>'></asp:DropDownList>
                    <asp:ObjectDataSource runat="server" ID="objProf" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.ProfessorController"></asp:ObjectDataSource>
                    <asp:LinkButton runat="server" Text="Inserir" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                </InsertItemTemplate>
                 <%-- INSERT --%>

                <ItemTemplate>
                    curso_TotCred:
                    <asp:Label Text='<%# Bind("curso_TotCred") %>' runat="server" ID="curso_TotCredLabel" /><br />
                    curso_Nome:
                    <asp:Label Text='<%# Bind("curso_Nome") %>' runat="server" ID="curso_NomeLabel" /><br />
                    curso_IdProf:
                    <asp:Label Text='<%# Bind("curso_IdProf") %>' runat="server" ID="curso_IdProfLabel" /><br />
                    <asp:LinkButton runat="server" Text="Novo" CommandName="New" ID="NewButton" CausesValidation="False" />
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource runat="server" ID="objCurso" DataObjectTypeName="SisAcad.Model.Curso" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.CursoController"></asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Header -->
    </div>
  </div>
  <!-- End Page -->
</asp:Content>
