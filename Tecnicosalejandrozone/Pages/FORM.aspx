<%@ Page Title="Gestión de Usuarios" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="FORM.aspx.cs" Inherits="ProyectoReparacionesWeb.Pages.Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial;
            margin: 40px;
        }

        h2 {
            color: #2E86C1;
        }

        input[type="text"] {
            width: 300px;
            padding: 6px;
            margin-bottom: 10px;
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
    <h2>CRUD de Usuarios</h2>
    <div>
        <asp:Label ID="lblID" runat="server" Text="ID Usuario:" />
        <asp:TextBox ID="txtID" runat="server" ReadOnly="true" /><br /><br />

        <asp:Label ID="lblNombre" runat="server" Text="Nombre:" />
        <asp:TextBox ID="txtNombre" runat="server" /><br /><br />

        <asp:Label ID="lblCorreo" runat="server" Text="Correo Electrónico:" />
        <asp:TextBox ID="txtCorreo" runat="server" /><br /><br />

        <asp:Label ID="lblTelefono" runat="server" Text="Teléfono:" />
        <asp:TextBox ID="txtTelefono" runat="server" /><br /><br />

        <div class="botones">
            <asp:Button ID="btnInsertar" runat="server" Text="Insertar" OnClick="btnInsertar_Click" />
            <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" />
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
        </div>
    </div>

    <hr />

    <asp:GridView ID="gridUsuarios" runat="server" AutoGenerateColumns="false"
                  OnSelectedIndexChanged="gridUsuarios_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="UsuarioID" HeaderText="ID" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="CorreoElectronico" HeaderText="Correo Electrónico" />
            <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
            <asp:CommandField ShowSelectButton="true" SelectText="Seleccionar" />
        </Columns>
    </asp:GridView>
</asp:Content>
