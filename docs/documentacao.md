# Documentacao do Modo Financeiro

## 1. Visao geral
O modo financeiro e uma aplicacao web/PWA com frontend unico em `index.html`, backend em funcoes Node.js e persistencia em banco configuravel.

## 2. Stack tecnica
- Node.js com ES Modules
- HTML/CSS/JS vanilla no frontend
- Funcoes Node.js
- Camada de banco configuravel

## 3. Estrutura real do repositorio
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

### Pastas principais
- `api/`: endpoints serverless e handlers HTTP
- `features/`: regras de dominio do financeiro em `model/`, `service/` e `index.js`
- `lib/`: utilitarios compartilhados, como o cliente de banco
- `monitoring/`: rotinas de analise operacional
- `sql/`: scripts de banco
- `docs/`: documentacao interna e checkpoints

## 4. Arquitetura atual
O frontend consome os endpoints em `api/`, que por sua vez delegam a regra de negocio do financeiro para `features/` ou helpers compartilhados.

Fluxo resumido:
1. Usuario interage no `index.html`
2. O frontend chama `/api/*`
3. O handler valida o request
4. A regra de dominio monta ou normaliza payloads
5. O banco persiste ou consulta dados
6. A interface e atualizada no cliente

## 5. Modulos ativos
Modulos presentes e ativos no repositorio:
- `financeiro`

Observacao:
- Nao existe endpoint de `calendario` neste estado do repositorio.
- Nao ha outros modulos ativos neste recorte.

## 6. Endpoints da API
Arquivos existentes em `api/`:
- `apps.js`
- `financeiro.js`
- `financeiroHelpers.js`
- `_financeiroShared.js`
- `roadmap.js`
- `statistics.js`

### Catalogo e shell
#### `GET /api/apps`
Retorna o catalogo reduzido ao financeiro.

#### `GET /api/statistics`
Retorna totais derivados do catalogo central.

#### `GET /api/roadmap`
Retorna o roadmap resumido do produto.

### Financeiro
#### `/api/financeiro`
Metodos: `GET`, `POST`, `PATCH`, `DELETE`

Comportamento:
- Consolida dados de `tb_financas`, `tb_despesas_fixas`, `tb_poupanca` e `tb_poupanca_metas`
- Usa `api/_financeiroShared.js` para centralizar a orquestracao do dominio
- Usa `api/financeiroHelpers.js` para helpers genricos de request e datas

## 7. Banco de dados e tabelas
Tabelas identificadas no codigo:
- `tb_financas`
- `tb_despesas_fixas`
- `tb_poupanca`
- `tb_poupanca_metas`

## 8. Variaveis de ambiente
Obrigatorias:
- Variaveis do banco definidas no ambiente

Notas:
- Uma chave privilegiada pode ser usada quando o runtime exigir permissao extra
- Nao versionar `.env`
- Definir variaveis de ambiente no ambiente local privado

## 9. Deploy
- Build command: `npm run build`
- Output directory: `.`
- Framework: `null`
- Configuracao conforme o ambiente de deploy

## 10. Observacoes de manutencao
- O shell principal ainda centraliza a experiencia em `index.html`
- O arquivo `api/_financeiroShared.js` ainda concentra orquestracao relevante do financeiro
- O produto esta deliberadamente reduzido ao modo financeiro

## 11. Checklist e checkpoint
- Revisar sempre as documentacoes publica e interna antes de mover a arquitetura
- Manter os contratos de endpoint estaveis durante refatoracoes
- Rodar N1 e N2 antes de cada commit relevante
- Atualizar este checkpoint ao fechar cada etapa

Checkpoint:
- Ultima interacao: ajuste de documentacao segundo `SKILLS.md`
- Commit de referencia: `864b5db` `refactor: extract financeiro shared helpers`
