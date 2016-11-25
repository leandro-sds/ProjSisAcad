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
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-1 control-label">Nome</label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="tbNome" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-1 control-label">Matricula</label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="tbMat" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <%--<div class="form-group">
                            <label class="col-sm-1 control-label">Curso</label>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="ddlCurso" CssClass="form-control" runat="server" DataSourceID="objCurso" DataTextField="curso_Nome" DataValueField="curso_Cod"></asp:DropDownList>
                                <asp:ObjectDataSource runat="server" ID="objCurso" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.CursoController"></asp:ObjectDataSource>
                            </div>
                        </div>--%>

                        <div class="form-group">
                            <div class="col-sm-2 col-sm-offset-1">
                                <asp:Button ID="btnPesq" CssClass="btn btn-primary" runat="server" Text="Pesquisar" />
                            </div>
                        </div>
                    </div>

                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" DataKeyNames="ID" AutoGenerateColumns="False" DataSourceID="objAluno">
                        <Columns>
                            <asp:BoundField DataField="aluno_Mat" HeaderText="Matricula" SortExpression="aluno_Mat"></asp:BoundField>
                            <asp:BoundField DataField="aluno_Nome" HeaderText="Nome" SortExpression="aluno_Nome"></asp:BoundField>
                            <asp:BoundField DataField="aluno_TotCred" HeaderText="Créditos" SortExpression="aluno_TotCred"></asp:BoundField>
                            <asp:BoundField DataField="aluno_DataNasc" HeaderText="Data de Nascimento" SortExpression="aluno_DataNasc"></asp:BoundField>
                            <asp:BoundField DataField="aluno_MGP" HeaderText="MGP" SortExpression="aluno_MGP"></asp:BoundField>
                            <asp:TemplateField HeaderText="Curso" SortExpression="aluno_CodCurso">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Bind("Curso.curso_Nome") %>' runat="server" ID="nomeCurso"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:BoundField DataField="aluno_CodCurso" HeaderText="Curso" SortExpression="aluno_CodCurso"></asp:BoundField>--%>
                            <asp:HyperLinkField DataNavigateUrlFields="Id" datanavigateurlformatstring="~\View/Aluno.aspx?Codigo={0}" Text="Editar" HeaderText="Ação" Target="_self"/>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource runat="server" ID="objAluno" DataObjectTypeName="SisAcad.Model.Aluno" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.AlunoController" UpdateMethod="Update">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="tbNome" PropertyName="Text" Name="nome" Type="String"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="tbMat" PropertyName="Text" Name="matricula" Type="String"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
            <!-- End Panel Header -->
        </div>
  <!-- End Page -->
</asp:Content>
