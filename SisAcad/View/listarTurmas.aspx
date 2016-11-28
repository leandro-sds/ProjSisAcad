<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="listarTurmas.aspx.cs" Inherits="SisAcad.View.listarTurma" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
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
                    <label class="col-sm-1 control-label">Semestre</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="tbSemestre" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:MaskedEditExtender ID="maskSemestre" Mask="9999.9" TargetControlID="tbSemestre" runat="server"></asp:MaskedEditExtender>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label">Curso</label>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="ddlCurso" CssClass="form-control" runat="server" DataSourceID="objCurso" DataTextField="curso_Nome" DataValueField="curso_Cod"></asp:DropDownList>
                        <asp:ObjectDataSource runat="server" ID="objCurso" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.CursoController"></asp:ObjectDataSource>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-2 col-sm-offset-1">
                        <asp:Button ID="btnPesq" CssClass="btn btn-primary" runat="server" Text="Pesquisar" />
                    </div>
                </div>
            </div>

            <asp:GridView ID="gridTurma" runat="server" CssClass="table table-bordered" DataSourceID="objTurma" AutoGenerateColumns="False">
                <Columns>
                    <%--<asp:BoundField DataField="Ano" HeaderText="turma_Ano" SortExpression="turma_Ano"></asp:BoundField>--%>
                    <asp:BoundField DataField="turma_Semestre" HeaderText="Semestre" SortExpression="turma_Semestre"></asp:BoundField>
                    <asp:TemplateField HeaderText="Curso" SortExpression="turma_DiscCod">
                        <ItemTemplate>
                            <asp:Label Text='<%# Bind("Curso.curso_Nome") %>' runat="server" ID="lblCursoNome"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:BoundField DataField="turma_DiscCod" HeaderText="turma_DiscCod" SortExpression="turma_DiscCod"></asp:BoundField>--%>
                    <asp:BoundField DataField="turma_Vagas" HeaderText="Vagas" SortExpression="turma_Vagas"></asp:BoundField>
                    <asp:TemplateField HeaderText="Professor" SortExpression="turma_IdProf">
                        <ItemTemplate>
                            <asp:Label Text='<%# Bind("Professor.prof_Nome") %>' runat="server" ID="lblProfessorNome"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:BoundField DataField="turma_IdProf" HeaderText="turma_IdProf" SortExpression="turma_IdProf"></asp:BoundField>--%>
                    <asp:TemplateField HeaderText="Disciplina" SortExpression="turma_DiscCod">
                        <ItemTemplate>
                            <asp:Label Text='<%# Bind("Disciplina.disc_Nome") %>' runat="server" ID="lblDiscNome"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:BoundField DataField="turma_CursoCod" HeaderText="turma_CursoCod" SortExpression="turma_CursoCod"></asp:BoundField>--%>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource runat="server" ID="objTurma" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.TurmasController">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbSemestre" PropertyName="Text" Name="semestre" Type="String"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="ddlCurso" PropertyName="SelectedValue" Name="codCurso" Type="Int32"></asp:ControlParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
