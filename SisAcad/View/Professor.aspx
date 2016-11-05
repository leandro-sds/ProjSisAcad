<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="Professor.aspx.cs" Inherits="SisAcad.View.cadastrarProfessor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!-- Page -->
    <!-- Panel Header -->
    <div class="page-header">
      <h1 class="page-title"> <asp:Label ID="lblHeader" runat="server" Text="Label"></asp:Label> </h1>
    </div>
    <!-- End Panel Header -->
    <!-- Page Content -->
    <div class="page-content container-fluid">
      
      <div class="panel">
        <div class="panel-body">
            <asp:FormView ID="FormView1" runat="server" CssClass="form-horizontal" DataSourceID="objProf" DefaultMode="Insert">
                <%-- UPDATE --%>
                <EditItemTemplate>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Matricula:</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("prof_Mat") %>' CssClass="form-control" Enabled="false" runat="server" ID="prof_MatTextBox" /><br />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Nome:</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("prof_Nome") %>' CssClass="form-control" runat="server" ID="prof_NomeTextBox" /><br />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <asp:LinkButton CssClass="btn btn-primary" runat="server" Text="Atualizar" CommandName="Update" ID="UpdateButton" CausesValidation="True" />
                            <asp:LinkButton CssClass="btn btn-danger" runat="server" Text="Cancelar" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                            
                        </div>
                    </div>
                    
                </EditItemTemplate>
                <%-- UPDATE --%>

                <%-- INSERT --%>
                <InsertItemTemplate>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Nome</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("prof_Nome") %>' runat="server" CssClass="form-control" ID="prof_NomeTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <asp:LinkButton runat="server" Text="Inserir" CssClass="btn btn-primary" CommandName="Insert" ID="InsertButton" CausesValidation="True" />
                            <asp:LinkButton runat="server" Text="Cancelar" CssClass="btn btn-danger" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                        </div>
                    </div>

                </InsertItemTemplate>
                <%-- INSERT --%>

                <ItemTemplate>
                    prof_Id:
                    <asp:Label Text='<%# Bind("prof_Id") %>' runat="server" ID="prof_IdLabel" /><br />
                    prof_Mat:
                    <asp:Label Text='<%# Bind("prof_Mat") %>' runat="server" ID="prof_MatLabel" /><br />
                    prof_Nome:
                    <asp:Label Text='<%# Bind("prof_Nome") %>' runat="server" ID="prof_NomeLabel" /><br />
                    <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Excluir" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Novo" CommandName="New" ID="NewButton" CausesValidation="False" />
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource runat="server" ID="objProf" DataObjectTypeName="SisAcad.Model.Professor" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetProf" TypeName="SisAcad.Controllers.ProfessorController" DeleteMethod="Delete" UpdateMethod="Update">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="Codigo" Name="id" Type="Int32"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
