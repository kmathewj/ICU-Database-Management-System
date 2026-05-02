CREATE VIEW kmathewj.patient_medical_summary AS
SELECT p.patient_id, p.first_name,  p.last_name,  mh.allergy_info, mh.chronic_conditions, mh.past_surgeries
FROM kmathewj.patient p
LEFT JOIN kmathewj.medical_history mh
ON p.patient_id = mh.patient_id;


select * from kmathewj.patient_medical_summary;