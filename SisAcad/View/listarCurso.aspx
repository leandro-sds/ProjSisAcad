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
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-1 control-label">Nome</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="tbNomePesq" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label">Professor</label>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="ddlProfPesq" CssClass="form-control" runat="server" DataSourceID="objProfPesq" DataTextField="prof_Nome" DataValueField="prof_Id">
                            <asp:ListItem Text="Todos" Value="-1" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:ObjectDataSource runat="server" ID="objProfPesq" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.ProfessorController"></asp:ObjectDataSource>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-2 col-sm-offset-1">
                        <asp:Button ID="btnPesq" CssClass="btn btn-primary" runat="server" Text="Pesquisar" />
                    </div>
                </div>
            </div>
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
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbNomePesq" PropertyName="Text" Name="nome" Type="String"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="ddlProfPesq" PropertyName="SelectedValue" Name="id" Type="Int32"></asp:ControlParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Header -->
    </div>
  <!-- End Page -->
</asp:Content>
