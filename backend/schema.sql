CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  password TEXT,
  role VARCHAR(20) CHECK (role IN ('customer','creator','admin')) DEFAULT 'customer',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS services (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  type VARCHAR(20) CHECK (type IN ('hotel','flight','package','train')),
  creator_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  price NUMERIC,
  description TEXT,
  image TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS flights (
  id SERIAL PRIMARY KEY,
  service_id INTEGER REFERENCES services(id) ON DELETE CASCADE,
  from_place VARCHAR(100),
  to_place VARCHAR(100),
  travel_date DATE
);

CREATE TABLE IF NOT EXISTS trains (
  id SERIAL PRIMARY KEY,
  service_id INTEGER REFERENCES services(id) ON DELETE CASCADE,
  from_place VARCHAR(100),
  to_place VARCHAR(100),
  travel_date DATE
);

CREATE TABLE IF NOT EXISTS hotels (
  id SERIAL PRIMARY KEY,
  service_id INTEGER REFERENCES services(id) ON DELETE CASCADE,
  location VARCHAR(100),
  start_date DATE,
  end_date DATE
);

CREATE TABLE IF NOT EXISTS packages (
  id SERIAL PRIMARY KEY,
  service_id INTEGER REFERENCES services(id) ON DELETE CASCADE,
  location VARCHAR(100),
  start_date DATE,
  end_date DATE
);

CREATE TABLE IF NOT EXISTS bookings (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  service_id INTEGER REFERENCES services(id) ON DELETE CASCADE,
  booking_date DATE,
  start_date DATE,
  end_date DATE,
  from_place VARCHAR(100),
  to_place VARCHAR(100),
  travel_date DATE,
  travelers INTEGER,
  total_price NUMERIC,
  status VARCHAR(20),
  razorpay_order_id VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS payments (
  id SERIAL PRIMARY KEY,
  booking_id INTEGER REFERENCES bookings(id) ON DELETE CASCADE,
  payment_id VARCHAR(255),
  amount NUMERIC,
  status VARCHAR(20)
);
