UC_1
CREATE DATABASE payroll_service_db;
SHOW DATABASES;
USE payroll_service_db;

UC_2
CREATE TABLE employee_payroll
(
 id INT unsigned NOT NULL AUTO_INCREMENT,
 name VARCHAR(150) NOT NULL,
 salary DOUBLE NOT NULL,
 start DATE NOT NULL,
 PRIMARY KEY (id)
);

UC_3
INSERT INTO employee_payroll (name, salary, start) VALUES
('Bill', 1000000.0, '2018-01-03'),
('Terisa', 2000000.0, '2019-11-13'),
('Mark', 3000000.0, '2020-05-21');

UC_4
SELECT * FROM employee_payroll;