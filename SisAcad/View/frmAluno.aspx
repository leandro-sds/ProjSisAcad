<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAluno.aspx.cs" Inherits="SisAcad.View.frmAluno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblNome" runat="server" Text="Nome"></asp:Label>
        <asp:TextBox ID="tbtNome" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblMat" runat="server" Text="Matricula"></asp:Label>
        <asp:TextBox ID="tbtMat" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblCurso" runat="server" Text="Curso"></asp:Label>
        <asp:TextBox ID="tbtCurso" runat="server"></asp:TextBox>

        <asp:FormView ID="FormView1" runat="server" DataSourceID="objAluno">
            <EditItemTemplate>
                Id:
                <asp:TextBox Text='<%# Bind("Id") %>' runat="server" ID="IdTextBox" /><br />
                aluno_Mat:
                <asp:TextBox Text='<%# Bind("aluno_Mat") %>' runat="server" ID="aluno_MatTextBox" /><br />
                aluno_Nome:
                <asp:TextBox Text='<%# Bind("aluno_Nome") %>' runat="server" ID="aluno_NomeTextBox" /><br />
                aluno_TotCred:
                <asp:TextBox Text='<%# Bind("aluno_TotCred") %>' runat="server" ID="aluno_TotCredTextBox" /><br />
                aluno_DataNasc:
                <asp:TextBox Text='<%# Bind("aluno_DataNasc") %>' runat="server" ID="aluno_DataNascTextBox" /><br />
                aluno_MGP:
                <asp:TextBox Text='<%# Bind("aluno_MGP") %>' runat="server" ID="aluno_MGPTextBox" /><br />
                aluno_CodCurso:
                <asp:TextBox Text='<%# Bind("aluno_CodCurso") %>' runat="server" ID="aluno_CodCursoTextBox" /><br />
                <asp:LinkButton runat="server" Text="Atualizar" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Id:
                <asp:TextBox Text='<%# Bind("Id") %>' runat="server" ID="IdTextBox" /><br />
                aluno_Mat:
                <asp:TextBox Text='<%# Bind("aluno_Mat") %>' runat="server" ID="aluno_MatTextBox" /><br />
                aluno_Nome:
                <asp:TextBox Text='<%# Bind("aluno_Nome") %>' runat="server" ID="aluno_NomeTextBox" /><br />
                aluno_TotCred:
                <asp:TextBox Text='<%# Bind("aluno_TotCred") %>' runat="server" ID="aluno_TotCredTextBox" /><br />
                aluno_DataNasc:
                <asp:TextBox Text='<%# Bind("aluno_DataNasc") %>' runat="server" ID="aluno_DataNascTextBox" /><br />
                aluno_MGP:
                <asp:TextBox Text='<%# Bind("aluno_MGP") %>' runat="server" ID="aluno_MGPTextBox" /><br />
                aluno_CodCurso:
                <asp:TextBox Text='<%# Bind("aluno_CodCurso") %>' runat="server" ID="aluno_CodCursoTextBox" /><br />
                <asp:LinkButton runat="server" Text="Inserir" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
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
                <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Excluir" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Novo" CommandName="New" ID="NewButton" CausesValidation="False" />
            </ItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource runat="server" ID="objAluno" DataObjectTypeName="SisAcad.Model.Aluno" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.AlunoController" UpdateMethod="Update">
            <SelectParameters>
                <asp:ControlParameter ControlID="tbtMat" PropertyName="Text" Name="mat" Type="Int32"></asp:ControlParameter>
                <asp:ControlParameter ControlID="tbtNome" PropertyName="Text" Name="nome" Type="String"></asp:ControlParameter>
                <asp:ControlParameter ControlID="tbtCurso" PropertyName="Text" Name="codCurso" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
