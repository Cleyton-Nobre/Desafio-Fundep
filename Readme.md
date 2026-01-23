# Desafio Técnico - Gestão de Projetos (FUNDEP)

## Sobre o Projeto
Esta aplicação é uma solução desenvolvida para atender ao Desafio Técnico de Backend. O objetivo é simular um sistema simplificado de cadastro e consulta de projetos, demonstrando conhecimentos em arquitetura de software, organização de código e tecnologias legadas do ecossistema .NET.

A solução foi separada em camadas para garantir desacoplamento e organização, isolando a regra de negócio da interface do usuário.

## Tecnologias Utilizadas
* **Linguagem:** C# (.NET Framework 4.7.2)
* **Frontend:** ASP.NET Web Forms
* **Backend/Serviço:** WCF (Windows Communication Foundation) encapsulado em DLL
* **Persistência:** Em memória (Lista estática)
* **IDE:** Visual Studio

---

## Estrutura da Solução
A solução `DesafioFundep` está dividida em dois projetos principais:

1.  **Fundep.Core (Class Library):**
    * Contém a lógica de negócios e o contrato do serviço WCF.
    * **Pastas:**
        * `Database`: Define os objetos de dados (DTOs) com atributos `[DataContract]`.
        * `Servico`: Define as interfaces `[ServiceContract]` e a implementação da lógica.
    * *Decisão:* Separei esta camada para simular um ambiente real mais organizado onde a pasta `Database` trabalha com funcionalidade Definição das entidades, já o `Servico` é responsável por fazer a interface entre a base de dados e o frotend.

2.  **Fundep.Web (ASP.NET Web Application):**
    * Interface do usuário baseada em Web Forms.
    * Utiliza `Code-Behind` para tratar eventos.
    * Consuma a DLL `Fundep.Core` diretamente.

---

## Como Executar o Projeto
> **Importante:** Como a solução utiliza múltiplos projetos, é necessário configurar a inicialização correta no Visual Studio.

1.  Abra o arquivo `DesafioFundep.sln` no Visual Studio.
2.  No **Solution Explorer**, clique com o botão direito no projeto **`Fundep.Web`** e selecione **"Set as StartUp Project"** (Definir como Projeto de Inicialização).
3.  Garanta que a página principal seja carregada corretamente: Clique com o botão direito no arquivo **`Default.aspx`** e selecione **"Set as Start Page"**.
4.  Execute a aplicação pressionando `F5` ou o botão de "Play".

---

## Decisões Técnicas e Arquiteturais

### 1. WCF e Contratos de Dados
Criei uma Interface (IProjetoService) para servir como um "contrato". Onde usei os atributos [DataMember] e [OperationContract] para controlar quais dados entram e saem da DLL, garantindo segurança e seguindo o padrão do WCF. 

### 2. Validações e Regras de Negócio
Implementei validação em duas etapas. No Frontend (ASP.NET), usou validadores visuais para impedir campos vazios. No Backend (C#), criou uma lógica com LINQ para impedir que dois projetos sejam cadastrados com o mesmo número, lançando uma exceção tratada e possibilitando a visualização pelo usuário na interface.

### 3. Experiência do Usuário (Loader)
Escolhi ele para atender ao requisito de "Loader visual" sem precisar recarregar a página inteira (Postback total), deixando a navegação mais fluida.

---

## Definições dos Componentes de Arquitetura .NET

### ASP.NET Web Forms
É a camada visual, na qual funciona simulando uma aplicação Desktop na Web.

### ▪ Code-behind
É a lógica de controle da página. Onde ele é responsáveis por tratar os eventos como cliques, carregamento, entre outros gerados pelo usuário.

### ▪ WCF (Windows Communication Foundation)
É a camada de serviços, em que ela é como o Web Forms busca dados que estão em outro serviço ou sistemas.

### ▪ Comunicação via DLL
É uma biblioteca de código local, sendo essa usada para organizar o projeto em módulos reutilizáveis.

---

## Melhorias Futuras
Caso o projeto precisasse evoluir para um ambiente de produção, eu sugeriria as seguintes implementações:

*  Substituir a lista em memória por um banco de dados (SQL Server) usando ADO.NET ou Entity Framework.
*  Implementar `[FaultContract]` para retornar erros personalizados e tipados para o frontend.
*  Configurar o serviço WCF para rodar via protocolo HTTP ou TCP em um servidor separado, ao invés de referência direta via DLL.
*  Adicionar testes unitários para a camada `Fundep.Core` para garantir a integridade das regras de negócio.
*  Separar páginas de cadastro e consulta em duas páginas distintas.

---

**Autor:** Cleyton Nobre
**Data:** Janeiro/2026
