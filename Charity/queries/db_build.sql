----Data base biuld up

-- Table Holiday

CREATE TABLE holiday (
  id INT IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  year  SMALLINT NOT NULL,
);
-- // Updating holiday's year every new year
UPDATE holiday
SET year = 2022;

--// Payment status table

CREATE TABLE payment_status (
  id INT IDENTITY(1,1) PRIMARY KEY,
  status VARCHAR(255) NOT NULL,
  amount DECIMAL(10,2) NOT NULL DEFAULT 0.00
);

-- Role table

CREATE TABLE role (
  id INT IDENTITY(1,1) PRIMARY KEY,
  type VARCHAR(255) NOT NULL
);

-- // Role data
insert role ([type])
values('Member'),
('Representative'),
('Board');

--// Table donation

CREATE TABLE donation (
  id INT IDENTITY(1,1) PRIMARY KEY,
  type VARCHAR(255) NOT NULL
);

--// Donor table

CREATE TABLE donor (
  id INT IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NULL,
  holiday_id INT NOT NULL,
  paid_status INT NOT NULL,
  role_id INT not null,
  FOREIGN KEY (holiday_id) REFERENCES holiday(id),
  FOREIGN KEY (paid_status) REFERENCES payment_status(id),
FOREIGN KEY (role_id) REFERENCES role(id)
);
-- Donation table
CREATE TABLE donation (
  id INT PRIMARY KEY,
  type VARCHAR(10),
  amount DECIMAL(10, 2),
  notes VARCHAR(255));

INSERT INTO donation (id, type, amount, notes) VALUES (1, 'cash', NULL, 'Passed away / disqualified');
INSERT INTO donation (id, type, amount, notes) VALUES (2, 'property', 50000.00, 'Property donated.');
INSERT INTO donation (id, type, amount, notes) VALUES (3, 'both', 10000.00, 'Cash and property donated.');
INSERT INTO donation (id, type, amount, notes) VALUES (4, 'nothing', NULL, 'No donation made.');

--// Recipient type
CREATE TABLE type (
  id INT IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(255) NOT NULL);

--// Type data
INSERT INTO type (name)
values('Single'), ('Family');

--// Recipient's table

CREATE TABLE recipient (
  id INT IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  donation_id INT NULL,
  type_id INT NOT NULL,
  FOREIGN KEY (donation_id) REFERENCES donation(id),
FOREIGN KEY (type_id) REFERENCES type(id)
);