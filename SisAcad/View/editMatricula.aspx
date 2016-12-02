<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="editMatricula.aspx.cs" Inherits="SisAcad.View.editMatricula" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!-- Page -->
    <!-- Panel Header -->
    <div class="page-header">
      <h1 class="page-title">Editar</h1>
    </div>
    <!-- End Panel Header -->
    <!-- Page Content -->
    <div class="page-content container-fluid">
      <!-- Panel Content -->
      <div class="panel">
        <div class="panel-body">
            <asp:FormView ID="formMat" runat="server" DataSourceID="objMat">
                <EditItemTemplate>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-1 control-label">Semestre</label>
                            <div class="col-sm-4">
                                <asp:TextBox Text='<%# Bind("matricula_Semestre") %>' runat="server" ID="matricula_SemestreTextBox" /><br />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-1 control-label">Matricula</label>
                            <div class="col-sm-4">
                                <asp:TextBox Text='<%# Bind("matricula_CodAluno") %>' runat="server" ID="matricula_CodAlunoTextBox" /><br />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-1 control-label">Disciplina</label>
                            <div class="col-sm-4">
                                <asp:TextBox Text='<%# Bind("matricula_CodDisc") %>' runat="server" ID="matricula_CodDiscTextBox" /><br />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-1 control-label">Nota 1</label>
                            <div class="col-sm-4">
                                <asp:TextBox Text='<%# Bind("matricula_N1") %>' runat="server" ID="matricula_N1TextBox" /><br />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-1 control-label">Nota 2</label>
                            <div class="col-sm-4">
                                <asp:TextBox Text='<%# Bind("matricula_N2") %>' runat="server" ID="matricula_N2TextBox" /><br />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-1 control-label">Nota 3</label>
                            <div class="col-sm-4">
                                <asp:TextBox Text='<%# Bind("matricula_N3") %>' runat="server" ID="matricula_N3TextBox" /><br />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-1 control-label">Faltas 1</label>
                            <div class="col-sm-4">
                                <asp:TextBox Text='<%# Bind("matricula_F1") %>' runat="server" ID="matricula_F1TextBox" /><br />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-1 control-label">Faltas 2</label>
                            <div class="col-sm-4">
                                <asp:TextBox Text='<%# Bind("matricula_F2") %>' runat="server" ID="matricula_F2TextBox" /><br />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-1 control-label">Faltas 3</label>
                            <div class="col-sm-4">
                                <asp:TextBox Text='<%# Bind("matricula_F3") %>' runat="server" ID="TextBox1" /><br />
                            </div>
                        </div>
                    </div>


                    matricula_Id:
                    <asp:TextBox Text='<%# Bind("matricula_Id") %>' runat="server" ID="matricula_IdTextBox" /><br />
                    matricula_Ano:
                    <asp:TextBox Text='<%# Bind("matricula_Ano") %>' runat="server" ID="matricula_AnoTextBox" /><br />
                    matricula_Semestre:
                    
                    matricula_CodAluno:
                    
                    matricula_CodDisc:
                    
                    matricula_N1:
                    
                    matricula_N2:
                    
                    matricula_N3:
                    
                    matricula_F1:
                    
                    matricula_F2:
                    
                    matricula_F3:
                    <asp:TextBox Text='<%# Bind("matricula_F3") %>' runat="server" ID="matricula_F3TextBox" /><br />
                    Aluno:
                    <asp:TextBox Text='<%# Bind("Aluno.aluno_Nome") %>' runat="server" ID="AlunoTextBox" /><br />
                    Disciplina:
                    <asp:TextBox Text='<%# Bind("Disciplina.disc_Nome") %>' runat="server" ID="DisciplinaTextBox" /><br />
                    <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    matricula_Id:
                    <asp:TextBox Text='<%# Bind("matricula_Id") %>' runat="server" ID="matricula_IdTextBox" /><br />
                    matricula_Ano:
                    <asp:TextBox Text='<%# Bind("matricula_Ano") %>' runat="server" ID="matricula_AnoTextBox" /><br />
                    matricula_Semestre:
                    <asp:TextBox Text='<%# Bind("matricula_Semestre") %>' runat="server" ID="matricula_SemestreTextBox" /><br />
                    matricula_CodAluno:
                    <asp:TextBox Text='<%# Bind("matricula_CodAluno") %>' runat="server" ID="matricula_CodAlunoTextBox" /><br />
                    matricula_CodDisc:
                    <asp:TextBox Text='<%# Bind("matricula_CodDisc") %>' runat="server" ID="matricula_CodDiscTextBox" /><br />
                    matricula_N1:
                    <asp:TextBox Text='<%# Bind("matricula_N1") %>' runat="server" ID="matricula_N1TextBox" /><br />
                    matricula_N2:
                    <asp:TextBox Text='<%# Bind("matricula_N2") %>' runat="server" ID="matricula_N2TextBox" /><br />
                    matricula_N3:
                    <asp:TextBox Text='<%# Bind("matricula_N3") %>' runat="server" ID="matricula_N3TextBox" /><br />
                    matricula_F1:
                    <asp:TextBox Text='<%# Bind("matricula_F1") %>' runat="server" ID="matricula_F1TextBox" /><br />
                    matricula_F2:
                    <asp:TextBox Text='<%# Bind("matricula_F2") %>' runat="server" ID="matricula_F2TextBox" /><br />
                    matricula_F3:
                    <asp:TextBox Text='<%# Bind("matricula_F3") %>' runat="server" ID="matricula_F3TextBox" /><br />
                    Aluno:
                    <asp:TextBox Text='<%# Bind("Aluno") %>' runat="server" ID="AlunoTextBox" /><br />
                    Disciplina:
                    <asp:TextBox Text='<%# Bind("Disciplina") %>' runat="server" ID="DisciplinaTextBox" /><br />
                    <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                </InsertItemTemplate>
                <ItemTemplate>
                    matricula_Id:
                    <asp:Label Text='<%# Bind("matricula_Id") %>' runat="server" ID="matricula_IdLabel" /><br />
                    matricula_Ano:
                    <asp:Label Text='<%# Bind("matricula_Ano") %>' runat="server" ID="matricula_AnoLabel" /><br />
                    matricula_Semestre:
                    <asp:Label Text='<%# Bind("matricula_Semestre") %>' runat="server" ID="matricula_SemestreLabel" /><br />
                    matricula_CodAluno:
                    <asp:Label Text='<%# Bind("matricula_CodAluno") %>' runat="server" ID="matricula_CodAlunoLabel" /><br />
                    matricula_CodDisc:
                    <asp:Label Text='<%# Bind("matricula_CodDisc") %>' runat="server" ID="matricula_CodDiscLabel" /><br />
                    matricula_N1:
                    <asp:Label Text='<%# Bind("matricula_N1") %>' runat="server" ID="matricula_N1Label" /><br />
                    matricula_N2:
                    <asp:Label Text='<%# Bind("matricula_N2") %>' runat="server" ID="matricula_N2Label" /><br />
                    matricula_N3:
                    <asp:Label Text='<%# Bind("matricula_N3") %>' runat="server" ID="matricula_N3Label" /><br />
                    matricula_F1:
                    <asp:Label Text='<%# Bind("matricula_F1") %>' runat="server" ID="matricula_F1Label" /><br />
                    matricula_F2:
                    <asp:Label Text='<%# Bind("matricula_F2") %>' runat="server" ID="matricula_F2Label" /><br />
                    matricula_F3:
                    <asp:Label Text='<%# Bind("matricula_F3") %>' runat="server" ID="matricula_F3Label" /><br />
                    Aluno:
                    <asp:Label Text='<%# Bind("Aluno") %>' runat="server" ID="AlunoLabel" /><br />
                    Disciplina:
                    <asp:Label Text='<%# Bind("Disciplina") %>' runat="server" ID="DisciplinaLabel" /><br />
                    <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource runat="server" ID="objMat" DataObjectTypeName="SisAcad.Model.Matricula" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.MatriculaController" UpdateMethod="Update">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="Codigo" Name="matAluno" Type="String"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
