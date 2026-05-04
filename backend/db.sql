-- Run this in PostgreSQL to set up the database

CREATE DATABASE authdb;

\c authdb;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Optional: insert a test user (password = "password123")
-- bcrypt hash for "password123"
INSERT INTO users (name, email, password)
VALUES (
  'Test User',
  'test@example.com',
  '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy'
);
