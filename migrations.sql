CREATE DATABASE restaurant_database;
\c restaurant_database;

CREATE TABLE foods(id SERIAL PRIMARY KEY, name VARCHAR(255), price INTEGER, allergens BOOLEAN);

CREATE TABLE parties(id SERIAL PRIMARY KEY, table_number INTEGER, check_total INTEGER, paid BOOLEAN);

CREATE TABLE orders(id SERIAL PRIMARY KEY, party_name VARCHAR(255));
