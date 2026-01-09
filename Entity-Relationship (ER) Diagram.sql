CREATE DATABASE IF NOT EXISTS car_dealership;
USE car_dealership;
CREATE TABLE cars (
  car_id INT AUTO_INCREMENT PRIMARY KEY,         
  vin VARCHAR(17) NOT NULL UNIQUE,                
  manufacturer VARCHAR(50) NOT NULL,
  model VARCHAR(50) NOT NULL,
  year YEAR NOT NULL,
  color VARCHAR(30) NOT NULL
) ENGINE=InnoDB;
CREATE TABLE customers (
  customer_pk INT AUTO_INCREMENT PRIMARY KEY,     
  customer_id VARCHAR(20),                     
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  phone VARCHAR(20),
  email VARCHAR(100),
  address VARCHAR(100),
  city VARCHAR(50),
  state_province VARCHAR(50),
  country VARCHAR(50),
  postal_code VARCHAR(20),
  UNIQUE (email)                                  
) ENGINE=InnoDB;
CREATE TABLE salespersons (
  salesperson_pk INT AUTO_INCREMENT PRIMARY KEY, 
  staff_id VARCHAR(20) NOT NULL UNIQUE,           
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  store VARCHAR(100) NOT NULL                     
) ENGINE=InnoDB;


CREATE TABLE invoices (
  invoice_id INT AUTO_INCREMENT PRIMARY KEY,     
  invoice_no VARCHAR(20) NOT NULL UNIQUE,        
  invoice_date DATE NOT NULL,

  car_id INT NOT NULL,
  customer_pk INT NOT NULL,
  salesperson_pk INT NOT NULL,

  
  UNIQUE (car_id),

  CONSTRAINT fk_invoices_car
    FOREIGN KEY (car_id) REFERENCES cars(car_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

  CONSTRAINT fk_invoices_customer
    FOREIGN KEY (customer_pk) REFERENCES customers(customer_pk)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

  CONSTRAINT fk_invoices_salesperson
    FOREIGN KEY (salesperson_pk) REFERENCES salespersons(salesperson_pk)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;


CREATE DATABASE IF NOT EXISTS lab_mysql;
USE lab_mysql;

DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS cars;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS salespersons;


CREATE TABLE cars (
  id INT AUTO_INCREMENT PRIMARY KEY,
  vin VARCHAR(17) NOT NULL,
  manufacturer VARCHAR(50) NOT NULL,
  model VARCHAR(50) NOT NULL,
  year YEAR NOT NULL,
  color VARCHAR(30) NOT NULL,
  UNIQUE (vin)
) ENGINE=InnoDB;


CREATE TABLE customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cust_id INT NOT NULL,
  cust_name VARCHAR(100) NOT NULL,
  cust_phone VARCHAR(30),
  cust_email VARCHAR(100),
  cust_address VARCHAR(120),
  cust_city VARCHAR(60),
  cust_state VARCHAR(60),
  cust_country VARCHAR(60),
  cust_zipcode VARCHAR(20),
  UNIQUE (cust_id)
) ENGINE=InnoDB;


CREATE TABLE salespersons (
  id INT AUTO_INCREMENT PRIMARY KEY,
  staff_id VARCHAR(10) NOT NULL,
  name VARCHAR(100) NOT NULL,
  store VARCHAR(80) NOT NULL,
  UNIQUE (staff_id)
) ENGINE=InnoDB;


CREATE TABLE invoices (
  id INT AUTO_INCREMENT PRIMARY KEY,
  invoice_number VARCHAR(20) NOT NULL,
  date DATE NOT NULL,
  car INT NOT NULL,
  customer INT NOT NULL,
  salesperson INT NOT NULL,

  UNIQUE (invoice_number),
  UNIQUE (car), 
  CONSTRAINT fk_invoices_car
    FOREIGN KEY (car) REFERENCES cars(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

  CONSTRAINT fk_invoices_customer
    FOREIGN KEY (customer) REFERENCES customers(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

  CONSTRAINT fk_invoices_salesperson
    FOREIGN KEY (salesperson) REFERENCES salespersons(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;


USE lab_mysql;


INSERT INTO cars (id, vin, manufacturer, model, year, color)
VALUES
(1, '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
(2, 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
(3, 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
(4, 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'),
(5, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray');

INSERT INTO customers
(id, cust_id, cust_name, cust_phone, cust_email, cust_address, cust_city, cust_state, cust_country, cust_zipcode)
VALUES
(1, 10001, 'Pablo Picasso', '+34 636 17 63 82', NULL, 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045'),
(2, 20001, 'Abraham Lincoln', '+1 305 907 7086', NULL, '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130'),
(3, 30001, 'Napoléon Bonaparte', '+33 1 79 75 40 00', NULL, '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');


INSERT INTO salespersons (id, staff_id, name, store)
VALUES
(1, '00001', 'Petey Cruiser', 'Madrid'),
(2, '00002', 'Anna Sthesia', 'Barcelona'),
(3, '00003', 'Paul Molive', 'Berlin'),
(4, '00004', 'Gail Forcewind', 'Paris'),
(5, '00005', 'Paige Turner', 'Mimia'),
(6, '00006', 'Bob Frapples', 'Mexico City'),
(7, '00007', 'Walter Melon', 'Amsterdam'),
(8, '00008', 'Shonda Leer', 'São Paulo');

                         
INSERT INTO invoices (id, invoice_number, date, car, customer, salesperson)
VALUES
(1, '852399038', '2018-08-22', 1, 1, 3),
(2, '731166526', '2018-12-31', 3, 3, 5),
(3, '271135104', '2019-01-22', 2, 2, 7);


USE lab_mysql;

SET SQL_SAFE_UPDATES = 0;

UPDATE customers
SET cust_email = 'ppicasso@gmail.com'
WHERE cust_name = 'Pablo Picasso';

UPDATE customers
SET cust_email = 'lincoln@us.gov'
WHERE cust_name = 'Abraham Lincoln';

UPDATE customers
SET cust_email = 'hello@napoleon.me'
WHERE cust_name = 'Napoléon Bonaparte';

SET SQL_SAFE_UPDATES = 1;

USE lab_mysql;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM cars
WHERE id = 4;

SET SQL_SAFE_UPDATES = 1;
