# Seguranca Minima de Producao

Este documento registra as decisoes praticas para manter o app seguro no estado atual.

## Estado atual

- A web segue hospedada na Vercel.
- O Supabase esta protegido com RLS.
- A Vercel usa `SUPABASE_SERVICE_ROLE_KEY` apenas no backend serverless.

## Regras obrigatorias

1. Nunca expor `SUPABASE_SERVICE_ROLE_KEY` no frontend.
2. Nunca criar acesso direto do navegador ao banco com a service role.
3. Manter RLS habilitado em todas as tabelas publicas do esquema `public`.
4. Revisar policies sempre que um novo fluxo for adicionado.
5. Rotacionar segredos se houver suspeita de vazamento.

## Checklist operacional

- Confirmar que `lib/database.js` e o backend sao os unicos consumidores do Supabase.
- Conferir que nao existe chamada direta do browser para queries privilegiadas.
- Validar backup do banco.
- Validar logs e rotinas de error tracking.
- Manter uma copia das migration SQL versionadas em `sql/`.

## Evolucao futura

- Quando houver autenticao por usuario, migrar para policies por `auth.uid()`.
- Quando houver multiusuario real, revisar se o modelo de permissao precisa separar dados por conta.

