<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="listarDisciplina.aspx.cs" Inherits="SisAcad.View.listarDisciplina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!-- Page -->
    <!-- Panel Header -->
    <div class="page-header">
      <h1 class="page-title">Listar</h1>
    </div>
    <!-- End Panel Header -->
    <!-- Page Content -->
    <div class="page-content container-fluid">
      <!-- Panel Content -->
      <div class="panel">
        <div class="panel-body">
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-1 control-label">Nome</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="tbNome" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label">Tipo</label>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="ddlTipo" CssClass="form-control" runat="server">
                            <asp:ListItem Text="Todos" Value="" ></asp:ListItem>
                            <asp:ListItem Text="Presencial" Value="Presencial"></asp:ListItem>
                            <asp:ListItem Text="EAD" Value="EAD"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-2 col-sm-offset-1">
                        <asp:Button ID="btnPesq" CssClass="btn btn-primary" runat="server" Text="Pesquisar" />
                    </div>
                </div>
            </div>
            <asp:GridView CssClass="table table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="objDisc">
                <Columns>
                    <asp:BoundField DataField="disc_Cod" HeaderText="Código" SortExpression="disc_Cod"></asp:BoundField>
                    <asp:HyperLinkField DataNavigateUrlFields="disc_Cod" datanavigateurlformatstring="~\View/Disciplina.aspx?Codigo={0}" DataTextField="disc_Nome" HeaderText="Nome" Target="_self"/>
                    <asp:BoundField DataField="disc_Cred" HeaderText="Créditos" SortExpression="disc_Cred"></asp:BoundField>
                    <asp:BoundField DataField="disc_Tipo" HeaderText="Tipo" SortExpression="disc_Tipo"></asp:BoundField>
                    <asp:BoundField DataField="disc_HoraObr" HeaderText="Horas Obrigatórias" SortExpression="disc_HoraObr"></asp:BoundField>
                    <asp:BoundField DataField="disc_Falta" HeaderText="Limite de Faltas" SortExpression="disc_Falta"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource runat="server" ID="objDisc" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.DisciplinaController">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbNome" PropertyName="Text" Name="nome" Type="String"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="ddlTipo" PropertyName="SelectedValue" Name="tipo" Type="String"></asp:ControlParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
