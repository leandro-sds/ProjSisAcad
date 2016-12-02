<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="Turma.aspx.cs" Inherits="SisAcad.View.Turma" %>
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
            <asp:FormView ID="formTurma" runat="server" DataSourceID="objTurma" DefaultMode="Insert">
                <EditItemTemplate>
                    turma_Ano:
                    <asp:TextBox Text='<%# Bind("turma_Ano") %>' runat="server" ID="turma_AnoTextBox" /><br />
                    turma_Semestre:
                    <asp:TextBox Text='<%# Bind("turma_Semestre") %>' runat="server" ID="turma_SemestreTextBox" /><br />
                    turma_DiscCod:
                    <asp:TextBox Text='<%# Bind("turma_DiscCod") %>' runat="server" ID="turma_DiscCodTextBox" /><br />
                    turma_Vagas:
                    <asp:TextBox Text='<%# Bind("turma_Vagas") %>' runat="server" ID="turma_VagasTextBox" /><br />
                    turma_IdProf:
                    <asp:TextBox Text='<%# Bind("turma_IdProf") %>' runat="server" ID="turma_IdProfTextBox" /><br />
                    turma_CursoCod:
                    <asp:TextBox Text='<%# Bind("turma_CursoCod") %>' runat="server" ID="turma_CursoCodTextBox" /><br />
                    <asp:LinkButton runat="server" Text="Atualizar" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                </EditItemTemplate>

                <%-- INSERT --%>
                <InsertItemTemplate>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Semestre</label>
                        <div class="col-sm-9">
                            <asp:DropDownList Text='<%# Bind("turma_Semestre") %>' ID="ddlSemestre" CssClass="form-control" runat="server" DataSourceID="objSL" DataTextField="pl_Semestre" DataValueField="pl_Semestre"></asp:DropDownList><br />
                            <asp:ObjectDataSource runat="server" ID="objSL" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.Semestre_LetivoController"></asp:ObjectDataSource>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Disciplina</label>
                        <div class="col-sm-9">
                            <asp:DropDownList Text='<%# Bind("turma_DiscCod") %>' CssClass="form-control" ID="ddlDisc" runat="server" DataSourceID="objDisc" DataTextField="disc_Nome" DataValueField="disc_Cod"></asp:DropDownList><br />
                            <asp:ObjectDataSource runat="server" ID="objDisc" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.DisciplinaController"></asp:ObjectDataSource>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Curso</label>
                        <div class="col-sm-9">
                            <asp:DropDownList Text='<%# Bind("turma_CursoCod") %>' CssClass="form-control" ID="ddlCurso" runat="server" DataSourceID="objCurso" DataTextField="curso_Nome" DataValueField="curso_Cod"></asp:DropDownList><br />
                            <asp:ObjectDataSource runat="server" ID="objCurso" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.CursoController"></asp:ObjectDataSource>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Professor</label>
                        <div class="col-sm-9">
                            <asp:DropDownList Text='<%# Bind("turma_IdProf") %>' CssClass="form-control" ID="ddlProf" runat="server" DataSourceID="objProf" DataTextField="prof_Nome" DataValueField="prof_Id"></asp:DropDownList><br />
                            <asp:ObjectDataSource runat="server" ID="objProf" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.ProfessorController"></asp:ObjectDataSource>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Vagas</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("turma_Vagas") %>' CssClass="form-control" runat="server" ID="turma_VagasTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <asp:LinkButton CssClass="btn btn-primary" runat="server" Text="Inserir" CommandName="Insert" ID="InsertButton" CausesValidation="True" />
                            <asp:LinkButton CssClass="btn btn-danger" runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                        </div>
                    </div>
                </InsertItemTemplate>
                <%-- INSERT --%>

                <ItemTemplate>
                    turma_Ano:
                    <asp:Label Text='<%# Bind("turma_Ano") %>' runat="server" ID="turma_AnoLabel" /><br />
                    turma_Semestre:
                    <asp:Label Text='<%# Bind("turma_Semestre") %>' runat="server" ID="turma_SemestreLabel" /><br />
                    turma_DiscCod:
                    <asp:Label Text='<%# Bind("turma_DiscCod") %>' runat="server" ID="turma_DiscCodLabel" /><br />
                    turma_Vagas:
                    <asp:Label Text='<%# Bind("turma_Vagas") %>' runat="server" ID="turma_VagasLabel" /><br />
                    turma_IdProf:
                    <asp:Label Text='<%# Bind("turma_IdProf") %>' runat="server" ID="turma_IdProfLabel" /><br />
                    turma_CursoCod:
                    <asp:Label Text='<%# Bind("turma_CursoCod") %>' runat="server" ID="turma_CursoCodLabel" /><br />
                    <asp:LinkButton runat="server" Text="Novo" CommandName="New" ID="NewButton" CausesValidation="False" />
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource runat="server" ID="objTurma" DataObjectTypeName="SisAcad.Model.Turmas" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.TurmasController"></asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
