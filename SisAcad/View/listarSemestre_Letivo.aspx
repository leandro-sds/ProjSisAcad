<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="listarSemestre_Letivo.aspx.cs" Inherits="SisAcad.View.listarSemestre_Letivo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajax:ToolkitScriptManager>

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
                    <label class="col-sm-3 control-label">Ano</label>
                    <div class="col-sm-9">
                        <asp:TextBox Text='<%# Bind("pl_Ano") %>' MaxLength="4" CssClass="form-control" runat="server" ID="pl_AnoTextBox" /><br />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Semestre</label>
                    <div class="col-sm-9">
                        <asp:TextBox Text='<%# Bind("pl_Semestre") %>' MaxLength="1" CssClass="form-control" runat="server" ID="pl_SemestreTextBox" /><br />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Data de Inicio</label>
                    <div class="col-sm-9">
                        <asp:TextBox Text='<%# Bind("pl_DtInicio") %>' CssClass="form-control" runat="server" ID="pl_DtInicioTextBox" /><br />
                        <ajax:maskededitextender id="maskDtInicio" masktype="Date" userdateformat="DayMonthYear" mask="99/99/9999" targetcontrolid="pl_DtInicioTextBox" runat="server"></ajax:maskededitextender>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Data de Término</label>
                    <div class="col-sm-9">
                        <asp:TextBox Text='<%# Bind("pl_DtFim") %>' CssClass="form-control" runat="server" ID="pl_DtFimTextBox" /><br />
                        <ajax:maskededitextender id="maskDtFim" masktype="Date" userdateformat="DayMonthYear" mask="99/99/9999" targetcontrolid="pl_DtFimTextBox" runat="server"></ajax:maskededitextender>
                    </div>
                </div>
            </div>

            <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="objSL">
                <Columns>
                    <asp:BoundField DataField="pl_Ano" HeaderText="pl_Ano" SortExpression="pl_Ano" Visible="false"></asp:BoundField>
                    <asp:BoundField DataField="pl_Semestre" HeaderText="pl_Semestre" SortExpression="pl_Semestre"></asp:BoundField>
                    <asp:BoundField DataField="pl_DtInicio" HeaderText="pl_DtInicio" SortExpression="pl_DtInicio"></asp:BoundField>
                    <asp:BoundField DataField="pl_DtFim" HeaderText="pl_DtFim" SortExpression="pl_DtFim"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource runat="server" ID="objSL" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.Semestre_LetivoController">
                <SelectParameters>
                    <asp:ControlParameter ControlID="pl_AnoTextBox" PropertyName="Text" Name="ano" Type="String"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="pl_SemestreTextBox" PropertyName="Text" Name="semestre" Type="String"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="pl_DtInicioTextBox" PropertyName="Text" Name="dtinicio" Type="String"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="pl_DtFimTextBox" PropertyName="Text" Name="dtfim" Type="String"></asp:ControlParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
