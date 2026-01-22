using System;
using System.Runtime.Serialization;

namespace Fundep.Core.Database
{
    [DataContract]
    public class Projeto
    {
        [DataMember]
        public int NumeroProjeto { get; set; }

        [DataMember]
        public int NumeroSubprojeto { get; set; }

        [DataMember]
        public string Nome { get; set; }

        [DataMember]
        public string Coordenador { get; set; }

        [DataMember]
        public decimal Saldo { get; set; }
    }
}