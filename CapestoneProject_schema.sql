-- First drop the database and recreate it
USE master;
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'sa')
    BEGIN
        ALTER DATABASE sa SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
        DROP DATABASE sa;
    END
CREATE DATABASE sa;
GO

-- Switch to the sa database
USE sa;
GO

-- Create roles table
CREATE TABLE roles (
                       role_id INT IDENTITY(1,1) PRIMARY KEY,
                       role_name VARCHAR(50)
);
GO

-- Create User table
CREATE TABLE users (
                       user_id INT IDENTITY(1,1) PRIMARY KEY,
                       username VARCHAR(50) NOT NULL UNIQUE,
                       password_hash VARCHAR(255) NOT NULL,
                       role_id INT NOT NULL,
                       created_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
                       last_login DATETIME2,
                       is_login BIT,
                       CONSTRAINT fk_users_role FOREIGN KEY (role_id) REFERENCES roles(role_id)
);
GO

-- Create user Details table
CREATE TABLE user_details (
                              userDetail_id INT IDENTITY(1,1) PRIMARY KEY,
                              user_id INT UNIQUE,
                              first_name VARCHAR(50),
                              last_name VARCHAR(50),
                              date_of_birth DATE,
                              gender VARCHAR(10),
                              phone_number VARCHAR(20),
                              email VARCHAR(100),
                              created_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
                              CONSTRAINT fk_user_details_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);
GO

-- Create doctors table
CREATE TABLE doctors (
                         doctor_id INT IDENTITY(1,1) PRIMARY KEY,
                         user_id INT NOT NULL UNIQUE,
                         specialization VARCHAR(100),
                         license_number VARCHAR(50),
                         experience FLOAT,
                         degree VARCHAR(50),
                         is_active BIT,
                         created_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
                         CONSTRAINT fk_doctors_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);
GO

-- Create patients table
CREATE TABLE patients (
                          patient_id INT IDENTITY(1,1) PRIMARY KEY,
                          user_id INT NOT NULL UNIQUE,
                          blood_grp VARCHAR(5),
                          created_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
                          CONSTRAINT fk_patients_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);
GO

-- Create schedules table
CREATE TABLE schedules (
                           schedule_id INT IDENTITY(1,1) PRIMARY KEY,
                           doctor_id INT NOT NULL,
                           day_of_week INT,
                           start_time DATETIME2,
                           end_time DATETIME2,
                           max_tokens INT,
                           is_available BIT,
                           created_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
                           CONSTRAINT fk_schedules_doctor FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);
GO

-- Create appointment Status table
CREATE TABLE appointments_status (
                                     status_id INT IDENTITY(1,1) PRIMARY KEY,
                                     status_name VARCHAR(50)
);
GO

-- Create appointments table
CREATE TABLE appointments (
                              appointment_id INT IDENTITY(1,1) PRIMARY KEY,
                              patient_id INT NOT NULL,
                              schedule_id INT NOT NULL,
                              appointment_date DATE,
                              apt_time DATETIME2,
                              token_no INT,
                              reason TEXT,
                              status_id INT,
                              created_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
                              CONSTRAINT fk_status FOREIGN KEY (status_id) REFERENCES appointments_status(status_id),
                              CONSTRAINT fk_appointments_patient FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
                              CONSTRAINT fk_appointments_schedule FOREIGN KEY (schedule_id) REFERENCES schedules(schedule_id)
);
GO

-- Create Medical Records table
CREATE TABLE medical_records (
                                 record_id INT IDENTITY(1,1) PRIMARY KEY,
                                 appointment_id INT NOT NULL UNIQUE,
                                 diagnosis TEXT,
                                 medical_report VARBINARY(MAX),
                                 treatment TEXT,
                                 notes TEXT,
                                 created_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
                                 CONSTRAINT fk_medical_records_appointment FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);
GO

-- List all tables created
SELECT name FROM sa.sys.tables;
GO