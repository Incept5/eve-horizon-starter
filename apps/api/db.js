import pg from 'pg';

const DATABASE_URL =
  process.env.DATABASE_URL || 'postgres://app:app@localhost:5432/eve_starter';

const parsed = new URL(DATABASE_URL);
const sslmode = parsed.searchParams.get('sslmode');

// Derive SSL config from the sslmode param in the connection URL.
// Eve's managed DB reconciler sets sslmode=require for cloud DBs
// and sslmode=disable for local/k3d. Strip sslmode from the URL
// because pg handles TLS via the ssl option, not the query param.
parsed.searchParams.delete('sslmode');

const ssl = sslmode === 'require'
  ? { rejectUnauthorized: false }
  : false;

const pool = new pg.Pool({
  connectionString: parsed.toString(),
  ssl,
});

const query = (text, params) => pool.query(text, params);
const close = () => pool.end();

export { pool, query, close };
