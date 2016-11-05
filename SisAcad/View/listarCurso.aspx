<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="listarCurso.aspx.cs" Inherits="SisAcad.View.listarCurso1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!-- Page -->
    <div class="page-header">
      <h1 class="page-title">Listar Cursos</h1>
    </div>
    <div class="page-content container-fluid">
      <!-- Panel Header -->
      <div class="panel">
        <div class="panel-body">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" DataKeyNames="curso_Cod" AutoGenerateColumns="False" DataSourceID="objCurso">
                <Columns>
                    <asp:BoundField DataField="curso_Cod" HeaderText="Código" SortExpression="curso_Cod" ReadOnly="True"></asp:BoundField>
                    <asp:BoundField DataField="curso_TotCred" HeaderText="Créditos" SortExpression="curso_TotCred"></asp:BoundField>
                    <asp:BoundField DataField="curso_Nome" HeaderText="Nome" SortExpression="curso_Nome"></asp:BoundField>
                    <%--<asp:BoundField DataField="curso_IdProf" HeaderText="Professor" SortExpression="curso_IdProf"></asp:BoundField>--%>
                    <asp:TemplateField HeaderText="Professor" SortExpression="curso_IdProf">
                        <ItemTemplate>
                            <asp:Label Text='<%# Bind("Professor.prof_Nome") %>' runat="server" ID="nomeProf"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:HyperLinkField DataNavigateUrlFields="curso_Cod" datanavigateurlformatstring="~\View/Curso.aspx?Codigo={0}" Text="Editar" HeaderText="Ação" Target="_self"/>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource runat="server" ID="objCurso" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.CursoController" DataObjectTypeName="SisAcad.Model.Curso" DeleteMethod="Delete" UpdateMethod="Update">
            </asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Header -->
    </div>
  <!-- End Page -->
</asp:Content>
