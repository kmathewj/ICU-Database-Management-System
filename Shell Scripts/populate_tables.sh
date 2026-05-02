#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib

echo "============================================================="
echo "ICU Database Complete Setup Script"
echo "-------------------------------------------------------------"
echo "POPULATE tables with sample data"
echo "-------------------------------------------------------------"
printf "Are you sure you want to continue? (y/N): "
read CONFIRM

if [ "$CONFIRM" = "y" ]; then
    echo "Proceeding with complete database setup..."
    sqlplus64 "username/password@//oracle12c.scs.ryerson.ca:1521/orcl12c" <<EOF


INSERT INTO intensive_care_unit (unit_code, location, phone_number)
VALUES (1, 'wingA', '612-123-1311');
INSERT INTO intensive_care_unit (unit_code, location, phone_number)
VALUES (2, 'wingA', '612-123-4311');
INSERT INTO intensive_care_unit (unit_code, location, phone_number)
VALUES (3, 'wingB', '612-431-1231');
INSERT INTO intensive_care_unit (unit_code, location, phone_number)
VALUES (4, 'wingC', '612-321-4141');
INSERT INTO intensive_care_unit (unit_code, location, phone_number)
VALUES (5, 'wingC', '612-123-3123');
INSERT INTO intensive_care_unit (unit_code, location, phone_number)
VALUES (6, 'wingD', '612-123-2313');

INSERT INTO patient (unit_code, date_of_birth, first_name, last_name, street_number, street_name, city, province, postal_code, gender, health_card_number, next_of_kin_name, next_of_kin_relationship, next_of_kin_contact)
VALUES (1, DATE '1980-03-15', 'John', 'Smith', '1111', 'Main Street', 'Toronto', 'ON', 'L23 2N2', 'M', '12345678901P', 'Mary Smith', 'Spouse', '416-555-2001');
INSERT INTO patient (unit_code, date_of_birth, first_name, last_name, street_number, street_name, city, province, postal_code, gender, health_card_number, next_of_kin_name, next_of_kin_relationship, next_of_kin_contact)
VALUES (1, DATE '1992-07-22', 'Sarah', 'Foster', '456', 'University Avenue', 'Toronto', 'ON', 'KJD 1B5', 'F', '2345678901ON', 'David Foster', 'Father', '416-555-2002');
INSERT INTO patient (unit_code, date_of_birth, first_name, last_name, street_number, street_name, city, province, postal_code, gender, health_card_number, next_of_kin_name, next_of_kin_relationship, next_of_kin_contact)
VALUES (2, DATE '1978-11-30', 'Eric', 'Brown', '789', 'Dundas street', 'Mississauga', 'ON', 'L5B 3Y4', 'M', '3456789012ON', 'Jennifer Wilson', 'Spouse', '905-555-2003');
INSERT INTO patient (unit_code, date_of_birth, first_name, last_name, street_number, street_name, city, province, postal_code, gender, health_card_number, next_of_kin_name, next_of_kin_relationship, next_of_kin_contact)
VALUES (2, DATE '2001-05-18', 'Emma', 'Stuart', '321', 'King street', 'Toronto', 'ON', 'L6T 4K8', 'F', '4567890123ON', 'Robert Stuart', 'Father', '905-555-2004');
INSERT INTO patient (unit_code, date_of_birth, first_name, last_name, street_number, street_name, city, province, postal_code, gender, health_card_number, next_of_kin_name, next_of_kin_relationship, next_of_kin_contact)
VALUES (3, DATE '1965-09-08', 'Robert', 'Wilson', '654', 'Colleg street', 'Toronto', 'ON', 'M2N 5S7', 'M', '5678901234ON', 'Linda Wilson', 'Spouse', '416-555-2005');

INSERT INTO admission (patient_id, room_number, bed_number, admission_date, discharge_date)
VALUES (1, '301', 'A', DATE '2025-09-25', NULL);
INSERT INTO admission (patient_id, room_number, bed_number, admission_date, discharge_date)
VALUES (2, '302', 'B', DATE '2025-09-28', NULL);
INSERT INTO admission (patient_id, room_number, bed_number, admission_date, discharge_date)
VALUES (3, '201', 'A', DATE '2025-09-20', DATE '2025-09-29');
INSERT INTO admission (patient_id, room_number, bed_number, admission_date, discharge_date)
VALUES (4, '202', 'C', DATE '2025-09-29', NULL);
INSERT INTO admission (patient_id, room_number, bed_number, admission_date, discharge_date)
VALUES (5, '501', 'A', DATE '2025-09-15', NULL);

INSERT INTO medical_history (patient_id, allergy_info, past_surgeries, chronic_conditions, notes)
VALUES (1, 'Penicillin', 'Appendectomy 2010', 'Hypertension, Type 2 Diabetes', 'Requires daily blood pressure monitoring');
INSERT INTO medical_history (patient_id, allergy_info, past_surgeries, chronic_conditions, notes)
VALUES (2, 'None', 'None', 'Asthma', 'Inhaler required, no known drug allergies');
INSERT INTO medical_history (patient_id, allergy_info, past_surgeries, chronic_conditions, notes)
VALUES (3, 'Latex, Shellfish', 'Knee replacement 2020', 'Arthritis, High cholesterol', 'Use non-latex gloves');
INSERT INTO medical_history (patient_id, allergy_info, past_surgeries, chronic_conditions, notes)
VALUES (4, 'Sulfa drugs', 'Tonsillectomy 2015', 'None', 'Young adult, generally healthy');
INSERT INTO medical_history (patient_id, allergy_info, past_surgeries, chronic_conditions, notes)
VALUES (5, 'Aspirin', 'Cardiac bypass 2018, Hernia repair 2022', 'Heart disease, COPD', 'High-risk patient, close monitoring required');

INSERT INTO staff (first_name, last_name, role, contact_email, contact_phone, shift_schedule)
VALUES ('Emily', 'Anderson', 'Doctor', 'eanderson@hospital.com', '416-555-3001', 'Monday-Friday 8AM-6PM');
INSERT INTO staff (first_name, last_name, role, contact_email, contact_phone, shift_schedule)
VALUES ('James', 'Martinez', 'Doctor', 'jmartinez@hospital.com', '416-555-3002', 'Tuesday-Saturday 9AM-7PM');
INSERT INTO staff (first_name, last_name, role, contact_email, contact_phone, shift_schedule)
VALUES ('Lisa', 'Chen', 'Nurse', 'lchen@hospital.com', '416-555-3003', 'Monday-Friday 7AM-3PM');
INSERT INTO staff (first_name, last_name, role, contact_email, contact_phone, shift_schedule)
VALUES ('David', 'Thompson', 'Nurse', 'dthompson@hospital.com', '416-555-3004', 'Monday-Friday 3PM-11PM');
INSERT INTO staff (first_name, last_name, role, contact_email, contact_phone, shift_schedule)
VALUES ('Maria', 'Garcia', 'Nurse', 'mgarcia@hospital.com', '416-555-3005', 'Saturday-Wednesday 7AM-3PM');
INSERT INTO staff (first_name, last_name, role, contact_email, contact_phone, shift_schedule)
VALUES ('Rachel', 'Lee', 'SocialWorker', 'rlee@hospital.com', '416-555-3006', 'Monday-Friday 9AM-5PM');
INSERT INTO staff (first_name, last_name, role, contact_email, contact_phone, shift_schedule)
VALUES ('Thomas', 'White', 'SocialWorker', 'twhite@hospital.com', '416-555-3007', 'Tuesday-Saturday 10AM-6PM');

INSERT INTO doctor (staff_id, medical_license_number)
VALUES (1, 'MD-ON-123456');
INSERT INTO doctor (staff_id, medical_license_number)
VALUES (2, 'MD-ON-234567');

INSERT INTO nurse (staff_id, nurse_license_number, supervisor_id)
VALUES (3, 'RN-ON-345678', NULL);
INSERT INTO nurse (staff_id, nurse_license_number, supervisor_id)
VALUES (4, 'RN-ON-456789', 3);
INSERT INTO nurse (staff_id, nurse_license_number, supervisor_id)
VALUES (5, 'RN-ON-567890', 3);

INSERT INTO social_worker (staff_id, social_license_number)
VALUES (6, 'SW-ON-678901');
INSERT INTO social_worker (staff_id, social_license_number)
VALUES (7, 'SW-ON-789012');

INSERT INTO medication (name, dosage_unit, route, stock_on_hand)
VALUES ('Morphine', 'mg', 'IV', 500);
INSERT INTO medication (name, dosage_unit, route, stock_on_hand)
VALUES ('Insulin', 'units', 'Subcutaneous', 1000);
INSERT INTO medication (name, dosage_unit, route, stock_on_hand)
VALUES ('Amoxicillin', 'mg', 'Oral', 750);
INSERT INTO medication (name, dosage_unit, route, stock_on_hand)
VALUES ('Lisinopril', 'mg', 'Oral', 600);
INSERT INTO medication (name, dosage_unit, route, stock_on_hand)
VALUES ('Albuterol', 'mcg', 'Oral', 300);
INSERT INTO medication (name, dosage_unit, route, stock_on_hand)
VALUES ('Heparin', 'units', 'IV', 400);

INSERT INTO equipment (name, status, location)
VALUES ('Ventilator', 'In Use', 'Room 301');
INSERT INTO equipment (name, status, location)
VALUES ('ECG Monitor', 'In Use', 'Room 302');
INSERT INTO equipment (name, status, location)
VALUES ('Infusion Pump', 'Available', 'Equipment Storage');
INSERT INTO equipment (name, status, location)
VALUES ('Defibrillator', 'Available', 'Emergency Cart');
INSERT INTO equipment (name, status, location)
VALUES ('Ventilator', 'In Use', 'Room 501');
INSERT INTO equipment (name, status, location)
VALUES ('Patient Monitor', 'In Use', 'Room 202');
INSERT INTO equipment (name, status, location)
VALUES ('Suction Machine', 'Under Maintenance', 'Maintenance Department');

INSERT INTO prescription (patient_id, staff_id, medication_id, dosage, frequency, start_date, end_date, instructions)
VALUES (1, 1, 2, '10 units', 'Three times daily', DATE '2025-09-25', NULL, 'Administer with meals');
INSERT INTO prescription (patient_id, staff_id, medication_id, dosage, frequency, start_date, end_date, instructions)
VALUES (1, 1, 4, '10 mg', 'Once daily', DATE '2025-09-25', NULL, 'Take in the morning');
INSERT INTO prescription (patient_id, staff_id, medication_id, dosage, frequency, start_date, end_date, instructions)
VALUES (2, 2, 5, '90 mcg', 'As needed', DATE '2025-09-28', NULL, 'Use during breathing difficulties');
INSERT INTO prescription (patient_id, staff_id, medication_id, dosage, frequency, start_date, end_date, instructions)
VALUES (3, 1, 1, '5 mg', 'Every 4 hours', DATE '2025-09-20', DATE '2025-09-29', 'For pain management');
INSERT INTO prescription (patient_id, staff_id, medication_id, dosage, frequency, start_date, end_date, instructions)
VALUES (4, 2, 3, '500 mg', 'Twice daily', DATE '2025-09-29', DATE '2025-10-06', 'Complete full course');
INSERT INTO prescription (patient_id, staff_id, medication_id, dosage, frequency, start_date, end_date, instructions)
VALUES (5, 1, 6, '5000 units', 'Continuous infusion', DATE '2025-09-15', NULL, 'Monitor PT/INR levels');

INSERT INTO patient_equipment (patient_id, equipment_id, assigned_date, released_date)
VALUES (1, 1, DATE '2025-09-25', NULL);
INSERT INTO patient_equipment (patient_id, equipment_id, assigned_date, released_date)
VALUES (2, 2, DATE '2025-09-28', NULL);
INSERT INTO patient_equipment (patient_id, equipment_id, assigned_date, released_date)
VALUES (3, 1, DATE '2025-09-20', DATE '2025-09-29');
INSERT INTO patient_equipment (patient_id, equipment_id, assigned_date, released_date)
VALUES (4, 6, DATE '2025-09-29', NULL);
INSERT INTO patient_equipment (patient_id, equipment_id, assigned_date, released_date)
VALUES (5, 5, DATE '2025-09-15', NULL);

COMMIT;

exit;
EOF
    echo "- Sample data inserted successfully"
else
    echo "Operation cancelled. No changes were made."
fi
