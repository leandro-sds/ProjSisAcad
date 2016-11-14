<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="listarProfessor.aspx.cs" Inherits="SisAcad.View.listarProfessor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!-- Page -->
    <!-- Panel Header -->
    <div class="page-header">
      <h1 class="page-title">Listar Professor</h1>
    </div>
    <!-- End Panel Header -->

    <!-- Page Content -->
    <div class="page-content container-fluid">
      <div class="panel">
        <div class="panel-body">
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-1 control-label">Nome</label>
                    
                </div>
            </div>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" DataKeyNames="prof_Id" AutoGenerateColumns="False" DataSourceID="objProf">
                <Columns>
                    <asp:BoundField DataField="prof_Mat" HeaderText="Matricula" SortExpression="prof_Mat" ReadOnly="True"></asp:BoundField>
                    <asp:HyperLinkField DataNavigateUrlFields="prof_Id" datanavigateurlformatstring="~\View/Professor.aspx?Codigo={0}" DataTextField="prof_Nome" HeaderText="Nome" Target="_self"/>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource runat="server" ID="objProf" DataObjectTypeName="SisAcad.Model.Professor" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.ProfessorController" UpdateMethod="Update"></asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
