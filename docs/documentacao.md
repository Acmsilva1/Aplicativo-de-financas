# Documentacao Oficial

## Projeto principal

**Nome do produto:** Minhas Financas

**Escopo atual:** somente o modo financeiro

Este repositorio e a base oficial do aplicativo financeiro. Os modulos antigos foram removidos do produto ativo e nao fazem parte do contrato atual.

## Objetivo do sistema

Entregar uma aplicacao web/PWA para controle financeiro pessoal, com CRUD centralizado, backend serverless e banco de dados configuravel.

## Stack atual

- Frontend em `index.html`
- APIs serverless em `api/`
- Regras de dominio do financeiro em `features/`
- Cliente de banco compartilhado em `lib/database.js`
- Scripts e rotinas auxiliares em `sql/`, `scripts/` e `monitoring/`

## Estrutura do repositorio

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
|-- manifest.json
|-- sw.js
|-- vercel.json
|-- package.json
```

## Fluxo da aplicacao

1. O usuario acessa a homepage em `index.html`.
2. O frontend consulta os endpoints em `api/`.
3. O handler valida a requisicao e encaminha para a camada de dominio.
4. A regra de negocio do financeiro monta, normaliza ou valida o payload.
5. O banco persiste ou consulta os dados.
6. A interface atualiza o estado visual no cliente.

## Contrato do produto

### Modulo ativo

- `financeiro`

### Endpoints centrais

- `GET /api/apps`
- `GET /api/statistics`
- `GET /api/roadmap`
- `GET /api/financeiro`

### Regras importantes

- Nao reintroduzir modulos removidos sem decisao formal.
- Preservar o financeiro como nucleo do produto.
- Manter os contratos de API estaveis.
- Preferir mudancas pequenas e rastreaveis.

## Banco de dados

Tabelas atuais do financeiro:

- `tb_financas`
- `tb_despesas_fixas`
- `tb_poupanca`
- `tb_poupanca_metas`

## Variaveis de ambiente

As credenciais do banco devem ficar apenas no ambiente de execucao.

Nao versionar `.env` nem segredos no repositorio.

## Deploy

- Build: `npm run build`
- Saida: `.` para deploy estatico
- Plataforma alvo: Vercel ou ambiente equivalente com suporte a rotas serverless

## Padrao de manutencao

- Atualizar a documentacao sempre que o contrato do financeiro mudar.
- Registrar checkpoints relevantes em `docs/checkpoint.md`.
- Sincronizar README, manifest e rotas quando houver mudanca de nome ou escopo.

