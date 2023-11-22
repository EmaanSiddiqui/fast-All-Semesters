CREATE TABLE Person 
(
    person_id int NOT NULL,
    person_name varchar (50) NOT NULL,
    PreviousName varchar (50) NULL,
    SameNameCount int NULL,
    CONSTRAINT pk_Person PRIMARY KEY (person_id)
);

drop table Person;

---------------------------------
-- Trigger-1:
---------------------------------
CREATE OR REPLACE TRIGGER update_previous_name
BEFORE UPDATE ON Person
FOR EACH ROW
BEGIN
	:new.PreviousName := :old.person_name;
	dbms_output.put_line('');
	dbms_output.put_line('Old Name' || :old.PreviousName);
	dbms_output.put_line('New Name' || :new.person_name);
	dbms_output.put_line('');
END;

insert into person (person_id, person_name) values(1, 'emaan');
INSERT INTO Person (person_id, person_name) values (2, 'Khushi');
INSERT INTO Person (person_id, person_name) values (3, 'Mahnoor');
INSERT INTO Person (person_id, person_name) values (4, 'Nimrah');

UPDATE Person SET person_name = 'Zoya' WHERE person_id = 1;
SELECT * FROM Person;

---------------------------------
-- Trigger-2:
---------------------------------
CREATE OR REPLACE TRIGGER set_same_name_count
AFTER INSERT OR DELETE OR UPDATE OF person_name
ON Person
BEGIN
	UPDATE Person A SET SameNameCount = 
    (SELECT COUNT(*) FROM Person WHERE person_name = A.person_name);
END;

INSERT INTO Person (person_id, person_name) values (5, 'Zaviyar');
INSERT INTO Person (person_id, person_name) values (6, 'Zaroon');
INSERT INTO Person (person_id, person_name) values (7, 'Ibrahim');
INSERT INTO Person (person_id, person_name) values (8, 'Zoya');
SELECT * FROM Person;

