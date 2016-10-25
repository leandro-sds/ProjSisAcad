<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="cadastrarAluno.aspx.cs" Inherits="SisAcad.View.cadastrarAluno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="page-header">
      <h1 class="page-title">Cadastrar Aluno</h1>
    </div>
    <div class="page-content container-fluid">
      <!-- Panel Header -->
      <div class="panel">
        <div class="panel-body">
            <asp:FormView ID="FormView1" runat="server" CssClass="form-horizontal" DataSourceID="objAluno" DefaultMode="Insert">
                <InsertItemTemplate>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Nome:</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("aluno_Nome") %>' CssClass="form-control" runat="server" ID="aluno_NomeTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Data de Nascimento:</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("aluno_DataNasc") %>' CssClass="form-control" runat="server" ID="aluno_DataNascTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Curso:</label>
                        <div class="col-sm-9">
                            <asp:DropDownList Text='<%# Bind("aluno_CodCurso") %>' ID="DropDownList1" runat="server" DataSourceID="objCurso" DataTextField="curso_Nome" DataValueField="curso_Cod"></asp:DropDownList>
                            <asp:ObjectDataSource runat="server" ID="objCurso" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.CursoController"></asp:ObjectDataSource>
                        </div>
                    </div>
                    
                     <div class="form-group">
                        <label class="col-sm-3 control-label">Sexo:</label>
                         <div class="col-sm-9">
                             <asp:RadioButtonList Text='<%# Bind("aluno_Sexo") %>' ID="RadioButtonList1" CssClass="radio-custom radio-default radio-inline" runat="server">
                                 <asp:ListItem Text="Masculino" Value="M"></asp:ListItem>
                                 <asp:ListItem Text="Feminino" Value="F"></asp:ListItem>
                             </asp:RadioButtonList>
                         </div>
                    </div>

                     <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <asp:LinkButton runat="server" CssClass="btn btn-primary" Text="Insert" CommandName="Insert" ID="LinkButton1" CausesValidation="True" />
                            <asp:LinkButton runat="server" CssClass="btn btn-danger" Text="Cancel"  CommandName="Cancel" ID="LinkButton2" CausesValidation="False" />
                        </div>
                    </div>
                </InsertItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource runat="server" ID="objAluno" DataObjectTypeName="SisAcad.Model.Aluno" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.AlunoController"></asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Header -->
    </div>
  <!-- End Page -->
</asp:Content>
