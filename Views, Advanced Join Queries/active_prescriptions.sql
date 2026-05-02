/* Patient prescription summary*/
CREATE VIEW kmathewj.active_prescriptions AS
SELECT
    pr.prescription_id,
    p.patient_id,
    p.first_name, p.last_name,
    m.name,
    pr.dosage,
    pr.frequency,
    m.route,
    pr.start_date,
    pr.end_date,
    s.last_name AS assigning_staff,
    pr.instructions
FROM kmathewj.prescription pr
JOIN kmathewj.patient p ON pr.patient_id = p.patient_id
JOIN kmathewj.medication m ON pr.medication_id = m.medication_id
JOIN kmathewj.staff s ON pr.staff_id = s.staff_id
WHERE pr.end_date IS NULL; 

select * from kmathewj.active_prescriptions;


