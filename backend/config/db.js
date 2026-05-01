const { Pool } = require('pg');
const dotenv = require('dotenv');

dotenv.config();

const poolConfig = {
  connectionString: process.env.DATABASE_URL || 'postgresql://postgres:pabitra@localhost:5432/wanderlust',
};

const useSsl = process.env.DB_SSL === 'true' || process.env.NODE_ENV === 'production';
if (process.env.DATABASE_URL && useSsl) {
  poolConfig.ssl = { rejectUnauthorized: false };
}

const pool = new Pool(poolConfig);

module.exports = pool;