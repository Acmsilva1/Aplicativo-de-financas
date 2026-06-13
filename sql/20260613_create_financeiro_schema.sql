-- Schema inicial do modo financeiro
-- Execute este arquivo no Supabase novo para criar as tabelas usadas pela aplicacao.

create table if not exists public.tb_financas (
  id bigserial primary key,
  created_at timestamptz not null default now(),
  descricao text not null,
  valor numeric(12,2) not null default 0,
  tipo text not null default 'despesa',
  tipo_gasto text,
  categoria text,
  metodo_pagamento text,
  data_lancamento date not null default current_date,
  constraint tb_financas_tipo_check check (tipo in ('despesa', 'receita'))
);

create index if not exists idx_tb_financas_created_at on public.tb_financas (created_at desc);
create index if not exists idx_tb_financas_data_lancamento on public.tb_financas (data_lancamento desc);
create index if not exists idx_tb_financas_tipo on public.tb_financas (tipo);
create index if not exists idx_tb_financas_categoria on public.tb_financas (categoria);

create table if not exists public.tb_despesas_fixas (
  id bigserial primary key,
  created_at timestamptz not null default now(),
  descricao text not null,
  valor numeric(12,2) not null default 0,
  status text not null default 'pendente',
  conta_fixa boolean not null default false,
  parcela_atual integer,
  parcela_total integer,
  constraint tb_despesas_fixas_status_check check (status in ('pago', 'pendente')),
  constraint tb_despesas_fixas_parcelas_check check (
    parcela_atual is null
    or parcela_total is null
    or (parcela_atual >= 1 and parcela_total >= 1 and parcela_atual <= parcela_total)
  )
);

create index if not exists idx_tb_despesas_fixas_created_at on public.tb_despesas_fixas (created_at desc);
create index if not exists idx_tb_despesas_fixas_status on public.tb_despesas_fixas (status);
create index if not exists idx_tb_despesas_fixas_conta_fixa on public.tb_despesas_fixas (conta_fixa);
create index if not exists idx_tb_despesas_fixas_parcelas on public.tb_despesas_fixas (parcela_total, parcela_atual);

create table if not exists public.tb_poupanca (
  id bigserial primary key,
  created_at timestamptz not null default now(),
  descricao text not null,
  valor numeric(12,2) not null default 0,
  data_lancamento date not null default current_date
);

create index if not exists idx_tb_poupanca_data_lancamento on public.tb_poupanca (data_lancamento desc);
create index if not exists idx_tb_poupanca_created_at on public.tb_poupanca (created_at desc);

create table if not exists public.tb_poupanca_metas (
  id bigserial primary key,
  created_at timestamptz not null default now(),
  nome_meta text not null,
  valor_meta numeric(12,2) not null,
  data_inicio date not null default current_date,
  ativa boolean not null default true
);

create index if not exists idx_tb_poupanca_metas_ativa on public.tb_poupanca_metas (ativa);
create index if not exists idx_tb_poupanca_metas_created_at on public.tb_poupanca_metas (created_at desc);
create unique index if not exists uq_tb_poupanca_metas_ativa_true on public.tb_poupanca_metas ((ativa)) where ativa = true;
