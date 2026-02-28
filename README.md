# Unifor LaTeX Report Template

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Este repositório contém um template em LaTeX estruturado para a criação de relatórios semanais de projetos de Pesquisa e Desenvolvimento (P&D). Ele foi originalmente desenhado para o acompanhamento de projetos em Inteligência Artificial, mas sua estrutura modular pode ser adaptada para qualquer área de pesquisa.

O modelo conta com uma capa pré-configurada no padrão da **Universidade de Fortaleza (UNIFOR)**, geração automática de sumário e referências, além de formatação de tabelas e figuras no padrão ABNT/IEEE.

## Estrutura do Projeto

Para manter o código limpo ao longo de meses de pesquisa, o projeto utiliza uma estrutura modular. Cada semana de trabalho possui seu próprio arquivo e pasta de imagens.

```text
.
├── build/                  # Diretório gerado automaticamente com artefatos de compilação
├── Dockerfile              # Configuração da imagem Docker para compilação local
├── logo_unifor.png         # Logo da instituição para a capa
├── main.pdf                # Relatório final gerado em PDF
├── main.tex                # Arquivo principal (Capa, Sumário e configurações)
├── README.md               # Documentação do projeto
├── referencias.bib         # Arquivo BibTeX com as referências bibliográficas
└── semanas/                # Diretório com o conteúdo semanal
    ├── 01/
    │   ├── main.tex        # Relatório de atividades da Semana 01
    └── 02/
        └── main.tex        # Relatório de atividades da Semana 02
```

---

## Como usar este template

Você pode editar e compilar este projeto de duas maneiras: utilizando a plataforma nuvem **Overleaf** ou trabalhando **localmente** no seu editor favorito (VS Code, Vim, etc.) com **Docker**.

### Opção 1: Importando no overleaf

1. Faça o download deste repositório inteiro como um arquivo `.zip`.
2. Acesse o [Overleaf](https://www.overleaf.com/) e faça login.
3. Clique em **New Project** (Novo Projeto) > **Upload Project** (Fazer upload de projeto).
4. Selecione o arquivo `.zip` que você baixou.
5. O Overleaf extrairá os arquivos e você poderá editar o código diretamente no navegador. O PDF será gerado automaticamente ao lado direito sempre que você clicar em **Recompile**.

### Opção 2: Edição Local + Compilação via Docker

Se você prefere editar o código no **VS Code**, **Vim**, **Neovim** ou qualquer outro editor de texto, você não precisa instalar a pesada distribuição do TeX Live na sua máquina. O projeto já conta com um `Dockerfile` que resolve isso.

**Pré-requisitos:**

- [Docker](https://docs.docker.com/get-docker/)
- [Make](https://www.gnu.org/software/make/) (recomendado)
- Seu editor de texto de preferência.

**Passo 1: Construir a Imagem Docker**

Execute uma única vez (ou quando alterar o Dockerfile) para preparar o ambiente:

```bash
make build
```

**Passo 2: Compilar o Projeto**

Para compilar o arquivo principal (`main.tex`):

```bash
make
```

Para compilar um arquivo específico: `make FILE=nome_do_arquivo`

**Passo 3: Visualizar o PDF**

Para abrir o PDF gerado no seu leitor padrão:

```bash
make view
```

#### Uso Direto via Docker:

Embora o uso do **Make** seja recomendado pela praticidade, você também pode realizar a compilação direta pelo Docker se preferir:

```bash
docker run --rm -v "$(pwd)":/build --name abnttex2 abnttex2 sh -c "latexmk -pdf -outdir=build main.tex && cp build/main.pdf ."
```

---

## Como adicionar uma nova semana de relatório

A arquitetura do projeto foi feita para facilitar o crescimento do documento. Para adicionar uma nova semana (ex: Semana 03):

1. Crie uma nova pasta `03` dentro do diretório `semanas/`.
2. Crie um arquivo `main.tex` dentro dela e inicie com o comando de cabeçalho:

```latex
\novaSemana{03}{Data de Início a Data de Fim}

\section{Objetivos Estratégicos}
Escreva seu conteúdo aqui...

```

3. Abra o arquivo raiz `main.tex` e adicione a importação da nova semana logo acima da seção de referências:

```latex
\input{semanas/03/main.tex}

```

4. Recompile o projeto (via Overleaf ou Docker).

---

## ⚠️ Atenção

Este template é um projeto gratuito, distribuído sem garantias, voltado exclusivamente para fins acadêmicos. Trata-se de uma iniciativa extraoficial, sem vínculo institucional com a Universidade de Fortaleza (UNIFOR).

O uso deste projeto é de total responsabilidade do aluno.

---

**Desenvolvido por:** [Clysman](https://github.com/clys-man)
