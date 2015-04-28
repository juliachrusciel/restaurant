CREATE DATABASE restaurant_database;
\c restaurant_database;

CREATE TABLE foods(id SERIAL PRIMARY KEY, name VARCHAR(255), price MONEY, allergens BOOLEAN, allergen_type VARCHAR(255));

CREATE TABLE parties(id SERIAL PRIMARY KEY, table_number INTEGER, check_total MONEY, paid BOOLEAN NOT NULL DEFAULT FALSE);

CREATE TABLE orders(id SERIAL PRIMARY KEY, name VARCHAR(255), food_id INTEGER, party_id INTEGER, order_id INTEGER, party_name VARCHAR(255), manager_id INTEGER );
