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
            <asp:FormView ID="FormView1" runat="server" DataSourceID="objMat" DefaultMode="Insert">
                <EditItemTemplate>
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
                    Curso:
                    <asp:TextBox Text='<%# Bind("Curso") %>' runat="server" ID="CursoTextBox" /><br />
                    <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Semestre Letivo</label>
                            <div class="col-sm-9">
                                <asp:DropDownList Text='<%# Bind("matricula_Semestre") %>' ID="ddlSemestre" runat="server" CssClass="form-control" DataSourceID="objSL" DataTextField="pl_Semestre" DataValueField="pl_Semestre"></asp:DropDownList><br />
                                <asp:ObjectDataSource runat="server" ID="objSL" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.Semestre_LetivoController"></asp:ObjectDataSource>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Aluno</label>
                            <div class="col-sm-9">
                                <asp:DropDownList Text='<%# Bind("matricula_CodAluno") %>' ID="ddlAluno" AutoPostBack="true" runat="server" CssClass="form-control" DataSourceID="objAluno" DataTextField="aluno_Nome" DataValueField="aluno_Mat"></asp:DropDownList><br />
                                <asp:ObjectDataSource runat="server" ID="objAluno" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.AlunoController"></asp:ObjectDataSource>
                            </div>
                        </div>

                        <%--Text='<%# Bind("matricula_CodDisc") %>'--%>  

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Disciplina</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="DropDisc" runat="server" CssClass="form-control" DataSourceID="objDisc" DataTextField="disc_Nome" DataValueField="disc_Cod" OnDataBound="DropDisc_DataBound"></asp:DropDownList><br />
                                <asp:ObjectDataSource runat="server" ID="objDisc" OldValuesParameterFormatString="original_{0}" SelectMethod="ListarPorCurso" TypeName="SisAcad.Controllers.DisciplinaController">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlAluno" PropertyName="SelectedValue" Name="matAluno" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-12 col-sm-offset-3">
                                <asp:LinkButton runat="server" CssClass="btn btn-primary" Text="Matricular" CommandName="Insert" ID="LinkButton1" CausesValidation="True" />
                                <asp:LinkButton runat="server" CssClass="btn btn-danger" Text="Cancelar" CommandName="Cancel" ID="LinkButton2" CausesValidation="False" />
                            </div>
                        </div>
                    </div>

                    <%--matricula_Id:
                    <asp:TextBox Text='<%# Bind("matricula_Id") %>' runat="server" ID="matricula_IdTextBox" /><br />
                    matricula_Ano:
                    <asp:TextBox Text='<%# Bind("matricula_Ano") %>' runat="server" ID="matricula_AnoTextBox" /><br />
                    matricula_Semestre:
                    <asp:TextBox Text='<%# Bind("matricula_Semestre") %>' runat="server" ID="matricula_SemestreTextBox" /><br />
                    matricula_CodAluno:
                    <asp:TextBox  runat="server" ID="matricula_CodAlunoTextBox" /><br />
                    matricula_CodDisc:
                    <asp:TextBox  runat="server" ID="matricula_CodDiscTextBox" /><br />
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
                    Curso:
                    <asp:TextBox Text='<%# Bind("Curso") %>' runat="server" ID="CursoTextBox" /><br />--%>
                    
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
                    Curso:
                    <asp:Label Text='<%# Bind("Curso") %>' runat="server" ID="CursoLabel" /><br />
                    <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource runat="server" ID="objMat" DataObjectTypeName="SisAcad.Model.Matricula" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.MatriculaController" UpdateMethod="Update"></asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
