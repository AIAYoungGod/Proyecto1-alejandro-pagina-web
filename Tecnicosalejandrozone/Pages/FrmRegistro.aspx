<%@ Page Title="Registro/Login" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="FrmRegistro.aspx.cs" Inherits="proyecto_proga.CapaPresentacion.FrmRegistro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Registro/Login de Usuario</h2>

    <label>Nombre:</label>
    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox><br /><br />

    <label>Correo:</label>
    <asp:TextBox ID="txtCorreo" runat="server"></asp:TextBox><br /><br />

    <label>Clave:</label>
    <asp:TextBox ID="txtClave" runat="server" TextMode="Password"></asp:TextBox><br /><br />

    <asp:Button ID="btnRegistrar" runat="server" Text="Registrarse" OnClick="btnRegistrar_Click" />
    <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" OnClick="btnLogin_Click" />

    <br /><br />
    <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" />
</asp:Content>

