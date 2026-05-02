
/* Query gets the first admission to the hospital, returning only the room_number, bed_number and admission_date */
select room_number, bed_number, admission_date from kmathewj.admission order by admission_date fetch first  1 rows only;

/* Query returns the first and last names of the first patient and the admission date */
select first_name, last_name, admission_date
from kmathewj.admission  A
join kmathewj.patient  P 
on A.patient_id = P.patient_id
order by admission_date fetch first  1 rows only;


/* The query provides counts of all the medications grouped by route of injection */
select route, count(*) from kmathewj.medication
group by route;

/* The query returns all the distinct locations that equipment could be found in */
select distinct(location) from kmathewj.equipment;