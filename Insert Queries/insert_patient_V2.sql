

INSERT INTO kmathewj.patient (unit_code, date_of_birth, first_name, 
    last_name, street_number, street_name, city, province, 
    postal_code, gender, health_card_number, 
    next_of_kin_name, next_of_kin_relationship, next_of_kin_contact)
VALUES (1, DATE '1980-03-15', 'John', 'Smith',
    '1111', 'Main Street', 'Toronto', 'ON',
    'L23 2N2', 'M', '12345678901P',
    'Mary Smith', 'Spouse', '416-555-2001');
    

INSERT INTO kmathewj.patient (unit_code, date_of_birth, first_name, last_name, 
    street_number, street_name, city, province, postal_code, gender,
    health_card_number, next_of_kin_name, next_of_kin_relationship, next_of_kin_contact)
VALUES (1, DATE '1992-07-22', 'Sarah', 'Foster',
    '456', 'University Avenue', 'Toronto', 'ON', 'KJD 1B5', 'F',
    '2345678901ON', 'David Foster', 'Father', '416-555-2002');

INSERT INTO kmathewj.patient (unit_code, date_of_birth, first_name, last_name,
    street_number, street_name, city, province, postal_code, gender, 
    health_card_number, next_of_kin_name, next_of_kin_relationship, next_of_kin_contact)
VALUES (2, DATE '1978-11-30', 'Eric', 'Brown',
    '789', 'Dundas street', 'Mississauga', 'ON', 'L5B 3Y4', 'M',
    '3456789012ON', 'Jennifer Wilson', 'Spouse', '905-555-2003');

INSERT INTO kmathewj.patient (unit_code, date_of_birth, first_name, last_name,
    street_number, street_name, city, province, postal_code, gender,
    health_card_number, next_of_kin_name, next_of_kin_relationship, next_of_kin_contact)
VALUES (2, DATE '2001-05-18', 'Emma', 'Stuart',
    '321', 'King street', 'Toronto', 'ON', 'L6T 4K8', 'F',
    '4567890123ON', 'Robert Stuart', 'Father', '905-555-2004');

INSERT INTO kmathewj.patient (unit_code, date_of_birth, first_name, last_name,
    street_number, street_name, city, province, postal_code, gender,
    health_card_number, next_of_kin_name, next_of_kin_relationship, next_of_kin_contact)
VALUES (3, DATE '1965-09-08', 'Robert', 'Wilson',
    '654', 'Colleg street', 'Toronto', 'ON', 'M2N 5S7', 'M',
    '5678901234ON', 'Linda Wilson', 'Spouse', '416-555-2005');


select * from kmathewj.patient;
