<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Web.aspx.cs" Inherits="Fundep.Web.Web" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestão de Projetos - FUNDEP</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
        .container { max-width: 800px; margin: auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; }
        label { display: block; font-weight: bold; margin-bottom: 5px; }
        input[type="text"], input[type="number"] { width: 100%; padding: 8px; box-sizing: border-box; }
        .btn { padding: 10px 20px; background-color: #0056b3; color: white; border: none; cursor: pointer; }
        .btn:hover { background-color: #004494; }
        .error { color: red; font-size: 0.9em; }
        .success { color: green; font-weight: bold; margin-top: 10px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #0056b3; color: white; }
        .loader { color: #0056b3; font-weight: bold; display: none; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        
        <div class="container">
            <h1>Gestão de Projetos</h1>
            
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
                            <div style="margin-bottom:10px; color: orange;">Processando solicitação...</div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:Label ID="lblMensagem" runat="server" EnableViewState="false"></asp:Label>

                    <hr />

                    <h3>Novo Projeto</h3>

                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                        HeaderText="Atenção:" ValidationGroup="Cadastro" DisplayMode="BulletList" />

                    <div class="form-group">
                        <label>Número do Projeto:</label>
                        <asp:TextBox ID="txtNumero" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNumero" runat="server" 
                            ControlToValidate="txtNumero" 
                            ErrorMessage="O número do projeto é obrigatório." 
                            Text="*" 
                            ForeColor="Red"
                            ValidationGroup="Cadastro" />
                    </div>

                    <div class="form-group">
                        <label>Número do Subprojeto:</label>
                        <asp:TextBox ID="txtSubprojeto" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSub" runat="server" 
                            ControlToValidate="txtSubprojeto" 
                            ErrorMessage="O número do subprojeto é obrigatório." 
                            Text="*" 
                            ForeColor="Red"
                            ValidationGroup="Cadastro" />
                    </div>

                    <div class="form-group">
                        <label>Nome do Projeto:</label>
                        <asp:TextBox ID="txtNome" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNome" runat="server" 
                            ControlToValidate="txtNome" 
                            ErrorMessage="O nome do projeto é obrigatório." 
                            Text="*" 
                            ForeColor="Red"
                            ValidationGroup="Cadastro" />
                    </div>

                    <div class="form-group">
                        <label>Coordenador:</label>
                        <asp:TextBox ID="txtCoordenador" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCoord" runat="server" 
                            ControlToValidate="txtCoordenador" 
                            ErrorMessage="O nome do coordenador é obrigatório." 
                            Text="*" 
                            ForeColor="Red"
                            ValidationGroup="Cadastro" />
                    </div>

                    <div class="form-group">
                        <label>Saldo (R$):</label>
                        <asp:TextBox ID="txtSaldo" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSaldo" runat="server" 
                            ControlToValidate="txtSaldo" 
                            ErrorMessage="O saldo é obrigatório." 
                            Text="*" 
                            ForeColor="Red"
                            ValidationGroup="Cadastro" />
                    </div>

                    <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar Projeto" OnClick="btnCadastrar_Click" ValidationGroup="Cadastro" CssClass="btn" />
                    <hr />

                    <h3>Consultar Projetos</h3>
                    <div class="form-group">
                        <label>Filtro (Nome ou Número):</label>
                        <asp:TextBox ID="txtFiltro" runat="server"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnConsultar" runat="server" Text="Pesquisar" OnClick="btnConsultar_Click" CssClass="btn" />

                    <asp:GridView ID="gvProjetos" runat="server" AutoGenerateColumns="true" EmptyDataText="Nenhum projeto encontrado.">
                    </asp:GridView>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>