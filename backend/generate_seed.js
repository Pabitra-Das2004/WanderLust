const { faker } = require('@faker-js/faker');
const fs = require('fs');

let sql = '';

function esc(str) {
  return str.replace(/'/g, "''");
}

function seed() {
  console.log('Generating SQL dump...');

  // TRUNCATE
  sql += `
TRUNCATE TABLE users, services, flights, trains, hotels, packages, bookings, payments RESTART IDENTITY CASCADE;
`;

  const roles = ['customer', 'creator'];
  const users = [];

  // Admin
  sql += `
INSERT INTO users (name, email, password, role)
VALUES ('Admin User', 'admin@example.com', 'password', 'admin');
`;
  users.push({ id: 1, role: 'admin' });

  let userId = 2;

  // Users
  for (let i = 0; i < 20; i++) {
    const role = faker.helpers.arrayElement(roles);
    const name = esc(faker.person.fullName());
    const email = esc(faker.internet.email());

    sql += `
INSERT INTO users (name, email, password, role)
VALUES ('${name}', '${email}', 'password', '${role}');
`;

    users.push({ id: userId++, role });
  }

  const creators = users.filter(u => u.role === 'creator');
  const customers = users.filter(u => u.role === 'customer');

  const serviceTypes = ['hotel', 'flight', 'package', 'train'];
  const services = [];

  let serviceId = 1;

  // Services
  for (let i = 0; i < 50; i++) {
    const type = faker.helpers.arrayElement(serviceTypes);
    const creator = faker.helpers.arrayElement(creators);

    let title, description, image;

    if (type === 'hotel') {
      title = esc(faker.company.name() + ' Hotel');
      description = esc(faker.lorem.paragraph());
      image = faker.image.url({ category: 'hotel' });
    } else if (type === 'flight') {
      title = esc(faker.company.name() + ' Airlines');
      description = esc(faker.lorem.paragraph());
      image = faker.image.url({ category: 'transport' });
    } else if (type === 'train') {
      title = esc(faker.company.name() + ' Express');
      description = esc(faker.lorem.paragraph());
      image = faker.image.url({ category: 'transport' });
    } else {
      title = esc(faker.location.city() + ' Adventure Package');
      description = esc(faker.lorem.paragraph());
      image = faker.image.url({ category: 'nature' });
    }

    const price = faker.number.float({ min: 50, max: 2000, precision: 0.01 });

    sql += `
INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (${serviceId}, '${title}', '${type}', ${creator.id}, ${price}, '${description}', '${image}');
`;

    // Type specific
    if (type === 'hotel' || type === 'package') {
      const location = esc(faker.location.city() + ', ' + faker.location.country());
      const start = faker.date.future().toISOString();
      const end = faker.date.future().toISOString();
      const table = type === 'hotel' ? 'hotels' : 'packages';

      sql += `
INSERT INTO ${table} (service_id, location, start_date, end_date)
VALUES (${serviceId}, '${location}', '${start}', '${end}');
`;
    } else {
      const from = esc(faker.location.city());
      const to = esc(faker.location.city());
      const date = faker.date.future().toISOString();
      const table = type === 'flight' ? 'flights' : 'trains';

      sql += `
INSERT INTO ${table} (service_id, from_place, to_place, travel_date)
VALUES (${serviceId}, '${from}', '${to}', '${date}');
`;
    }

    services.push({ id: serviceId, price });
    serviceId++;
  }

  let bookingId = 1;

  // Bookings
  const statuses = ['PENDING', 'CONFIRMED', 'CANCELLED'];

  for (let i = 0; i < 100; i++) {
    const customer = faker.helpers.arrayElement(customers);
    const service = faker.helpers.arrayElement(services);

    const travelers = faker.number.int({ min: 1, max: 5 });
    const total = service.price * travelers;
    const status = faker.helpers.arrayElement(statuses);
    const date = faker.date.past().toISOString();

    sql += `
INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (${bookingId}, ${customer.id}, ${service.id}, '${date}', ${travelers}, ${total}, '${status}');
`;

    if (status === 'CONFIRMED') {
      const paymentId = 'pay_' + faker.string.alphanumeric(14);

      sql += `
INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (${bookingId}, '${paymentId}', ${total}, 'SUCCESS');
`;
    }

    bookingId++;
  }

  // Write file
  fs.writeFileSync('dummy_data.sql', sql);

  console.log('✅ SQL dump generated: dummy_data.sql');
}

seed();