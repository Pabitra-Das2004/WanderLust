const fs = require('fs');
const path = require('path');
const db = require('./config/db');

const schemaPath = path.resolve(__dirname, '..', 'schema.sql');

async function migrate() {
  try {
    const schema = fs.readFileSync(schemaPath, 'utf8');
    await db.query('DROP SCHEMA public CASCADE; CREATE SCHEMA public;');
    await db.query(schema);
    console.log('Migration successful');
    process.exit(0);
  } catch (error) {
    console.error('Migration failed:', error);
    process.exit(1);
  }
}

migrate();
