-- Docker runs this file already inside 'authdb' database
-- DO NOT add CREATE DATABASE or \c here — that breaks Docker initdb

CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Test user: email = test@example.com, password = password123
INSERT INTO users (name, email, password)
VALUES (
  'Test User',
  'test@example.com',
  '$2b$10$YqfPv8Uurm1S/xX1q4KXIOV6ooUJYOKNZnXjej/dXBROmS2NXCacW'
) ON CONFLICT (email) DO NOTHING;
