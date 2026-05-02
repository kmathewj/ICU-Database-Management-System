INSERT INTO kmathewj.nurse (staff_id, nurse_license_number, supervisor_id)
VALUES (3, 'RN-ON-345678', NULL);

INSERT INTO kmathewj.nurse (staff_id, nurse_license_number, supervisor_id)
VALUES (4, 'RN-ON-456789', 3);

INSERT INTO kmathewj.nurse (staff_id, nurse_license_number, supervisor_id)
VALUES (5, 'RN-ON-567890', 3);


select * from kmathewj.nurse;