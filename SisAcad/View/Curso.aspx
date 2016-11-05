<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="Curso.aspx.cs" Inherits="SisAcad.View.listarCurso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!-- Page -->
    <div class="page-header">
      <h1 class="page-title"> <asp:Label ID="lblHeader" runat="server" Text="Label"></asp:Label> </h1>
    </div>
    <div class="page-content container-fluid">
      <!-- Panel Header -->
      <div class="panel">
        <div class="panel-body">
            <asp:FormView ID="FormView1" runat="server" CssClass="form-horizontal" DataSourceID="objCurso" DefaultMode="Insert">
                <%-- UPDATE --%>
                <EditItemTemplate>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Código</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("curso_Cod") %>' CssClass="form-control" Enabled="false" runat="server" ID="curso_CodTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Nome</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("curso_Nome") %>' CssClass="form-control" runat="server" ID="curso_NomeTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Créditos</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("curso_TotCred") %>' CssClass="form-control" runat="server" ID="curso_TotCredTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Professor</label>
                        <div class="col-sm-9">
                            <asp:DropDownList Text='<%# Bind("curso_IdProf") %>' CssClass="form-control" ID="DropDownList1" runat="server" DataSourceID="objProfEdit" DataTextField="prof_Nome" DataValueField="prof_Id"></asp:DropDownList>
                            <asp:ObjectDataSource runat="server" ID="objProfEdit" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.ProfessorController"></asp:ObjectDataSource>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <asp:LinkButton CssClass="btn btn-primary" runat="server" Text="Atualizar" CommandName="Update" ID="UpdateButton" CausesValidation="True" />
                            <asp:LinkButton CssClass="btn btn-danger" runat="server" Text="Cancelar" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                        </div>
                    </div>
                    
                </EditItemTemplate>
                <%-- UDPATE --%>

                <%-- INSERT --%>
                <InsertItemTemplate>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Nome: </label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("curso_Nome") %>' runat="server" CssClass="form-control" ID="curso_NomeTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Créditos: </label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("curso_TotCred") %>' runat="server" CssClass="form-control" ID="curso_TotCredTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Professor: </label>
                        <div class="col-sm-9">
                            <asp:DropDownList Text='<%# Bind("curso_IdProf") %>' ID="DropDownList2" runat="server" CssClass="form-control" DataSourceID="objProf" DataTextField="prof_Nome" DataValueField="prof_Id"></asp:DropDownList>
                            <asp:ObjectDataSource runat="server" ID="objProf" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.ProfessorController"></asp:ObjectDataSource>
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
                    curso_Cod:
                    <asp:Label Text='<%# Bind("curso_Cod") %>' runat="server" ID="curso_CodLabel" /><br />
                    curso_TotCred:
                    <asp:Label Text='<%# Bind("curso_TotCred") %>' runat="server" ID="curso_TotCredLabel" /><br />
                    curso_Nome:
                    <asp:Label Text='<%# Bind("curso_Nome") %>' runat="server" ID="curso_NomeLabel" /><br />
                    curso_IdProf:
                    <asp:Label Text='<%# Bind("curso_IdProf") %>' runat="server" ID="curso_IdProfLabel" /><br />
                    Professor:
                    <asp:Label Text='<%# Bind("Professor") %>' runat="server" ID="ProfessorLabel" /><br />
                    <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Excluir" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Novo" CommandName="New" ID="NewButton" CausesValidation="False" />
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource runat="server" ID="objCurso" DataObjectTypeName="SisAcad.Model.Curso" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCurso" TypeName="SisAcad.Controllers.CursoController" DeleteMethod="Delete" UpdateMethod="Update">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="Codigo" Name="cod" Type="Int32"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Header -->
    </div>
  <!-- End Page -->
</asp:Content>
