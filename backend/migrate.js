const fs = require('fs');
const db = require('./config/db');

async function migrate() {
  try {
    const schema = fs.readFileSync('./schema.sql', 'utf8');
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
