USE tcl_test;

-- Q1. Insert a student and create a SAVEPOINT.
START TRANSACTION;
INSERT INTO student VALUES (20, 'Ravi');
SAVEPOINT s1;


-- Q2. Insert another student and rollback to SAVEPOINT s1.
INSERT INTO student VALUES (21, 'Aman');
ROLLBACK TO s1;
COMMIT;

select * from student;

-- Q3. Insert a student, create a SAVEPOINT, and save all changes.
START TRANSACTION;
INSERT INTO student VALUES (22, 'Neha');
SAVEPOINT s2;
INSERT INTO student VALUES (23, 'Pooja');
COMMIT;


-- Q4. Update a student, create a SAVEPOINT, make another update,
-- and rollback the second update.
START TRANSACTION;
UPDATE student SET name = 'Rahul Kumar' WHERE id = 1;
SAVEPOINT s3;
UPDATE student SET name = 'Rahul Sharma' WHERE id = 1;
ROLLBACK TO s3;
COMMIT;


-- Q5. Insert two students and rollback to a SAVEPOINT.
START TRANSACTION;
INSERT INTO student VALUES (24, 'Karan');
SAVEPOINT s4;
INSERT INTO student VALUES (25, 'Rohan');
ROLLBACK TO s4;
COMMIT;


-- Q6. Insert a student, create a SAVEPOINT, and release the SAVEPOINT.
START TRANSACTION;
INSERT INTO student VALUES (26, 'Deepak');
SAVEPOINT s5;
RELEASE SAVEPOINT s5;
COMMIT;


-- Q7. Update two students and rollback only the second update.
START TRANSACTION;
UPDATE student SET name = 'Amit Kumar' WHERE id = 2;
SAVEPOINT s6;
UPDATE student SET name = 'Amit Sharma' WHERE id = 2;
ROLLBACK TO s6;
COMMIT;


-- Q8. Insert three students and rollback the last two using SAVEPOINT.
START TRANSACTION;
INSERT INTO student VALUES (27, 'Vijay');
SAVEPOINT s7;
INSERT INTO student VALUES (28, 'Arjun');
INSERT INTO student VALUES (29, 'Suresh');
ROLLBACK TO s7;
COMMIT;


-- Q9. Insert a student, create a SAVEPOINT, update the student,
-- and rollback the update.
START TRANSACTION;
INSERT INTO student VALUES (30, 'Ankit');
SAVEPOINT s8;
UPDATE student SET name = 'Ankit Kumar' WHERE id = 30;
ROLLBACK TO s8;
COMMIT;


-- Q10. Insert two students, create a SAVEPOINT,
-- delete one student, and rollback the deletion.
START TRANSACTION;
INSERT INTO student VALUES (31, 'Ramesh');
INSERT INTO student VALUES (32, 'Mohan');
SAVEPOINT s9;
DELETE FROM student WHERE id = 32;
ROLLBACK TO s9;
COMMIT;