CREATE DATABASE DBMS_proj1; 

-- Create Person table
CREATE TABLE Person ( p_id INT PRIMARY KEY, name VARCHAR(50), Contact_no VARCHAR(15));
SELECT * FROM Person;

-- Create Donor table
CREATE TABLE Donor ( donor_id INT PRIMARY KEY, p_id INT, email VARCHAR(50), blood_group VARCHAR(3), gender CHAR(1), name VARCHAR(50),
FOREIGN KEY (p_id) REFERENCES Person(p_id));
SELECT * FROM Donor;

-- Create Patient table
CREATE TABLE Patient ( patient_id INT PRIMARY KEY, p_id INT, email VARCHAR(50), blood_group VARCHAR(3), gender CHAR(1), name VARCHAR(50),
FOREIGN KEY (p_id) REFERENCES Person(p_id));
SELECT * FROM Patient;

-- Create Blood table
CREATE TABLE Blood ( blood_id INT PRIMARY KEY, blood_group VARCHAR(3), Blood_cells INT );
SELECT * FROM Blood;

-- Create Stock table
CREATE TABLE Stock ( stock_id INT PRIMARY KEY, blood_id INT, expiry_date DATE, blood_group VARCHAR(3),
FOREIGN KEY (blood_id) REFERENCES Blood(blood_id) );
SELECT * FROM Stock;

-- Create Blood_Bank table
CREATE TABLE Blood_Bank ( p_id int ,BloodBank_id INT PRIMARY KEY, orders INT, blood_group VARCHAR(3), location VARCHAR(100),
foreign key(p_id) references Person(p_id) );
SELECT * FROM Blood_Bank;

-- Create Hospital table
CREATE TABLE Hospital ( name VARCHAR(100) , Address VARCHAR(100), Contact_no VARCHAR(15), BloodBank_id int, Hospital_id int PRIMARY KEY,
FOREIGN KEY (BloodBank_id) REFERENCES Blood_Bank(BloodBank_id));
SELECT * FROM Hospital;

-- Create Manager table
CREATE TABLE Manager ( Emp_id INT PRIMARY KEY, BloodBank_id INT, name VARCHAR(50), Contact_no VARCHAR(15),
FOREIGN KEY (BloodBank_id) REFERENCES Blood_Bank(BloodBank_id));
SELECT * FROM Manager;

CREATE TABLE Usage_Record ( usage_id INT PRIMARY KEY, patient_id INT, blood_id INT, quantity_used DECIMAL, date DATE,
FOREIGN KEY (patient_id) REFERENCES Patient(patient_id));
SELECT*FROM Usage_record;

CREATE TABLE Donation_Record ( record_id INT PRIMARY KEY, donor_id INT, donation_date DATE, quantity_donated DECIMAL,
FOREIGN KEY (donor_id) REFERENCES Donor(donor_id) );
SELECT*FROM Donation_Record;

CREATE TABLE Blood_Test ( test_id INT PRIMARY KEY, blood_id INT, test_type VARCHAR(50), result VARCHAR(50), date DATE,
FOREIGN KEY (blood_id) REFERENCES Blood(blood_id) );
SELECT*FROM Blood_Test;

-- Values for the table:

-- Inserting data into Person table

INSERT INTO Person (p_id, name, Contact_no) VALUES
(1, 'John Doe', '1234567890'),
(2, 'Jane Smith', '9876543210'),
(3, 'Michael Johnson', '4567890123'),
(4, 'Emily Brown', '7890123456'),
(5, 'David Wilson', '3216549870'),
(6, 'Sarah Lee', '6543210987'),
(7, 'Christopher Martinez', '9012345678'),
(8, 'Amanda Taylor', '2345678901'),
(9, 'James Rodriguez', '5678901234'),
(10, 'Jennifer Garcia', '8901234567');

INSERT INTO Donor (donor_id, p_id, email, blood_group, gender, name) VALUES
(1, 1, 'john@example.com', 'O+', 'M', 'John Doe'),
(2, 2, 'jane@example.com', 'A-', 'F', 'Jane Smith'),
(3, 3, 'michael@example.com', 'B+', 'M', 'Michael Johnson'),
(4, 4, 'emily@example.com', 'AB+', 'F', 'Emily Brown'),
(5, 5, 'david@example.com', 'O-', 'M', 'David Wilson'),
(6, 6, 'sarah@example.com', 'A+', 'F', 'Sarah Lee'),
(7, 7, 'chris@example.com', 'B-', 'M', 'Christopher Martinez'),
(8, 8, 'amanda@example.com', 'AB-', 'F', 'Amanda Taylor'),
(9, 9, 'james@example.com', 'O+', 'M', 'James Rodriguez'),
(10, 10, 'jennifer@example.com', 'B+', 'F', 'Jennifer Garcia');

INSERT INTO Patient VALUES
(11, 1, 'patient1@example.com', 'O+', 'M', 'Patient 1'),
(12, 2, 'patient2@example.com', 'A-', 'F', 'Patient 2'),
(13, 3, 'patient3@example.com', 'B+', 'M', 'Patient 3'),
(14, 4, 'patient4@example.com', 'AB+', 'F', 'Patient 4'),
(15, 5, 'patient5@example.com', 'O-', 'M', 'Patient 5'),
(16, 6, 'patient6@example.com', 'A+', 'F', 'Patient 6'),
(17, 7, 'patient7@example.com', 'B-', 'M', 'Patient 7'),
(18, 8, 'patient8@example.com', 'AB-', 'F', 'Patient 8'),
(19, 9, 'patient9@example.com', 'O+', 'M', 'Patient 9'),
(20, 10, 'patient10@example.com', 'B+', 'F', 'Patient 10');

INSERT INTO Blood (blood_id, blood_group, Blood_cells) VALUES
(1, 'O+', 5000000),
(2, 'A-', 4000000),
(3, 'B+', 4500000),
(4, 'AB+', 5500000),
(5, 'O-', 5500000),
(6, 'A+', 4700000),
(7, 'B-', 4800000),
(8, 'AB-', 5800000),
(9, 'O+', 5100000),
(10, 'B+', 4600000);

INSERT INTO Stock (stock_id, blood_id, expiry_date, blood_group) VALUES
(1, 1, '2024-06-01', 'O+'),
(2, 2, '2024-07-15', 'A-'),
(3, 3, '2024-09-20', 'B+'),
(4, 4, '2024-08-10', 'AB+'),
(5, 5, '2024-06-30', 'O-'),
(6, 6, '2024-08-25', 'A+'),
(7, 7, '2024-07-05', 'B-'),
(8, 8, '2024-10-15', 'AB-'),
(9, 9, '2024-07-31', 'O+'),
(10, 10, '2024-09-05', 'B+');

INSERT INTO Blood_Bank (p_id, BloodBank_id, orders, blood_group, location) VALUES
(1, 1, 100, 'O+', 'Location 1'),
(2, 2, 80, 'A-', 'Location 2'),
(3, 3, 120, 'B+', 'Location 3'),
(4, 4, 90, 'AB+', 'Location 4'),
(5, 5, 110, 'O-', 'Location 5'),
(6, 6, 100, 'A+', 'Location 6'),
(7, 7, 85, 'B-', 'Location 7'),
(8, 8, 95, 'AB-', 'Location 8'),
(9, 9, 105, 'O+', 'Location 9'),
(10, 10, 115, 'B+', 'Location 10');

INSERT INTO Hospital (name, Address, Contact_no, BloodBank_id, Hospital_id) VALUES
('Hospital 1', 'Address 1', '1234567890', 1, 1),
('Hospital 2', 'Address 2', '2345678901', 2, 2),
('Hospital 3', 'Address 3', '3456789012', 3, 3),
('Hospital 4', 'Address 4', '4567890123', 4, 4),
('Hospital 5', 'Address 5', '5678901234', 5, 5),
('Hospital 6', 'Address 6', '6789012345', 6, 6),
('Hospital 7', 'Address 7', '7890123456', 7, 7),
('Hospital 8', 'Address 8', '8901234567', 8, 8),
('Hospital 9', 'Address 9', '9012345678', 9, 9),
('Hospital 10', 'Address 10', '0123456789', 10, 10);

INSERT INTO Manager (Emp_id, BloodBank_id, name, Contact_no) VALUES
(1, 1, 'Manager 1', '1234567890'),
(2, 2, 'Manager 2', '2345678901'),
(3, 3, 'Manager 3', '3456789012'),
(4, 4, 'Manager 4', '4567890123'),
(5, 5, 'Manager 5', '5678901234'),
(6, 6, 'Manager 6', '6789012345'),
(7, 7, 'Manager 7', '7890123456'),
(8, 8, 'Manager 8', '8901234567'),
(9, 9, 'Manager 9', '9012345678'),
(10, 10, 'Manager 10', '0123456789');

INSERT INTO Usage_Record VALUES
(1, 11, 1, 2.5, '2024-03-10'),
(2, 12, 2, 3.0, '2024-03-12'),
(3, 13, 3, 1.5, '2024-03-15'),
(4, 14, 4, 2.0, '2024-03-17'),
(5, 15, 5, 2.5, '2024-03-20'),
(6, 16, 6, 3.0, '2024-03-22'),
(7, 17, 7, 1.0, '2024-03-25'),
(8, 18, 8, 2.0, '2024-03-27'),
(9, 19, 9, 2.5, '2024-03-30'),
(10, 20, 10, 1.5, '2024-04-01');

INSERT INTO Donation_Record (record_id, donor_id, donation_date, quantity_donated) VALUES
(1, 1, '2024-02-05', 3.0),
(2, 2, '2024-02-07', 2.5),
(3, 3, '2024-02-10', 2.0),
(4, 4, '2024-02-12', 2.5),
(5, 5, '2024-02-15', 3.0),
(6, 6, '2024-02-17', 1.5),
(7, 7, '2024-02-20', 2.0),
(8, 8, '2024-02-22', 2.5),
(9, 9, '2024-02-25', 2.0),
(10, 10, '2024-02-27', 1.5);

INSERT INTO Blood_Test (test_id, blood_id, test_type, result, date) VALUES
(1, 1, 'Hematocrit', 'Normal', '2024-03-05'),
(2, 2, 'RBC Count', 'Low', '2024-03-07'),
(3, 3, 'Hemoglobin', 'Normal', '2024-03-10'),
(4, 4, 'Platelet Count', 'High', '2024-03-12'),
(5, 5, 'White Blood Cells', 'Normal', '2024-03-15'),
(6, 6, 'Blood Type', 'A+', '2024-03-17'),
(7, 7, 'Iron Levels', 'Low', '2024-03-20'),
(8, 8, 'Blood Glucose', 'Normal', '2024-03-22'),
(9, 9, 'Blood Urea Nitrogen', 'Normal', '2024-03-25'),
(10, 10, 'Coagulation Time', 'Extended', '2024-03-27');