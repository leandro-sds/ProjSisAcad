<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="listarHistorico.aspx.cs" Inherits="SisAcad.View.listarHistorico" %>
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
                    <label class="col-sm-1 control-label">Matricula</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="lblMat" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-1 col-sm-offset-1">
                        <asp:Button ID="btnPesq" CssClass="btn btn-primary" runat="server" Text="Pesquisar" />
                    </div>
                </div>
            </div>

            <asp:GridView ID="gridHist" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="objHist">
                <Columns>
                    <asp:BoundField DataField="hist_Semestre" HeaderText="Semestre" SortExpression="hist_Semestre"></asp:BoundField>
                    <asp:BoundField DataField="hist_MatAluno" HeaderText="Matricula" SortExpression="hist_MatAluno"></asp:BoundField>
                    <asp:TemplateField HeaderText="Nome">
                        <ItemTemplate>
                            <asp:Label ID="lblAlunoNome" runat="server" Text='<%# Bind("Aluno.aluno_Nome") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Disciplina">
                        <ItemTemplate>
                            <asp:Label ID="lblDiscNome" runat="server" Text='<%# Bind("Disciplina.disc_Nome") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:BoundField DataField="hist_DiscCod" HeaderText="Disciplina" SortExpression="hist_DiscCod"></asp:BoundField>--%>
                    
                    <asp:BoundField DataField="hist_Situacao" HeaderText="Situação*" SortExpression="hist_Situacao"></asp:BoundField>
                    <asp:BoundField DataField="hist_Media" HeaderText="Média" SortExpression="hist_Media"></asp:BoundField>
                    <asp:BoundField DataField="hist_Faltas" HeaderText="Faltas" SortExpression="hist_Faltas"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblSit" runat="server" Text="AP: Aprovado; RP = Reprovado"></asp:Label>
            <asp:ObjectDataSource runat="server" ID="objHist" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.HistoricoController">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblMat" PropertyName="Text" Name="matAluno" Type="Int32"></asp:ControlParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
