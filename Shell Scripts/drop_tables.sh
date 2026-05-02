#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
echo "WARNING: This will permanently DROP all tables and sequences!"
printf "Are you sure you want to continue? (y/N): "
read CONFIRM

if [ "$CONFIRM" = "y" ]; then
    echo "Proceeding with table drops..."
    sqlplus64 "username/password@//oracle12c.scs.ryerson.ca:1521/orcl12c" <<EOF
DROP TABLE prescription CASCADE CONSTRAINTS;
DROP TABLE medication CASCADE CONSTRAINTS;
DROP TABLE equipment CASCADE CONSTRAINTS;
DROP TABLE social_worker CASCADE CONSTRAINTS;
DROP TABLE nurse CASCADE CONSTRAINTS;
DROP TABLE doctor CASCADE CONSTRAINTS;
DROP TABLE staff CASCADE CONSTRAINTS;
DROP TABLE medical_history CASCADE CONSTRAINTS;
DROP TABLE admission CASCADE CONSTRAINTS;
DROP TABLE patient CASCADE CONSTRAINTS;
DROP TABLE intensive_care_unit CASCADE CONSTRAINTS;

DROP SEQUENCE icu_unit_seq;
DROP SEQUENCE patient_id_seq;
DROP SEQUENCE admission_id_seq;
DROP SEQUENCE history_id_seq;
DROP SEQUENCE staff_id_seq;
DROP SEQUENCE medication_id_seq;
DROP SEQUENCE prescription_id_seq;
DROP SEQUENCE equipment_id_seq;
exit;
EOF
else
    echo "Operation cancelled. No tables were dropped."
fi
