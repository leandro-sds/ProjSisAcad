<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="Matricula.aspx.cs" Inherits="SisAcad.View.Matricula" %>
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
                    <label class="col-sm-3 control-label">Semestre Letivo</label>
                    <div class="col-sm-4">
                        <asp:Label ID="lblPeriodo" runat="server" Text="2016.2"></asp:Label>
                    </div>
                </div>

                <asp:GridView ID="gridAluno" runat="server" CssClass="table table-bordered" DataKeyNames="aluno_Mat" SelectedRowStyle-BackColor="Silver" AutoGenerateColumns="False" DataSourceID="objAluno">
                    <Columns>
                        <asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn btn-default" ShowSelectButton="true" />
                        <asp:BoundField DataField="aluno_Mat" HeaderText="Matricula" SortExpression="aluno_Mat"></asp:BoundField>
                        <asp:BoundField DataField="aluno_Nome" HeaderText="Nome" SortExpression="aluno_Nome"></asp:BoundField>
                        <asp:TemplateField HeaderText="Curso" SortExpression="aluno_CodCurso">
                            <ItemTemplate>
                                <asp:Label ID="lblCursoNome" runat="server" Text='<%# Bind("Curso.curso_Nome") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <asp:ObjectDataSource runat="server" ID="objAluno" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.AlunoController"></asp:ObjectDataSource>
                <div class="form-group">
                    <label class="col-sm-1 control-label">Disciplina</label>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="DropDisc" runat="server" CssClass="form-control" DataSourceID="objDisc" DataTextField="disc_Nome" DataValueField="disc_Cod"></asp:DropDownList><br />
                        <asp:ObjectDataSource runat="server" ID="objDisc" OldValuesParameterFormatString="original_{0}" SelectMethod="ListarPorCurso" TypeName="SisAcad.Controllers.DisciplinaController">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="gridAluno" PropertyName="SelectedValue" Name="matAluno" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12 col-sm-offset-3">
                        <asp:Button ID="btnMat" CssClass="btn btn-primary" runat="server" Text="Matricular" OnClick="btnMat_Click" />
                        <asp:Button ID="btnCancelar" CssClass="btn btn-danger" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                    </div>
                </div>
            </div>
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
