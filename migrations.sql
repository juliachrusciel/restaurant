CREATE DATABASE restaurant_database;
\c restaurant_database;

CREATE TABLE foods(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  price MONEY,
  allergens BOOLEAN,
  allergen_type VARCHAR(255)
  );

CREATE TABLE parties(
  id SERIAL PRIMARY KEY,
  name_of_person_reserving_table VARCHAR(255),
  party_size INTEGER,
  table_number INTEGER,
  check_total MONEY,
  paid_question_mark BOOLEAN NOT NULL DEFAULT FALSE
  );

CREATE TABLE orders(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  food_id INTEGER,
  party_id INTEGER,
  order_id INTEGER,
  party_name VARCHAR(255),
  manager_id INTEGER,
  no_charge BOOLEAN DEFAULT false
  );

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR(255),
  password VARCHAR(255)
);
