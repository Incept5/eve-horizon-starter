import pg from 'pg';

const DATABASE_URL =
  process.env.DATABASE_URL || 'postgres://app:app@localhost:5432/eve_starter';

const parsed = new URL(DATABASE_URL);
const isLocal = ['localhost', '127.0.0.1'].includes(parsed.hostname);

// Strip sslmode from URL for non-local — we handle SSL via the driver option
if (!isLocal) {
  parsed.searchParams.delete('sslmode');
}

const pool = new pg.Pool({
  connectionString: parsed.toString(),
  ssl: isLocal ? false : { rejectUnauthorized: false },
});

const query = (text, params) => pool.query(text, params);
const close = () => pool.end();

export { pool, query, close };
