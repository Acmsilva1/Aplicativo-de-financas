# Minhas Financas

Aplicacao web/PWA focada exclusivamente no modo financeiro, com frontend unico em `index.html`, backend serverless em Node.js e persistencia em banco configuravel.

**Documentacao oficial:** [`docs/documentacao.md`](docs/documentacao.md)

## Visao geral

- Frontend central em `index.html`
- APIs serverless em `api/`
- Regras de dominio do financeiro em `features/`
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
Aplicativo-de-financas/
|-- index.html
|-- api/
|-- features/
|-- lib/
|-- monitoring/
|-- scripts/
|-- sql/
|-- docs/
|-- apk app/
|-- twa android/
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
- `financeiro` e o modulo unico do produto
- O restante do repositorio serve apenas de apoio ao financeiro
- As rotas de distribuicao Android ficam separadas em `apk app/` e `twa android/`
