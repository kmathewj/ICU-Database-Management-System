INSERT INTO kmathewj.patient_equipment (patient_id, equipment_id, assigned_date, released_date)
VALUES (1, 1, DATE '2025-09-25', NULL);

INSERT INTO kmathewj.patient_equipment (patient_id, equipment_id, assigned_date, released_date)
VALUES (2, 2, DATE '2025-09-28', NULL);

INSERT INTO kmathewj.patient_equipment (patient_id, equipment_id, assigned_date, released_date)
VALUES (3, 1, DATE '2025-09-20', DATE '2025-09-29');

INSERT INTO kmathewj.patient_equipment (patient_id, equipment_id, assigned_date, released_date)
VALUES (4, 6, DATE '2025-09-29', NULL);

INSERT INTO kmathewj.patient_equipment (patient_id, equipment_id, assigned_date, released_date)
VALUES (5, 5, DATE '2025-09-15', NULL);


select * from kmathewj.patient_equipment;