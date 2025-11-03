# Documentação da Arquitetura e Processo de Conversão

## 1. Visão Geral da Arquitetura

A nova arquitetura do sistema adota uma abordagem de Single Page Application (SPA), desacoplando o frontend do backend para maior flexibilidade e escalabilidade.

### 1.1. Frontend (ReactJS)
O frontend foi desenvolvido em ReactJS, utilizando uma arquitetura baseada em componentes reutilizáveis.
- **Componentes Principais:** A interface do usuário é construída a partir de componentes que espelham as funcionalidades das telas do sistema Delphi original.
- **Gerenciamento de Estado:** O estado da aplicação é gerenciado de forma localizada nos componentes ou através de contextos (React Context API) para estados globais.
- **Roteamento:** A navegação entre as diferentes "telas" da aplicação é controlada pelo React Router.

### 1.2. Backend (PHP)
O backend é uma API RESTful em PHP, responsável pela lógica de negócio e comunicação com o banco de dados.
- **Estrutura de Pastas:** O código é organizado em `models`, que representam as entidades do banco de dados, e `api`, que contém os endpoints RESTful.
- **Conexão com Banco de Dados:** A conexão com o MySQL é abstraída para garantir a segurança e a manutenibilidade.
- **Tratamento de Requisições:** Os endpoints da API manipulam as requisições HTTP (GET, POST, PUT, DELETE) para realizar as operações CRUD (Create, Read, Update, Delete).

### 1.3. Banco de Dados (MySQL)
O esquema do banco de dados MySQL foi derivado dos scripts SQL do Firebird/Interbase original.
- **Mapeamento de Tipos de Dados:** Os tipos de dados foram mapeados para os seus equivalentes no MySQL.
- **Índices e Chaves:** A estrutura de índices e chaves primárias/estrangeiras foi mantida e otimizada para o novo SGBD.

### 1.4. Fluxo de Comunicação
A comunicação entre o frontend e o backend é realizada através de chamadas a uma API RESTful.
- **Requisições e Respostas:** O frontend envia requisições HTTP para os endpoints da API e recebe respostas em formato JSON.
- **Autenticação e Autorização:** A segurança da comunicação é garantida através de tokens ou sessões, dependendo do endpoint.

## 2. Processo de Conversão

A conversão do sistema Delphi seguiu uma metodologia atômica, focada em processar um par de arquivos (`.pas` e `.dfm`) de cada vez. Esta abordagem permitiu uma migração controlada, incremental e com menor risco.

### 2.1. Análise e Mapeamento
Cada unidade Delphi foi analisada para mapear seus componentes e lógica de negócio para a nova stack:
- **Interface do Usuário (`.dfm`):** Os componentes visuais foram mapeados para componentes React, mantendo a estrutura e a funcionalidade da interface original.
- **Lógica de Negócio (`.pas`):** O código Pascal foi analisado para extrair regras de negócio, validações e manipulação de dados. Essa lógica foi reimplementada no backend PHP.
- **Acesso a Dados:** As queries e o acesso ao banco de dados, frequentemente localizados em Data Modules como `UDModRosa.pas`, foram a base para a criação dos `models` e dos endpoints da API em PHP.

### 2.2. Refatoração
O processo não foi uma tradução literal do código. Foram aplicados princípios de refatoração para modernizar a arquitetura:
- **Modularidade:** As unidades Delphi monolíticas foram quebradas em componentes React menores e reutilizáveis e em serviços PHP focados em uma única responsabilidade.
- **Separação de Responsabilidades:** A lógica de apresentação foi isolada no frontend (React), enquanto a lógica de negócio e o acesso a dados foram centralizados no backend (PHP API).
- **Boas Práticas:** Foram adotadas práticas modernas de desenvolvimento, como o uso de APIs RESTful, componentização e gerenciamento de estado no frontend.

### 2.3. Exemplos de Conversão
- **`UDModRosa.pas`:** Este Data Module, que centralizava a conexão e as queries ao banco de dados, teve sua funcionalidade convertida em uma classe de conexão de banco de dados em PHP e serviu de base para a criação de múltiplos `models`.
- **`UCliente.pas` / `ULivro.pas` / `UResidos.pas`:** Unidades como estas, que representavam entidades de negócio, foram convertidas da seguinte forma:
    - A lógica de manipulação de dados foi transformada em `models` PHP (ex: `Cliente.php`).
    - As operações CRUD foram expostas como endpoints na API (ex: `/api/clientes`).
    - A interface do usuário foi recriada como um conjunto de componentes React (ex: `FormCliente.jsx`, `TabelaClientes.jsx`) que consomem a API.

## 3. Tecnologias Utilizadas

- **Frontend:**
  - **ReactJS:** Biblioteca para construção da interface do usuário.
  - **HTML5 & CSS3:** Estruturação e estilização das páginas.
  - **JavaScript (ES6+):** Linguagem de programação do frontend.
  - **React Router:** Para gerenciamento de rotas na SPA.

- **Backend:**
  - **PHP:** Linguagem de programação para a API RESTful.
  - **RESTful API:** Padrão de arquitetura para a comunicação entre cliente e servidor.

- **Banco de Dados:**
  - **MySQL:** Sistema de gerenciamento de banco de dados relacional.

- **Ferramentas e Ambiente:**
  - **Git:** Sistema de controle de versão.
  - **VS Code:** Editor de código.

## 4. Melhorias Arquiteturais e Otimizações

A conversão para a nova stack tecnológica trouxe diversas melhorias em relação ao sistema Delphi legado:

- **Desacoplamento:** A separação entre frontend (React) e backend (PHP API) permite que as duas partes do sistema evoluam de forma independente.
- **Escalabilidade:** A arquitetura baseada em API permite escalar o backend e o frontend separadamente, de acordo com a demanda.
- **Manutenibilidade:** O uso de componentes reutilizáveis no React e uma estrutura organizada no PHP facilita a manutenção e a adição de novas funcionalidades.
- **Performance:** A abordagem de SPA proporciona uma experiência de usuário mais fluida e rápida, pois apenas os dados necessários são carregados, sem a necessidade de recarregar a página inteira.
- **Acessibilidade:** A nova plataforma web é inerentemente mais acessível a partir de diferentes dispositivos e sistemas operacionais através de um navegador web.
- **Modernização:** Adoção de tecnologias e práticas de desenvolvimento modernas, facilitando a contratação de novos desenvolvedores e a integração com outras ferramentas.