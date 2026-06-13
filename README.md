# Modo Financeiro

O modo financeiro e uma aplicacao web/PWA com frontend unico em `index.html`, backend em funcoes Node.js e persistencia em banco configuravel.

**Documentacao interna:** [`docs/documentacao.md`](docs/documentacao.md)

## Visao geral

- Frontend central em `index.html`
- APIs serverless em `api/`
- Regras de dominio concentradas no financeiro em `features/`
- Cliente de banco compartilhado em `lib/database.js`
- Monitoramento e rotinas operacionais em `monitoring/`

## Stack

- Node.js com ES Modules
- HTML/CSS/JS vanilla
- Funcoes Node.js
- Camada de banco configuravel

## Modulos ativos

- `financeiro`

## Estrutura

```text
super-app-1/
|-- index.html
|-- api/
|-- features/
|-- lib/
|-- monitoring/
|-- scripts/
|-- sql/
|-- docs/
|-- manifest.json
|-- sw.js
|-- package.json
```

## Endpoints principais

- `GET /api/apps`
- `GET /api/statistics`
- `GET /api/roadmap`
- `GET /api/financeiro`

## Dependencias e ambiente

Variaveis obrigatorias:

- Variaveis de banco definidas no ambiente

Notas:

- Nao versionar `.env`
- Configurar variaveis de ambiente no ambiente local
- `api/_financeiroShared.js` e `api/financeiroHelpers.js` concentram a orquestracao auxiliar do financeiro

## Deploy

- Build command: `npm run build`
- Output directory: `.`
- Arquivo de deploy: conforme o ambiente escolhido

## Observacoes

- O shell ainda e centralizado em `index.html`
- `financeiro` e o modulo mais sensivel do negocio
- O restante do repositorio serve apenas de apoio ao financeiro
