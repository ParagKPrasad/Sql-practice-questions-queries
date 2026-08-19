USE tcl_test;

CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO student VALUES
(1, 'Rahul'),
(2, 'Amit');

-- Q1. Insert Ravi with id 3 and save permanently.
START TRANSACTION;
INSERT INTO student VALUES (3, 'Ravi');
COMMIT;

-- Q2. Insert Suresh with id 4 and undo the insertion.
START TRANSACTION;
INSERT INTO student VALUES (4, 'Suresh');
ROLLBACK;

-- Q3. Change Rahul to Rahul Sharma and save the change.
START TRANSACTION;
UPDATE student
SET name = 'Rahul Sharma'
WHERE id = 1;
COMMIT;

-- Q4. Change Amit to Aman and undo the change.
START TRANSACTION;
UPDATE student
SET name = 'Aman'
WHERE id = 2;
ROLLBACK;

-- Q5. Delete Ravi and save the change.
START TRANSACTION;
DELETE FROM student
WHERE id = 3;
COMMIT;

-- Q6. Delete Amit and undo the deletion.
START TRANSACTION;
DELETE FROM student
WHERE id = 2;
ROLLBACK;

-- Q7. Insert Rohan and Karan and save both records.
START TRANSACTION;
INSERT INTO student VALUES (5, 'Rohan');
INSERT INTO student VALUES (6, 'Karan');
COMMIT;

-- Q8. Insert Vijay and Arjun and undo both records.
START TRANSACTION;
INSERT INTO student VALUES (7, 'Vijay');
INSERT INTO student VALUES (8, 'Arjun');
ROLLBACK;

-- Q9. Update Rohan and Karan and save the changes.
START TRANSACTION;
UPDATE student SET name = 'Rohan Kumar' WHERE id = 5;
UPDATE student SET name = 'Karan Singh' WHERE id = 6;
COMMIT;

-- Q10. Insert Deepak and undo the insertion.
START TRANSACTION;
INSERT INTO student VALUES (9, 'Deepak');
ROLLBACK;

SELECT * FROM student;