<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="Disciplina.aspx.cs" Inherits="SisAcad.View.Disciplina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!-- Page -->
    <!-- Panel Header -->
    <div class="page-header">
      <h1 class="page-title"><asp:Label ID="lblHeader" runat="server" Text="Label"></asp:Label></h1>
    </div>
    <!-- End Panel Header -->
    <!-- Page Content -->
    <div class="page-content container-fluid">
      <!-- Panel Content -->
      <div class="panel">
        <div class="panel-body">
            <asp:FormView ID="FormView1" runat="server" DataSourceID="objDisc" DefaultMode="Insert">
                <%-- UPDATE --%>
                <EditItemTemplate>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Código</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("disc_Cod") %>' CssClass="form-control" Enabled="false" runat="server" ID="disc_CodTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Nome</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("disc_Nome") %>' CssClass="form-control" runat="server" ID="disc_NomeTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Créditos</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("disc_Cred") %>' CssClass="form-control" runat="server" ID="disc_CredTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Horas Obrigatórias</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("disc_HoraObr") %>' CssClass="form-control" runat="server" ID="disc_HoraObrTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Limite de Faltas</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("disc_Falta") %>' CssClass="form-control" runat="server" ID="disc_FaltaTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Tipo</label>
                        <div class="col-sm-9">
                            <asp:RadioButtonList Text='<%# Bind("disc_Tipo") %>' CssClass="radio-custom radio-default" ID="RadioButtonList1" runat="server">
                                <asp:ListItem Text="Presencial" Value="P" ></asp:ListItem>
                                <asp:ListItem Text="EAD" Value="E"></asp:ListItem>
                            </asp:RadioButtonList>
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
                            <asp:TextBox Text='<%# Bind("disc_Nome") %>' CssClass="form-control" runat="server" ID="disc_NomeTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Créditos</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("disc_Cred") %>' CssClass="form-control" runat="server" ID="disc_CredTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Horas Obrigatórias</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("disc_HoraObr") %>' CssClass="form-control" runat="server" ID="disc_HoraObrTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Limite de Faltas</label>
                        <div class="col-sm-9">
                            <asp:TextBox Text='<%# Bind("disc_Falta") %>' CssClass="form-control" runat="server" ID="disc_FaltaTextBox" /><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Tipo</label>
                        <div class="col-sm-9">
                            <asp:RadioButtonList Text='<%# Bind("disc_Tipo") %>' CssClass="radio-custom radio-default" ID="RadioButtonList1" runat="server">
                                <asp:ListItem Text="Presencial" Value="P" ></asp:ListItem>
                                <asp:ListItem Text="EAD" Value="E"></asp:ListItem>
                            </asp:RadioButtonList><br />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <asp:LinkButton CssClass="btn btn-primary" runat="server" Text="Cadastrar" CommandName="Insert" ID="InsertButton" CausesValidation="True" />
                            <asp:LinkButton CssClass="btn btn-danger" runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                        </div>
                    </div>
                </InsertItemTemplate>
                <%-- INSERT --%>

                <ItemTemplate>
                    disc_Cod:
                    <asp:Label Text='<%# Bind("disc_Cod") %>' runat="server" ID="disc_CodLabel" /><br />
                    disc_Cred:
                    <asp:Label Text='<%# Bind("disc_Cred") %>' runat="server" ID="disc_CredLabel" /><br />
                    disc_Nome:
                    <asp:Label Text='<%# Bind("disc_Nome") %>' runat="server" ID="disc_NomeLabel" /><br />
                    disc_Tipo:
                    <asp:Label Text='<%# Bind("disc_Tipo") %>' runat="server" ID="disc_TipoLabel" /><br />
                    disc_HoraObr:
                    <asp:Label Text='<%# Bind("disc_HoraObr") %>' runat="server" ID="disc_HoraObrLabel" /><br />
                    disc_Falta:
                    <asp:Label Text='<%# Bind("disc_Falta") %>' runat="server" ID="disc_FaltaLabel" /><br />
                    <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Excluir" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Novo" CommandName="New" ID="NewButton" CausesValidation="False" />
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource runat="server" ID="objDisc" DataObjectTypeName="SisAcad.Model.Disciplina" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDisc" TypeName="SisAcad.Controllers.DisciplinaController" UpdateMethod="Update">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="Codigo" Name="cod" Type="Int32"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
