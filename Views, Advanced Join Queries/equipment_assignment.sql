-  Creates a view to show equipment assignment to given wing location
CREATE OR REPLACE VIEW icu_equipment_status_v AS
SELECT 
    e.equipment_id,
    e.name AS equipment_name,
    e.status,
    pe.assigned_date
FROM 
    kmathewj.equipment e
LEFT JOIN kmathewj.patient_equipment pe 
    ON e.equipment_id = pe.equipment_id AND pe.released_date IS NULL
LEFT JOIN kmathewj.patient p 
    ON pe.patient_id = p.patient_id
LEFT JOIN kmathewj.intensive_care_unit icu 
    ON p.unit_code = icu.unit_code;


SELECT * from icu_equipment_status_v;