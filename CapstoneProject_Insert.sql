--*************************************************************************************************************
--                                      Insert Roles Data
--*************************************************************************************************************
INSERT INTO roles (role_name) VALUES ( 'Admin');
INSERT INTO roles (role_name) VALUES ( 'Doctor');
INSERT INTO roles (role_name) VALUES ( 'Patient');

--*************************************************************************************************************
--                                      Insert Users Data
--*************************************************************************************************************
INSERT INTO users (username, password_hash, role_id, is_login) VALUES ('admin1', 'hash123', 1, 1);
INSERT INTO users (username, password_hash, role_id, is_login) VALUES ('dr_amit', 'hash456', 2, 0);
INSERT INTO users (username, password_hash, role_id, is_login) VALUES ('pat_sita', 'hash789', 3, 0);
INSERT INTO users (username, password_hash, role_id, is_login) VALUES ('dr_kavita', 'hash012', 2, 0);
INSERT INTO users (username, password_hash, role_id, is_login) VALUES ('pat_raj', 'hash345', 3, 0);
INSERT INTO users (username, password_hash, role_id, is_login) VALUES ('admin2', 'hash678', 1, 1);
--*************************************************************************************************************
--                                      Insert Users Detail Data
--*************************************************************************************************************
INSERT INTO user_details (user_id, first_name, last_name, date_of_birth, gender, phone_number, email) VALUES (1, 'Rahul', 'Sharma', TO_DATE('1985-05-15', 'YYYY-MM-DD'), 'Male', '9876543210', 'rahul.sharma@example.com');
INSERT INTO user_details (user_id, first_name, last_name, date_of_birth, gender, phone_number, email) VALUES (2, 'Amit', 'Kumar', TO_DATE('1978-08-21', 'YYYY-MM-DD'), 'Male', '9876504321', 'amit.kumar@example.com');
INSERT INTO user_details (user_id, first_name, last_name, date_of_birth, gender, phone_number, email) VALUES (3, 'Sita', 'Verma', TO_DATE('1990-11-10', 'YYYY-MM-DD'), 'Female', '9876432109', 'sita.verma@example.com');
INSERT INTO user_details (user_id, first_name, last_name, date_of_birth, gender, phone_number, email) VALUES (4, 'Kavita', 'Singh', TO_DATE('1982-07-30', 'YYYY-MM-DD'), 'Female', '9876123456', 'kavita.singh@example.com');
INSERT INTO user_details (user_id, first_name, last_name, date_of_birth, gender, phone_number, email) VALUES (5, 'Raj', 'Patel', TO_DATE('1995-03-18', 'YYYY-MM-DD'), 'Male', '9876987654', 'raj.patel@example.com');
INSERT INTO user_details (user_id, first_name, last_name, date_of_birth, gender, phone_number, email) VALUES (6, 'Anil', 'Yadav', TO_DATE('1988-06-22', 'YYYY-MM-DD'), 'Male', '9876012345', 'anil.yadav@example.com');


--*************************************************************************************************************
--                                      Insert Doctors Data
--*************************************************************************************************************
INSERT INTO doctors (user_id, specialization, license_number, experience, degree, is_active) VALUES (2, 'Cardiology', 'LIC12345', 15, 'MBBS, MD', 1);
INSERT INTO doctors (user_id, specialization, license_number, experience, degree, is_active) VALUES (4, 'Dermatology', 'LIC67890', 10, 'MBBS, MD', 1);


--*************************************************************************************************************
--                                      Insert Schedules Data
--*************************************************************************************************************
INSERT INTO schedules (doctor_id, day_of_week, start_time, end_time, max_tokens, is_available) VALUES (1, 2, TO_TIMESTAMP('09:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('12:00:00', 'HH24:MI:SS'), 10, 1);
INSERT INTO schedules (doctor_id, day_of_week, start_time, end_time, max_tokens, is_available) VALUES (2, 5, TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'), 8, 1);


--*************************************************************************************************************
--                                      Insert Patients Data
--*************************************************************************************************************
INSERT INTO patients (user_id, blood_grp) VALUES (3, 'O+');
INSERT INTO patients (user_id, blood_grp) VALUES (5, 'A-');
INSERT INTO patients (user_id, blood_grp) VALUES (6, 'B+');


--*************************************************************************************************************
--                                      Insert Appointments Status Data
--*************************************************************************************************************
INSERT INTO appointments_status(status_name) VALUES('Completed');
INSERT INTO appointments_status(status_name) VALUES('Pending');
INSERT INTO appointments_status(status_name) VALUES('Cancelled');


--*************************************************************************************************************
--                                      Insert Appointments Data
--*************************************************************************************************************
INSERT INTO appointments (patient_id, schedule_id, appointment_date, apt_time, token_no, reason, status_id) VALUES (1, 1, TO_DATE('2025-03-10', 'YYYY-MM-DD'), TO_TIMESTAMP('10:30:00', 'HH24:MI:SS'), 5, 'Regular check-up', 1);
INSERT INTO appointments (patient_id, schedule_id, appointment_date, apt_time, token_no, reason, status_id) VALUES (2, 2, TO_DATE('2025-03-15', 'YYYY-MM-DD'), TO_TIMESTAMP('11:15:00', 'HH24:MI:SS'), 3, 'Skin allergy', 2);


--*************************************************************************************************************
--                                      Insert Medical Records Data
--*************************************************************************************************************
INSERT INTO medical_records (appointment_id, diagnosis, treatment, notes) VALUES (1, 'Mild Hypertension', 'Lifestyle changes', 'Monitor BP weekly');
INSERT INTO medical_records (appointment_id, diagnosis, treatment, notes) VALUES (2, 'Acne Treatment', 'Topical Ointment', 'Apply cream twice daily');

commit;