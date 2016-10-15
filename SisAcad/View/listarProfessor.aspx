<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="listarProfessor.aspx.cs" Inherits="SisAcad.View.listarProfessor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="page-header">
      <h1 class="page-title">Cadastrar</h1>
    </div>
    <div class="page-content container-fluid">
      <!-- Panel Header -->
      <div class="panel">
        <div class="panel-body">
            <label>Nome</label>
            <asp:TextBox ID="tbNome" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Insira o nome" ControlToValidate="tbNome" BackColor="Red"></asp:RequiredFieldValidator>
            <label>senha</label>
            <asp:TextBox ID="tbSenha" runat="server"></asp:TextBox>
            <label>confirmação</label>
            <asp:TextBox ID="tbConfirma" runat="server"></asp:TextBox>

            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Senha invalida" ControlToCompare="tbSenha" ControlToValidate="tbConfirma" ValidationGroup="Senha"></asp:CompareValidator>
            <asp:Button ID="Button1" runat="server" Text="Button" CausesValidation="True" OnClick="Button1_Click" ValidationGroup="Senha" />
        </div>
      </div>
      <!-- End Panel Header -->
    </div>
</asp:Content>
