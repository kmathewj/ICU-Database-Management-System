#!/bin/sh
# export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib

while true; do
    clear
    echo "================================================================="
    echo "| Oracle All Inclusive Tool                                      |"
    echo "| ICU Database - Advanced Query Menu                             |"
    echo "| <CTRL-Z Anytime to Enter Interactive CMD Prompt>               |"
    echo "-----------------------------------------------------------------"
    echo "  1) List patients who have active admissions"
    echo "  2) Show all staff who are either doctors or nurses"
    echo "  3) List staff who are doctors but not nurses"
    echo "  4) Count total patients admitted per ICU unit"
    echo "  5) Equipment assignment for a given location"
    echo ""
    echo "  E) Exit Query Menu"
    printf "Choose a query to run: "
    read CHOICE

    case "$CHOICE" in
        1)
            echo ""
            echo "============================================================="
            echo "Query 1: Patients with Active Admissions"
            echo "-------------------------------------------------------------"
            sqlplus64 "username/password@//oracle12c.scs.ryerson.ca:1521/orcl12c" <<EOF
SET LINESIZE 200
SET PAGESIZE 50
COLUMN first_name FORMAT A15
COLUMN last_name FORMAT A15
COLUMN admission_date FORMAT A15

SELECT p.first_name, p.last_name, a.admission_date
FROM patient p
JOIN admission a ON p.patient_id = a.patient_id
WHERE a.discharge_date IS NULL
ORDER BY a.admission_date DESC;
exit;
EOF
            ;;

        2)
            echo ""
            echo "============================================================="
            echo "Query 2: All Doctors and Nurses"
            echo "-------------------------------------------------------------"
            sqlplus64 "username/password@//oracle12c.scs.ryerson.ca:1521/orcl12c" <<EOF
SET LINESIZE 200
SET PAGESIZE 50
COLUMN first_name FORMAT A15
COLUMN last_name FORMAT A15
COLUMN role FORMAT A15

SELECT s.first_name, s.last_name, 'Doctor' AS role
FROM staff s
JOIN doctor d ON s.staff_id = d.staff_id
UNION
SELECT s.first_name, s.last_name, 'Nurse' AS role
FROM staff s
JOIN nurse n ON s.staff_id = n.staff_id
ORDER BY role, last_name;

exit;
EOF
            ;;

        3)
            echo ""
            echo "============================================================="
            echo "Query 3: Staff who are Doctors but not Nurses"
            echo "-------------------------------------------------------------"
            sqlplus64 "username/password@//oracle12c.scs.ryerson.ca:1521/orcl12c" <<EOF
SET LINESIZE 200
SET PAGESIZE 50
COLUMN first_name FORMAT A15
COLUMN last_name FORMAT A15

SELECT s.first_name, s.last_name
FROM staff s
JOIN doctor d ON s.staff_id = d.staff_id
MINUS
SELECT s.first_name, s.last_name
FROM staff s
JOIN nurse n ON s.staff_id = n.staff_id
ORDER BY last_name;

exit;
EOF
            ;;

        4)
            echo ""
            echo "============================================================="
            echo "Query 4: Patient Count per ICU Unit"
            echo "-------------------------------------------------------------"
            sqlplus64 "username/password@//oracle12c.scs.ryerson.ca:1521/orcl12c" <<EOF
SET LINESIZE 200
SET PAGESIZE 50
COLUMN location FORMAT A20
COLUMN patient_count FORMAT 9999

SELECT i.location, COUNT(p.patient_id) AS patient_count
FROM intensive_care_unit i
LEFT JOIN patient p ON i.unit_code = p.unit_code
GROUP BY i.location
ORDER BY patient_count DESC;

exit;
EOF
            ;;

        5)
            echo ""
            echo "============================================================="
            echo "Query 5: Equipment assignemnt for a given wing location"
            echo "-------------------------------------------------------------"
            sqlplus64 "username/password@//oracle12c.scs.ryerson.ca:1521/orcl12c" <<EOF
SET LINESIZE 200
SET PAGESIZE 50
COLUMN medication_name FORMAT A30
COLUMN prescription_count FORMAT 9999

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

exit;
EOF
            ;;

        [eE])
            echo ""
            echo "Returning to Main Menu..."
            break
            ;;

        *)
            echo ""
            echo "Invalid option. Please select a valid query (1-5) or E to exit."
            ;;
    esac

    echo ""
    printf "Press Enter to continue..."
    read dummy
done
