export function getBody(req) {
  if (typeof req?.body !== 'string') return req?.body || {};
  const raw = String(req.body || '').trim();
  if (!raw) return {};
  try {
    return JSON.parse(raw);
  } catch {
    return {};
  }
}

export function rowOrFirst(data) {
  if (Array.isArray(data)) return data[0] || null;
  return data || null;
}

export function isMissingTableError(error) {
  const code = String(error?.code || '');
  const message = String(error?.message || '').toLowerCase();
  return code === '42P01' || message.includes('does not exist') || message.includes('não existe');
}

export function normalizeDate(dateLike) {
  const s = String(dateLike || '').slice(0, 10);
  return /^\d{4}-\d{2}-\d{2}$/.test(s) ? s : null;
}
