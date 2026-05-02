INSERT INTO kmathewj.prescription (patient_id, staff_id, medication_id, dosage, frequency, start_date, end_date, instructions)
VALUES (1, 1, 2, '10 units', 'Three times daily', DATE '2025-09-25', NULL, 'Administer with meals');

INSERT INTO kmathewj.prescription (patient_id, staff_id, medication_id, dosage, frequency, start_date, end_date, instructions)
VALUES (1, 1, 4, '10 mg', 'Once daily', DATE '2025-09-25', NULL, 'Take in the morning');

INSERT INTO kmathewj.prescription (patient_id, staff_id, medication_id, dosage, frequency, start_date, end_date, instructions)
VALUES (2, 2, 5, '90 mcg', 'As needed', DATE '2025-09-28', NULL, 'Use during breathing difficulties');

INSERT INTO kmathewj.prescription (patient_id, staff_id, medication_id, dosage, frequency, start_date, end_date, instructions)
VALUES (3, 1, 1, '5 mg', 'Every 4 hours', DATE '2025-09-20', DATE '2025-09-29', 'For pain management');

INSERT INTO kmathewj.prescription (patient_id, staff_id, medication_id, dosage, frequency, start_date, end_date, instructions)
VALUES (4, 2, 3, '500 mg', 'Twice daily', DATE '2025-09-29', DATE '2025-10-06', 'Complete full course');

INSERT INTO kmathewj.prescription (patient_id, staff_id, medication_id, dosage, frequency, start_date, end_date, instructions)
VALUES (5, 1, 6, '5000 units', 'Continuous infusion', DATE '2025-09-15', NULL, 'Monitor PT/INR levels');


select * from kmathewj.prescription;