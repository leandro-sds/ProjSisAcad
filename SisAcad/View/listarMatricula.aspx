<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="listarMatricula.aspx.cs" Inherits="SisAcad.View.listarMatricula" %>
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
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-1 control-label">Matricula</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="tbMat" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Button ID="btnPesq" CssClass="btn btn-primary" runat="server" Text="Pesquisar" />
                    </div>
                </div>
            </div>

            <asp:GridView ID="gridMat" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataSourceID="objMat">
                <Columns>
                    <asp:BoundField DataField="matricula_Semestre" ReadOnly="true" HeaderText="Semestre" SortExpression="matricula_Semestre"></asp:BoundField>
                    <asp:BoundField DataField="matricula_CodAluno" ReadOnly="true" HeaderText="Matricula" SortExpression="matricula_CodAluno"></asp:BoundField>
                    <asp:BoundField DataField="aluno_Nome" ReadOnly="true" HeaderText="Nome" />
                    <asp:BoundField DataField="disc_Nome" ReadOnly="true" HeaderText="Disciplina" SortExpression="matricula_CodDisc"></asp:BoundField>
                    <asp:BoundField DataField="matricula_N1" HeaderText="Nota 1" SortExpression="matricula_N1"></asp:BoundField>
                    <asp:BoundField DataField="matricula_N2" HeaderText="Nota 2" SortExpression="matricula_N2"></asp:BoundField>
                    <asp:BoundField DataField="matricula_N3" HeaderText="Nota 3" SortExpression="matricula_N3"></asp:BoundField>
                    <asp:BoundField DataField="matricula_F1" HeaderText="Faltas 1" SortExpression="matricula_F1"></asp:BoundField>
                    <asp:BoundField DataField="matricula_F2" HeaderText="Faltas 2" SortExpression="matricula_F2"></asp:BoundField>
                    <asp:BoundField DataField="matricula_F3" HeaderText="Faltas 3" SortExpression="matricula_F3"></asp:BoundField>
                    <asp:CommandField ButtonType="Button" ShowEditButton="true" ControlStyle-CssClass="btn btn-default" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource runat="server" ID="objMat" DataObjectTypeName="SisAcad.Model.Matricula" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.MatriculaController" UpdateMethod="Update">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbMat" PropertyName="Text" Name="matAluno" Type="String"></asp:ControlParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
