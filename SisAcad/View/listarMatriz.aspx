<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="listarMatriz.aspx.cs" Inherits="SisAcad.View.listarMatriz" %>
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
                    <label class="col-sm-1 control-label">Periodo</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="tbPeriodo" MaxLength="1" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <%--<div class="form-group">
                    <label class="col-sm-1 control-label">Curso</label>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="ddlCurso" CssClass="form-control" runat="server" DataSourceID="objCurso" DataTextField="curso_Nome" DataValueField="curso_Cod"></asp:DropDownList>
                        <asp:ObjectDataSource runat="server" ID="objCurso" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.CursoController"></asp:ObjectDataSource>
                    </div>
                </div>--%>

                <%--<div class="form-group">
                    <label class="col-sm-1 control-label">Disciplina</label>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="ddlDisc" CssClass="form-control" runat="server" DataSourceID="objDisc" DataTextField="disc_Nome" DataValueField="disc_Cod"></asp:DropDownList>
                        <asp:ObjectDataSource runat="server" ID="objDisc" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.DisciplinaController"></asp:ObjectDataSource>
                    </div>
                </div>--%>

                <div class="form-group">
                    <div class="col-sm-2 col-sm-offset-1">
                        <asp:Button ID="btnPesq" CssClass="btn btn-primary" runat="server" Text="Pesquisar" />
                    </div>
                </div>
            </div>

            <asp:GridView ID="gridMatriz" runat="server" CssClass="table table-bordered" DataSourceID="objMatriz" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="Curso" SortExpression="matriz_CodCurso">
                        <ItemTemplate>
                            <asp:Label Text='<%# Bind("Curso.curso_Nome") %>' runat="server" ID="lblCursoNome"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="matriz_Periodo" HeaderText="Periodo" SortExpression="matriz_Periodo"></asp:BoundField>

                    <asp:TemplateField HeaderText="Disciplina" SortExpression="matriz_CodDisc">
                        <ItemTemplate>
                            <asp:Label Text='<%# Bind("Disciplina.disc_Nome") %>' runat="server" ID="lblCursoNome"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--<asp:BoundField DataField="matriz_CodCurso" HeaderText="matriz_CodCurso" SortExpression="matriz_CodCurso"></asp:BoundField>
                    <asp:BoundField DataField="matriz_CodDisc" HeaderText="matriz_CodDisc" SortExpression="matriz_CodDisc"></asp:BoundField>--%>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource runat="server" ID="objMatriz" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.MatrizController">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbPeriodo" PropertyName="Text" Name="periodo" Type="Int32"></asp:ControlParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
