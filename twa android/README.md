# TWA Android

Pasta reservada para a versao Android baseada em Trusted Web Activity.

## Objetivo

Publicar um app Android que abre a PWA hospedada na Vercel como uma experiencia em tela cheia, mantendo o frontend e o backend web como fonte principal do produto.

## Status atual

- A web continua rodando em `https://aplicativo-de-financas.vercel.app/`
- Esta pasta ainda nao contem o projeto Android final
- O app Android deve apontar para o dominio oficial

## O que esta estrutura precisa no futuro

- projeto Android base em `twa-app/`
- `assetlinks.json` publicado no dominio
- assinatura e build em `.aab`
- testes em device real e no Play Console, se um dia for distribuido pela loja

## Arquivos util

- `assetlinks.json.example`
- `build-notes.md`
- `release-checklist.md`

## Fluxo recomendado

1. Validar a PWA em producao.
2. Gerar o wrapper TWA.
3. Configurar o link entre dominio e app.
4. Testar instalacao e abertura em tela cheia.
5. Gerar o pacote Android final.
