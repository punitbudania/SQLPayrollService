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

UC_5
SELECT salary FROM employee_payroll WHERE name = "Bill";
SELECT * FROM employee_payroll WHERE start BETWEEN CAST('2018-01-01' AS DATE) AND DATE(NOW());

UC_6
ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name;
UPDATE employee_payroll set gender = "M" where name = "Bill" or name = "Mark";

UC_7
SELECT SUM(salary) FROM employee_payroll WHERE gender = "M" GROUP BY gender;

UC_8
ALTER TABLE employee_payroll ADD phone_number VARCHAR(250) AFTER name;
ALTER TABLE employee_payroll ADD address VARCHAR(250) AFTER phone_number;
ALTER TABLE employee_payroll ADD department VARCHAR(250) AFTER address;
ALTER TABLE employee_payroll ALTER address SET DEFAULT 'TBD';

UC_9
ALTER TABLE employee_payroll RENAME COLUMN salary TO basic_pay;
ALTER TABLE employee_payroll ADD deductions DOUBLE NOT NULL AFTER basic_pay;
ALTER TABLE employee_payroll ADD taxable_pay DOUBLE NOT NULL AFTER deductions;
ALTER TABLE employee_payroll ADD income_tax DOUBLE NOT NULL AFTER taxable_pay;
ALTER TABLE employee_payroll ADD net_pay DOUBLE NOT NULL AFTER income_tax;

UC_10
INSERT INTO employee_payroll (id, name, phone_number, address, department, gender, basic_pay, deductions, taxable_pay, tax, net_pay, start)
VALUES (4, 'Terisa', NULL, 'TBD', 'Marketing', 'F', 3000000.0, 1000000.0, 2000000.0, 500000.0, 1500000.0, '2018-01-03');

UC_11
CREATE TABLE company
(
 company_id INT NOT NULL AUTO_INCREMENT,
 company_name VARCHAR(150),
 PRIMARY KEY(company_id)
);
CREATE TABLE department
( 
 department_id INT NOT NULL AUTO_INCREMENT,
 department_name VARCHAR(150),
 PRIMARY KEY(department_id)
);
CREATE TABLE payroll
(
 employee_id INT unsigned NOT NULL AUTO_INCREMENT,
 basic_pay INT,
 deductions INT,
 taxable_pay INT,
 tax INT,
 net_pay INT,
 FOREIGN KEY(employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE
);
CREATE TABLE employee_department
(
 department_id INT NOT NULL,
 employee_id INT unsigned NOT NULL,
 FOREIGN KEY(department_id) REFERENCES department(department_id) ON DELETE CASCADE,
 FOREIGN KEY(employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE
);
ALTER TABLE employee ADD FOREIGN KEY (company_id) REFERENCES company(company_id) ON DELETE CASCADE;
