<%@ Page Title="Gestión de Reparaciones" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Reparacion.aspx.cs" Inherits="ProyectoReparacionesWeb.Pages.ReparacionPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial;
            margin: 20px;
        }

        h2 {
            color: #2E86C1;
        }

        input[type="text"], select {
            padding: 6px;
            margin-bottom: 10px;
            width: 280px;
        }

        .botones input {
            margin-right: 10px;
            padding: 6px 12px;
        }

        hr {
            margin: 20px 0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>CRUD de Reparaciones</h2>
    <div>
        <asp:Label ID="lblReparacionID" runat="server" Text="ID Reparación:" />
        <asp:TextBox ID="txtReparacionID" runat="server" ReadOnly="true" /><br /><br />

        <asp:Label ID="lblUsuarioID" runat="server" Text="Usuario:" />
        <asp:DropDownList ID="ddlUsuarioID" runat="server"></asp:DropDownList><br /><br />

        <asp:Label ID="lblEquipoID" runat="server" Text="Equipo:" />
        <asp:DropDownList ID="ddlEquipoID" runat="server"></asp:DropDownList><br /><br />

        <asp:Label ID="lblTecnicoID" runat="server" Text="Técnico:" />
        <asp:DropDownList ID="ddlTecnicoID" runat="server"></asp:DropDownList><br /><br />

        <asp:Label ID="lblFechaIngreso" runat="server" Text="Fecha Ingreso:" />
        <asp:TextBox ID="txtFechaIngreso" runat="server" TextMode="Date" /><br /><br />

        <asp:Label ID="lblEstado" runat="server" Text="Estado:" />
        <asp:TextBox ID="txtEstado" runat="server" /><br /><br />

        <div class="botones">
            <asp:Button ID="btnInsertar" runat="server" Text="Insertar" OnClick="btnInsertar_Click" />
            <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" />
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
        </div>
    </div>

    <hr />

    <asp:GridView ID="gridReparaciones" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="gridReparaciones_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="ReparacionID" HeaderText="ID" />
            <asp:BoundField DataField="UsuarioID" HeaderText="Usuario ID" />
            <asp:BoundField DataField="EquipoID" HeaderText="Equipo ID" />
            <asp:BoundField DataField="TecnicoNombre" HeaderText="Técnico" />
            <asp:BoundField DataField="FechaIngreso" HeaderText="Fecha Ingreso" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" />
            <asp:CommandField ShowSelectButton="true" SelectText="Seleccionar" />
        </Columns>
    </asp:GridView>
</asp:Content>
