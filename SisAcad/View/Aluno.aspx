<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="Aluno.aspx.cs" Inherits="SisAcad.View.cadastrarAluno" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <asp:ScriptManager ID="ajaxScript" EnablePageMethods="true" EnableScriptGlobalization="true" runat="server"></asp:ScriptManager>

    <div class="page-header">
      <h1 class="page-title"> <asp:Label ID="lblHeader" runat="server" Text="Label"></asp:Label> </h1>
    </div>
    <div class="page-content container-fluid">
      <!-- Panel Header -->
      <div class="panel">
        <div class="panel-body">
            <asp:FormView ID="FormView1" runat="server" DataSourceID="objAluno" DefaultMode="Insert">
                <%-- UPDATE --%>
                <EditItemTemplate>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Matricula:</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("aluno_Mat") %>' CssClass="form-control" runat="server" Enabled="false" ID="TextBox1" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Nome:</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("aluno_Nome") %>' CssClass="form-control" runat="server" ID="aluno_NomeTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Créditos:</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("aluno_TotCred") %>' CssClass="form-control" runat="server" ID="TextBox3" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Data de Nascimento:</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("aluno_DataNasc") %>' CssClass="form-control" runat="server" ID="TextBox4" /><br />
                            <ajax:MaskedEditExtender ID="maskData" runat="server" TargetControlID="TextBox4" Mask="99/99/9999" MaskType="Date"></ajax:MaskedEditExtender>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">MGP:</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("aluno_MGP") %>' runat="server" CssClass="form-control" ID="TextBox5" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Curso:</label>
                        <div class="col-sm-9">
                            <asp:DropDownList Text='<%# Bind("aluno_CodCurso") %>' ID="ddlCurso" CssClass="form-control" runat="server" DataSourceID="objCursoEdit" DataTextField="curso_Nome" DataValueField="curso_Cod"></asp:DropDownList><br />
                            <asp:ObjectDataSource runat="server" ID="objCursoEdit" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.CursoController">
                            </asp:ObjectDataSource>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Sexo:</label>
                        <div class="col-sm-9">
                            <asp:RadioButtonList Text='<%# Bind("aluno_Sexo") %>' ID="RadioButtonList1" CssClass="radio-custom radio-inline"  runat="server">
                                <asp:ListItem Text="Masculino" Value="M"></asp:ListItem>
                                <asp:ListItem Text="Feminino" Value="F"></asp:ListItem>
                            </asp:RadioButtonList><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <asp:LinkButton CssClass="btn btn-primary" runat="server" Text="Atualizar" CommandName="Update" ID="LinkButton3" CausesValidation="True" />
                            <asp:LinkButton CssClass="btn btn-danger" runat="server" Text="Cancelar" CommandName="Cancel" ID="LinkButton4" CausesValidation="False" />
                        </div>
                    </div>
                    
                </EditItemTemplate>
                <%-- UPDATE --%>

                <%-- INSERT --%>
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
                        <label class="col-sm-3 control-label">Sexo:</label>
                         <div class="col-sm-9">
                             <asp:RadioButtonList Text='<%# Bind("aluno_Sexo") %>' ID="RadioButtonList1" CssClass="radio-custom radio-default radio-inline" runat="server">
                                 <asp:ListItem Text="Masculino" Value="M"></asp:ListItem>
                                 <asp:ListItem Text="Feminino" Value="F"></asp:ListItem>
                             </asp:RadioButtonList><br />
                         </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Curso:</label>
                        <div class="col-sm-9">
                            <asp:DropDownList Text='<%# Bind("aluno_CodCurso") %>' ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="objCurso" DataTextField="curso_Nome" DataValueField="curso_Cod"></asp:DropDownList><br />
                            <asp:ObjectDataSource runat="server" ID="objCurso" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.CursoController"></asp:ObjectDataSource>
                        </div>
                    </div>

                     <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <asp:LinkButton runat="server" CssClass="btn btn-primary" Text="Cadastrar" CommandName="Insert" ID="LinkButton1" CausesValidation="True" />
                            <asp:LinkButton runat="server" CssClass="btn btn-danger" Text="Cancel"  CommandName="Cancel" ID="LinkButton2" CausesValidation="False" />
                        </div>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    Id:
                    <asp:Label Text='<%# Bind("Id") %>' runat="server" ID="IdLabel" /><br />
                    aluno_Mat:
                    <asp:Label Text='<%# Bind("aluno_Mat") %>' runat="server" ID="aluno_MatLabel" /><br />
                    aluno_Nome:
                    <asp:Label Text='<%# Bind("aluno_Nome") %>' runat="server" ID="aluno_NomeLabel" /><br />
                    aluno_TotCred:
                    <asp:Label Text='<%# Bind("aluno_TotCred") %>' runat="server" ID="aluno_TotCredLabel" /><br />
                    aluno_DataNasc:
                    <asp:Label Text='<%# Bind("aluno_DataNasc") %>' runat="server" ID="aluno_DataNascLabel" /><br />
                    aluno_MGP:
                    <asp:Label Text='<%# Bind("aluno_MGP") %>' runat="server" ID="aluno_MGPLabel" /><br />
                    aluno_CodCurso:
                    <asp:Label Text='<%# Bind("aluno_CodCurso") %>' runat="server" ID="aluno_CodCursoLabel" /><br />
                    aluno_Sexo:
                    <asp:Label Text='<%# Bind("aluno_Sexo") %>' runat="server" ID="aluno_SexoLabel" /><br />
                    <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Novo" CommandName="New" ID="NewButton" CausesValidation="False" />
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource runat="server" ID="objAluno" DataObjectTypeName="SisAcad.Model.Aluno" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAluno" TypeName="SisAcad.Controllers.AlunoController" UpdateMethod="Update" DeleteMethod="Delete">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="Codigo" Name="alunoId" Type="Int32"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Header -->
    </div>
  <!-- End Page -->
</asp:Content>
