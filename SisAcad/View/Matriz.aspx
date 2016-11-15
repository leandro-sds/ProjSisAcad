<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master.Master" AutoEventWireup="true" CodeBehind="Matriz.aspx.cs" Inherits="SisAcad.View.Matriz" %>
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
            <%-- Cursos --%>
            
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-1 control-label">Nome</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="tbNomeCurso" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label">Responsável</label>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="ddlProf" CssClass="form-control" runat="server" DataSourceID="objProf" DataTextField="curso_Nome" DataValueField="curso_IdProf">
                            <asp:ListItem Value="-1" Selected="True">Todos</asp:ListItem>
                        </asp:DropDownList>
                        <asp:ObjectDataSource runat="server" ID="objProf" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.CursoController"></asp:ObjectDataSource>
                    </div>
                </div>

                

                <div class="form-group">
                    <div class="col-sm-2 col-sm-offset-1">
                        <asp:Button ID="btnPesqCurso" runat="server" Text="Pesquisar" />
                    </div>
                </div>
            </div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="objCursos">
                <Columns>
                    <%--<asp:BoundField DataField="curso_Cod" HeaderText="curso_Cod" SortExpression="curso_Cod"></asp:BoundField>
                    <asp:BoundField DataField="curso_TotCred" HeaderText="curso_TotCred" SortExpression="curso_TotCred"></asp:BoundField>--%>
                    <asp:BoundField DataField="curso_Nome" HeaderText="curso_Nome" SortExpression="curso_Nome"></asp:BoundField>
                    <%--<asp:BoundField DataField="curso_IdProf" HeaderText="curso_IdProf" SortExpression="curso_IdProf"></asp:BoundField>--%>
                    <asp:TemplateField HeaderText="Professor" SortExpression="curso_IdProf">
                        <ItemTemplate>
                            <asp:Label Text='<%# Bind("Professor.prof_Nome") %>' runat="server" id="nomeProf"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <%-- Cursos --%>

            <%-- Disciplinas --%>

            <asp:ObjectDataSource runat="server" ID="objCursos" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.CursoController">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbNomeCurso" PropertyName="Text" Name="nome" Type="String"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="ddlProf" PropertyName="SelectedValue" Name="id" Type="Int32"></asp:ControlParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-1 control-label">Nome</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="tbNomeDisc" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>

            <asp:GridView ID="gridDisc" runat="server" AutoGenerateColumns="False" DataSourceID="objDisc">
                <Columns>
                    <%--<asp:BoundField DataField="disc_Cod" HeaderText="disc_Cod" SortExpression="disc_Cod"></asp:BoundField>
                    <asp:BoundField DataField="disc_Cred" HeaderText="disc_Cred" SortExpression="disc_Cred"></asp:BoundField>--%>
                    <asp:BoundField DataField="disc_Nome" HeaderText="disc_Nome" SortExpression="disc_Nome"></asp:BoundField>
                    <asp:CheckBoxField />
                    <%--<asp:BoundField DataField="disc_Tipo" HeaderText="disc_Tipo" SortExpression="disc_Tipo"></asp:BoundField>
                    <asp:BoundField DataField="disc_HoraObr" HeaderText="disc_HoraObr" SortExpression="disc_HoraObr"></asp:BoundField>
                    <asp:BoundField DataField="disc_Falta" HeaderText="disc_Falta" SortExpression="disc_Falta"></asp:BoundField>--%>
                </Columns>
            </asp:GridView>

            <%-- Disciplinas --%>
            <asp:ObjectDataSource runat="server" ID="objDisc" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="SisAcad.Controllers.DisciplinaController">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbNomeDisc" PropertyName="Text" Name="nome" Type="String"></asp:ControlParameter>
                    <asp:Parameter Name="tipo" Type="String"></asp:Parameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
      </div>
      <!-- End Panel Content -->
    </div>
  <!-- End Page -->
</asp:Content>
