using Fundep.Core.Database;
using Fundep.Core.Servico;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Threading;

namespace Fundep.Web
{
    public partial class Web : System.Web.UI.Page
    {
        // Instancia o serviço 
        private readonly IProjetoService _projetoService = new ProjetoService();

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            try
            {
                // Simula o delay (opcional)
                Thread.Sleep(500);

                var projeto = new Projeto
                {
                    NumeroProjeto = int.Parse(txtNumero.Text),
                    NumeroSubprojeto = int.Parse(txtSubprojeto.Text),
                    Nome = txtNome.Text,
                    Coordenador = txtCoordenador.Text,
                    Saldo = decimal.Parse(txtSaldo.Text)
                };

                _projetoService.CadastrarProjeto(projeto);

                lblMensagem.Text = "Projeto cadastrado com sucesso!";
                lblMensagem.CssClass = "success";

                LimparCampos();

                gvProjetos.DataSource = null;
                gvProjetos.DataBind();
            }
            catch (Exception ex)
            {
                lblMensagem.Text = "Erro ao cadastrar: " + ex.Message;
                lblMensagem.CssClass = "error";
            }
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            Thread.Sleep(500); // Delay visual para o loader
            AtualizarGrid();
        }

        private void AtualizarGrid()
        {
            try
            {
                List<Projeto> projetos = _projetoService.ConsultarProjetos(txtFiltro.Text);
                gvProjetos.DataSource = projetos;
                gvProjetos.DataBind();
            }
            catch (Exception ex)
            {
                lblMensagem.Text = "Erro ao consultar: " + ex.Message;
                lblMensagem.CssClass = "error";
            }
        }

        private void LimparCampos()
        {
            txtNumero.Text = "";
            txtSubprojeto.Text = "";
            txtNome.Text = "";
            txtCoordenador.Text = "";
            txtSaldo.Text = "";
        }
    }
}