/**
 * Roadmap do Super App (usado pelo index.html).
 * Reflete o estado atual do ecossistema com foco no financeiro.
 */
const ROADMAP = [
  {
    step: '1',
    title: 'Financeiro blindado',
    description: 'O modulo financeiro permanece como unico fluxo ativo do backend.',
  },
  {
    step: '2',
    title: 'Base isolada',
    description: 'A camada de dados fica pronta para o novo banco sem carregar modulos removidos.',
  },
  {
    step: '3',
    title: 'Superficie reduzida',
    description: 'Endpoints e catalogo ficam concentrados no que o financeiro realmente usa.',
  },
  {
    step: '4',
    title: 'Evolucao futura',
    description: 'A partir daqui, qualquer novo modulo pode nascer sem contaminar o financeiro.',
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
  return json(res, 200, ROADMAP);
}
