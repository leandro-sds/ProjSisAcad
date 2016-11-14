<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="Semestre_Letivo.aspx.cs" Inherits="SisAcad.View.Semestre_Letivo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ajax:ToolkitScriptManager runat="server" ID="toolkitscript"></ajax:ToolkitScriptManager>

    <!-- Page -->
    <!-- Panel Header -->
    <div class="page-header">
      <h1 class="page-title"> <asp:Label ID="lblHeader" runat="server" Text="Label"></asp:Label> </h1>
    </div>
    <!-- End Panel Header -->
    <!-- Page Content -->
    <div class="page-content container-fluid">
      <!-- Panel Content -->
      <div class="panel">
        <div class="panel-body">
            <asp:FormView ID="FormView1" runat="server" DataSourceID="objSL" DefaultMode="Insert">
                <EditItemTemplate>
                    pl_Ano:
                    <asp:TextBox Text='<%# Bind("pl_Ano") %>' runat="server" ID="pl_AnoTextBox" /><br />
                    pl_Semestre:
                    <asp:TextBox Text='<%# Bind("pl_Semestre") %>' runat="server" ID="pl_SemestreTextBox" /><br />
                    pl_DtInicio:
                    <asp:TextBox Text='<%# Bind("pl_DtInicio") %>' runat="server" ID="pl_DtInicioTextBox" /><br />
                    pl_DtFim:
                    <asp:TextBox Text='<%# Bind("pl_DtFim") %>' runat="server" ID="pl_DtFimTextBox" /><br />
                    <asp:LinkButton runat="server" Text="Atualizar" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                </EditItemTemplate>

                <%-- INSERT --%>
                <InsertItemTemplate>
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
                                <ajax:MaskedEditExtender ID="maskDtInicio" MaskType="Date" UserDateFormat="DayMonthYear" Mask="99/99/9999" TargetControlID="pl_DtInicioTextBox" runat="server"></ajax:MaskedEditExtender>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Data de Término</label>
                            <div class="col-sm-9">
                                <asp:TextBox Text='<%# Bind("pl_DtFim") %>' CssClass="form-control" runat="server" ID="pl_DtFimTextBox" /><br />
                                <ajax:MaskedEditExtender ID="maskDtFim" MaskType="Date" UserDateFormat="DayMonthYear" Mask="99/99/9999" TargetControlID="pl_DtFimTextBox" runat="server"></ajax:MaskedEditExtender>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-2">
                                <asp:LinkButton runat="server" CssClass="btn btn-primary" Text="Inserir" CommandName="Insert" ID="InsertButton" CausesValidation="True" />
                                <asp:LinkButton runat="server" CssClass="btn btn-danger" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                            </div>
                        </div>

                    </div>
                    
                    
                </InsertItemTemplate>
                <%-- INSERT --%>

                <ItemTemplate>
                    pl_Ano:
                    <asp:Label Text='<%# Bind("pl_Ano") %>' runat="server" ID="pl_AnoLabel" /><br />
                    pl_Semestre:
                    <asp:Label Text='<%# Bind("pl_Semestre") %>' runat="server" ID="pl_SemestreLabel" /><br />
                    pl_DtInicio:
                    <asp:Label Text='<%# Bind("pl_DtInicio") %>' runat="server" ID="pl_DtInicioLabel" /><br />
                    pl_DtFim:
                    <asp:Label Text='<%# Bind("pl_DtFim") %>' runat="server" ID="pl_DtFimLabel" /><br />
                    <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Excluir" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Novo" CommandName="New" ID="NewButton" CausesValidation="False" />
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource runat="server" ID="objSL" DataObjectTypeName="SisAcad.Model.Periodo_Letivo" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.Semestre_LetivoController" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="objSL" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <SelectParameters>
                    <asp:Parameter Name="ano" Type="String"></asp:Parameter>
                    <asp:Parameter Name="semestre" Type="String"></asp:Parameter>
                    <asp:Parameter Name="dtinicio" Type="String"></asp:Parameter>
                    <asp:Parameter Name="dtfim" Type="String"></asp:Parameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
