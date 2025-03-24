<%@ Page Title="CRUD de Equipos" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Equipos.aspx.cs" Inherits="ProyectoReparacionesWeb.Pages.Equipos" %>

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

    <h2>CRUD de Equipos</h2>
    <div>
        <asp:Label ID="lblEquipoID" runat="server" Text="ID Equipo:" />
        <asp:TextBox ID="txtEquipoID" runat="server" ReadOnly="true" /><br /><br />

        <asp:Label ID="lblNombre" runat="server" Text="Nombre:" />
        <asp:TextBox ID="txtNombre" runat="server" /><br /><br />

        <asp:Label ID="lblMarca" runat="server" Text="Marca:" />
        <asp:TextBox ID="txtMarca" runat="server" /><br /><br />

        <asp:Label ID="lblSerie" runat="server" Text="Serie:" />
        <asp:TextBox ID="txtSerie" runat="server" /><br /><br />

        <div class="botones">
            <asp:Button ID="btnInsertar" runat="server" Text="Insertar" OnClick="btnInsertar_Click" />
            <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" />
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
        </div>
    </div>

    <hr />

    <asp:GridView ID="gridEquipos" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="gridEquipos_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="EquipoID" HeaderText="ID" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Marca" HeaderText="Marca" />
            <asp:BoundField DataField="Serie" HeaderText="Serie" />
            <asp:CommandField ShowSelectButton="true" SelectText="Seleccionar" />
        </Columns>
    </asp:GridView>
</asp:Content>
