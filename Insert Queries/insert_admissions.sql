INSERT INTO kmathewj.admission (patient_id, room_number, bed_number, admission_date, discharge_date)
VALUES (1, '301', 'A', DATE '2025-09-25', NULL);

INSERT INTO kmathewj.admission (patient_id, room_number, bed_number, admission_date, discharge_date)
VALUES (2, '302', 'B', DATE '2025-09-28', NULL);

INSERT INTO kmathewj.admission (patient_id, room_number, bed_number, admission_date, discharge_date)
VALUES (3, '201', 'A', DATE '2025-09-20', DATE '2025-09-29');

INSERT INTO kmathewj.admission (patient_id, room_number, bed_number, admission_date, discharge_date)
VALUES (4, '202', 'C', DATE '2025-09-29', NULL);

INSERT INTO kmathewj.admission (patient_id, room_number, bed_number, admission_date, discharge_date)
VALUES (5, '501', 'A', DATE '2025-09-15', NULL);

select * from kmathewj.admission;