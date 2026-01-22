using Fundep.Core.Database;
using System.Collections.Generic;
using System.ServiceModel;

namespace Fundep.Core.Servico
{
    [ServiceContract]
    public interface IProjetoService
    {
        [OperationContract]
        void CadastrarProjeto(Projeto projeto);

        [OperationContract]
        List<Projeto> ConsultarProjetos(string filtro);
    }
}