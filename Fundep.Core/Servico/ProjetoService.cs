using Fundep.Core.Database;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Fundep.Core.Servico
{
    public class ProjetoService : IProjetoService
    {
        // Persistência em memória (static para manter dados enquanto a aplicação roda)
        private static List<Projeto> _bancoDeDadosEmMemoria = new List<Projeto>();

        public void CadastrarProjeto(Projeto projeto)
        {
            if (projeto == null) throw new ArgumentNullException("Projeto inválido.");

            //Verifica se já existe alguém com esse número na lista
            bool jaExiste = _bancoDeDadosEmMemoria.Any(p => p.NumeroProjeto == projeto.NumeroProjeto);

            if (jaExiste)
            {
                throw new Exception($"Já existe um projeto cadastrado com o número {projeto.NumeroProjeto}.");
            }

            _bancoDeDadosEmMemoria.Add(projeto);
        }

        public List<Projeto> ConsultarProjetos(string filtro)
        {
            // Retorna tudo se o filtro for vazio, ou filtra por Nome ou Número
            if (string.IsNullOrWhiteSpace(filtro))
            {
                return _bancoDeDadosEmMemoria;
            }

            return _bancoDeDadosEmMemoria.Where(p =>
                p.Nome.IndexOf(filtro, StringComparison.OrdinalIgnoreCase) >= 0 ||
                p.NumeroProjeto.ToString().Contains(filtro)
            ).ToList();
        }
    }
}