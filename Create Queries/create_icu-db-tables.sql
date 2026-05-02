-- Clear out old objects to prevent errors when rerunning
/*DROP TABLE patient_equipment CASCADE CONSTRAINTS;
DROP TABLE prescription CASCADE CONSTRAINTS;
DROP TABLE medication CASCADE CONSTRAINTS;
DROP TABLE equipment CASCADE CONSTRAINTS;
DROP TABLE social_worker CASCADE CONSTRAINTS;
DROP TABLE nurse CASCADE CONSTRAINTS;
DROP TABLE doctor CASCADE CONSTRAINTS;
DROP TABLE staff CASCADE CONSTRAINTS;
DROP TABLE medical_history CASCADE CONSTRAINTS;
DROP TABLE admission CASCADE CONSTRAINTS;
DROP TABLE patient CASCADE CONSTRAINTS;
DROP TABLE intensive_care_unit CASCADE CONSTRAINTS;

DROP SEQUENCE icu_unit_seq;
DROP SEQUENCE patient_id_seq;
DROP SEQUENCE admission_id_seq;
DROP SEQUENCE history_id_seq;
DROP SEQUENCE staff_id_seq;
DROP SEQUENCE medication_id_seq;
DROP SEQUENCE prescription_id_seq;
DROP SEQUENCE equipment_id_seq;*/

-- SEQEUNCES
CREATE SEQUENCE icu_unit_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE patient_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE admission_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE history_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE staff_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE medication_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE prescription_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE equipment_id_seq START WITH 1 INCREMENT BY 1;

-- INTENSIVE CARE UNIT
CREATE TABLE intensive_care_unit (
    unit_code NUMBER DEFAULT icu_unit_seq.NEXTVAL PRIMARY KEY,
    location VARCHAR2(100) NOT NULL,
    phone_number VARCHAR2(20)
);

-- PATIENT
CREATE TABLE patient (
    patient_id NUMBER DEFAULT patient_id_seq.NEXTVAL PRIMARY KEY,
    unit_code NUMBER NOT NULL,
    date_of_birth DATE NOT NULL,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    street_number VARCHAR2(10),
    street_name VARCHAR2(100),
    city VARCHAR2(50),
    province VARCHAR2(20),
    postal_code VARCHAR2(10),
    gender CHAR(1) CHECK (gender IN ('M', 'F', 'O')),
    health_card_number VARCHAR2(20) UNIQUE NOT NULL,
    next_of_kin_name VARCHAR2(100),
    next_of_kin_relationship VARCHAR2(50),
    next_of_kin_contact VARCHAR2(50),
    CONSTRAINT fk_patient_icu FOREIGN KEY (unit_code) REFERENCES intensive_care_unit(unit_code)
);

-- ADMISSION (WEAK)
CREATE TABLE admission (
    admission_id NUMBER DEFAULT admission_id_seq.NEXTVAL PRIMARY KEY,
    patient_id NUMBER NOT NULL,
    room_number VARCHAR2(10),
    bed_number VARCHAR2(10),
    admission_date DATE NOT NULL,
    discharge_date DATE,
    CONSTRAINT fk_admission_patient FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    CONSTRAINT chk_discharge_date CHECK (discharge_date IS NULL OR discharge_date >= admission_date)
);

-- MEDICAL HISTORY (WEAK)
CREATE TABLE medical_history (
    history_id NUMBER DEFAULT history_id_seq.NEXTVAL PRIMARY KEY,
    patient_id NUMBER NOT NULL,
    allergy_info VARCHAR2(200),
    past_surgeries VARCHAR2(200),
    chronic_conditions VARCHAR2(200),
    notes VARCHAR2(500),
    CONSTRAINT fk_history_patient FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

-- STAFF (SUPERCLASS + SPECIALIZATION)
CREATE TABLE staff (
    staff_id NUMBER DEFAULT staff_id_seq.NEXTVAL PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    role VARCHAR2(20) CHECK (role IN ('Doctor','Nurse','SocialWorker')) NOT NULL,
    contact_email VARCHAR2(100),
    contact_phone VARCHAR2(20),
    shift_schedule VARCHAR2(50)
);

-- DOCTOR (SUBCLASS TO STAFF)
CREATE TABLE doctor (
    staff_id NUMBER PRIMARY KEY,
    medical_license_number VARCHAR2(50) UNIQUE NOT NULL,
    CONSTRAINT fk_doctor_staff FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

-- NURSE (SUBCLASS TO STAFF)
CREATE TABLE nurse (
    staff_id NUMBER PRIMARY KEY,
    nurse_license_number VARCHAR2(50) UNIQUE NOT NULL,
    supervisor_id NUMBER,
    CONSTRAINT fk_nurse_staff FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    CONSTRAINT fk_nurse_supervisor FOREIGN KEY (supervisor_id) REFERENCES nurse(staff_id)
);

-- SOCIAL WORKER (SUBCLASS TO STAFF)
CREATE TABLE social_worker (
    staff_id NUMBER PRIMARY KEY,
    social_license_number VARCHAR2(50) UNIQUE NOT NULL,
    CONSTRAINT fk_social_staff FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

-- MEDICATION
CREATE TABLE medication (
    medication_id NUMBER DEFAULT medication_id_seq.NEXTVAL PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    dosage_unit VARCHAR2(20) NOT NULL,
    route VARCHAR2(20) CHECK (route IN ('Oral','IV','IM','Subcutaneous')) NOT NULL,
    stock_on_hand NUMBER DEFAULT 0 CHECK (stock_on_hand >= 0)
);

-- PRESCRIPTION
CREATE TABLE prescription (
    prescription_id NUMBER DEFAULT prescription_id_seq.NEXTVAL PRIMARY KEY,
    patient_id NUMBER NOT NULL,
    staff_id NUMBER NOT NULL,
    medication_id NUMBER NOT NULL,
    dosage VARCHAR2(50),
    frequency VARCHAR2(50),
    start_date DATE NOT NULL,
    end_date DATE,
    instructions VARCHAR2(200),
    CONSTRAINT fk_prescription_patient FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    CONSTRAINT fk_prescription_staff FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    CONSTRAINT fk_prescription_med FOREIGN KEY (medication_id) REFERENCES medication(medication_id),
    CONSTRAINT chk_presc_dates CHECK (end_date IS NULL OR end_date >= start_date)
);

-- EQUIPMENT
CREATE TABLE equipment (
    equipment_id NUMBER DEFAULT equipment_id_seq.NEXTVAL PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    status VARCHAR2(20) CHECK (status IN ('Available','In Use','Under Maintenance')) NOT NULL,
    location VARCHAR2(100)
);

-- RELATIONSHIP: PATIENT USES EQUIPMENT
CREATE TABLE patient_equipment (
    patient_id NUMBER NOT NULL,
    equipment_id NUMBER NOT NULL,
    assigned_date DATE NOT NULL,
    released_date DATE,
    PRIMARY KEY (patient_id, equipment_id, assigned_date),
    CONSTRAINT fk_pe_patient FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    CONSTRAINT fk_pe_equipment FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id),
    CONSTRAINT chk_release_date CHECK (released_date IS NULL OR released_date >= assigned_date)
);