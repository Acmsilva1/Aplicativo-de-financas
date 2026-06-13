/**
 * Lista de aplicacoes do Super App (usada pelo index.html).
 * Neste recorte, somente o financeiro permanece ativo.
 */
export const APPS = [
  {
    id: 'financeiro',
    icon: 'fa-wallet',
    status: 'active',
    title: 'Financeiro',
    description: 'Dashboard financeiro completo com despesas fixas, gastos variaveis e receitas.',
    category: 'Financeiro',
    health_path: '/api/financeiro?health=1',
  },
];

function json(res, status, data) {
  res.setHeader('Content-Type', 'application/json');
  res.status(status).end(JSON.stringify(data));
}

export default async function handler(req, res) {
  if (req.method !== 'GET') {
    res.setHeader('Allow', 'GET');
    return json(res, 405, { error: 'Method Not Allowed' });
  }
  return json(res, 200, APPS);
}
