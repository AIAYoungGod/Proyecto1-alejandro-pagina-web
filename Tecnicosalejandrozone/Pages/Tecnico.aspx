<%@ Page Title="Gestión de Técnicos" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Tecnicos.aspx.cs" Inherits="ProyectoReparacionesWeb.Pages.Tecnicos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial;
            margin: 20px;
        }

        h2 {
            color: #2E86C1;
        }

        input[type="text"] {
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

    <h2>CRUD de Técnicos</h2>
    <div>
        <asp:Label ID="lblTecnicoID" runat="server" Text="ID Técnico:" />
        <asp:TextBox ID="txtTecnicoID" runat="server" ReadOnly="true" /><br /><br />

        <asp:Label ID="lblNombre" runat="server" Text="Nombre:" />
        <asp:TextBox ID="txtNombre" runat="server" /><br /><br />

        <asp:Label ID="lblEspecialidad" runat="server" Text="Especialidad:" />
        <asp:TextBox ID="txtEspecialidad" runat="server" /><br /><br />

        <asp:Label ID="lblTelefono" runat="server" Text="Teléfono:" />
        <asp:TextBox ID="txtTelefono" runat="server" /><br /><br />

        <div class="botones">
            <asp:Button ID="btnInsertar" runat="server" Text="Insertar" OnClick="btnInsertar_Click" />
            <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" />
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
        </div>
    </div>

    <hr />

    <asp:GridView ID="gridTecnicos" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="gridTecnicos_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="TecnicoID" HeaderText="ID" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" />
            <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
            <asp:CommandField ShowSelectButton="true" SelectText="Seleccionar" />
        </Columns>
    </asp:GridView>
</asp:Content>
