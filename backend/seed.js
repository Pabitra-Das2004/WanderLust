const { faker } = require('@faker-js/faker');
const fs = require('fs');
const db = require('./config/db');

async function seed() {
  try {
    console.log('Seeding started...');

    // Ensure schema exists before seeding.
    const schema = fs.readFileSync('./schema.sql', 'utf8');
    await db.query(schema);

    // Clear existing data
    await db.query('TRUNCATE TABLE users, services, flights, trains, hotels, packages, bookings, payments RESTART IDENTITY CASCADE');

    // Seed Users
    const roles = ['customer', 'creator', 'admin'];
    const users = [];

    // Force one admin for testing
    const { rows: adminRows } = await db.query(
      "INSERT INTO users (name, email, password, role) VALUES ($1, $2, $3, $4) RETURNING id",
      ['Admin User', 'admin@example.com', 'password', 'admin']
    );
    users.push({ id: adminRows[0].id, role: 'admin' });

    for (let i = 0; i < 20; i++) {
      const role = faker.helpers.arrayElement(['customer', 'creator']);
      const { rows } = await db.query(
        "INSERT INTO users (name, email, password, role) VALUES ($1, $2, $3, $4) RETURNING id",
        [faker.person.fullName(), faker.internet.email(), 'password', role]
      );
      users.push({ id: rows[0].id, role });
    }

    const creators = users.filter(u => u.role === 'creator');
    const customers = users.filter(u => u.role === 'customer');

    // Seed Services
    const serviceTypes = ['hotel', 'flight', 'package', 'train'];
    const services = [];

    for (let i = 0; i < 50; i++) {
      const type = faker.helpers.arrayElement(serviceTypes);
      const creator = faker.helpers.arrayElement(creators);
      
      let title, description, image;
      if (type === 'hotel') {
        title = faker.company.name() + ' Hotel';
        description = faker.lorem.paragraph();
        image = faker.image.url({ category: 'hotel' });
      } else if (type === 'flight') {
        title = faker.company.name() + ' Airlines';
        description = faker.lorem.paragraph();
        image = faker.image.url({ category: 'transport' });
      } else if (type === 'train') {
        title = faker.company.name() + ' Express';
        description = faker.lorem.paragraph();
        image = faker.image.url({ category: 'transport' });
      } else {
        title = faker.location.city() + ' Adventure Package';
        description = faker.lorem.paragraph();
        image = faker.image.url({ category: 'nature' });
      }

      const price = faker.number.float({ min: 50, max: 2000, precision: 0.01 });

      const { rows } = await db.query(
        "INSERT INTO services (title, type, creator_id, price, description, image) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id",
        [title, type, creator.id, price, description, image]
      );
      const serviceId = rows[0].id;
      services.push({ id: serviceId, type, price });

      // Seed Type-Specific Data
      if (type === 'hotel' || type === 'package') {
        const location = faker.location.city() + ', ' + faker.location.country();
        const startDate = faker.date.future();
        const endDate = faker.date.future({ refDate: startDate });
        const table = type === 'hotel' ? 'hotels' : 'packages';
        await db.query(
          `INSERT INTO ${table} (service_id, location, start_date, end_date) VALUES ($1, $2, $3, $4)`,
          [serviceId, location, startDate, endDate]
        );
      } else if (type === 'flight' || type === 'train') {
        const from_place = faker.location.city();
        const to_place = faker.location.city();
        const travel_date = faker.date.future();
        const table = type === 'flight' ? 'flights' : 'trains';
        await db.query(
          `INSERT INTO ${table} (service_id, from_place, to_place, travel_date) VALUES ($1, $2, $3, $4)`,
          [serviceId, from_place, to_place, travel_date]
        );
      }
    }

    // Seed Bookings
    const statuses = ['PENDING', 'CONFIRMED', 'CANCELLED'];
    for (let i = 0; i < 100; i++) {
      const customer = faker.helpers.arrayElement(customers);
      const service = faker.helpers.arrayElement(services);
      const travelers = faker.number.int({ min: 1, max: 5 });
      const total_price = service.price * travelers;
      const status = faker.helpers.arrayElement(statuses);
      const date = faker.date.between({ from: '2023-01-01', to: '2025-12-31' });

      const { rows: bookingRows } = await db.query(
        "INSERT INTO bookings (user_id, service_id, booking_date, travelers, total_price, status) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id",
        [customer.id, service.id, date, travelers, total_price, status]
      );

      if (status === 'CONFIRMED') {
        await db.query(
          "INSERT INTO payments (booking_id, payment_id, amount, status) VALUES ($1, $2, $3, $4)",
          [bookingRows[0].id, 'pay_' + faker.string.alphanumeric(14), total_price, 'SUCCESS']
        );
      }
    }

    console.log('Seeding completed successfully!');
    process.exit(0);
  } catch (error) {
    console.error('Seeding error:', error);
    process.exit(1);
  }
}

seed();
