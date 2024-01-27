<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormularioTurno.aspx.cs" Inherits="GestorTurnosWeb.FormularioTurno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="lblTitulo" runat="server" CssClass="fs-4 fw-bold"></asp:Label>
    
    <div class="mb-3">
        <label>Nombre del paciente</label>
        <asp:DropDownList ID="ddlPersona" runat="server" CssClass="form-select"></asp:DropDownList>
    </div>
    <div class="mb-3">
        <label>Nombre del Doctor</label>
        <asp:DropDownList ID="ddlDoctor" runat="server" CssClass="form-select"></asp:DropDownList>
    </div>
    <div class="mb-3">
        <label class="form-label"></label>
        <asp:TextBox ID="txtFechaTurno" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
    </div>

    <asp:Button ID="btnSubmit" runat="server" Text="Enviar" CssClass="btn btn-sm btn-primary" OnClick="btnSubmit_Click" />
    <asp:LinkButton runat="server" PostBackUrl="~/Default.aspx" CssClass="btn btn-sm btn-warning">Volver</asp:LinkButton>

</asp:Content>
