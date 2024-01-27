<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GestorTurnosWeb.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-12">
            <asp:Button runat="server" OnClick="Nuevo_Click" CssClass="btn btn-sm btn-success mb-3" Text="Nuevo" />
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <asp:GridView ID="GVTurnos" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Persona.NombreCompleto" HeaderText="Nombre del Paciente" />
                    <asp:BoundField DataField="Doctor.Nombre" HeaderText="Nombre del Doctor" />
                    <asp:BoundField DataField="FechaTurno" HeaderText="Fecha del Turno" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandArgument='<%#Eval("IdTurno")%>'
                                OnClick="Editar_Click" CssClass="btn btn-sm btn-primary"
                                >Editar</asp:LinkButton>

                            <asp:LinkButton runat="server" CommandArgument='<%#Eval("IdTurno")%>'
                                OnClick="Eliminar_Click" CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Esta seguro que desea eliminar este turno?')"
                                >Eliminar</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
