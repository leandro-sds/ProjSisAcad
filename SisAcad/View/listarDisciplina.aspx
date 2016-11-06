<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="listarDisciplina.aspx.cs" Inherits="SisAcad.View.listarDisciplina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!-- Page -->
    <!-- Panel Header -->
    <div class="page-header">
      <h1 class="page-title">Listar</h1>
    </div>
    <!-- End Panel Header -->
    <!-- Page Content -->
    <div class="page-content container-fluid">
      <!-- Panel Content -->
      <div class="panel">
        <div class="panel-body">
            <asp:GridView CssClass="table table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="objDisc">
                <Columns>
                    <asp:BoundField DataField="disc_Cod" HeaderText="disc_Cod" SortExpression="disc_Cod"></asp:BoundField>
                    <asp:HyperLinkField DataNavigateUrlFields="disc_Cod" datanavigateurlformatstring="~\View/Disciplina.aspx?Codigo={0}" DataTextField="disc_Nome" HeaderText="Nome" Target="_self"/>
                    <asp:BoundField DataField="disc_Cred" HeaderText="disc_Cred" SortExpression="disc_Cred"></asp:BoundField>
                    <asp:BoundField DataField="disc_Tipo" HeaderText="disc_Tipo" SortExpression="disc_Tipo"></asp:BoundField>
                    <asp:BoundField DataField="disc_HoraObr" HeaderText="disc_HoraObr" SortExpression="disc_HoraObr"></asp:BoundField>
                    <asp:BoundField DataField="disc_Falta" HeaderText="disc_Falta" SortExpression="disc_Falta"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource runat="server" ID="objDisc" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.DisciplinaController"></asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
