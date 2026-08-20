USE tcl_test;

-- Q1. Insert Mohan with id 10 and save the record.
START TRANSACTION;
INSERT INTO student VALUES (10, 'Mohan');
COMMIT;

-- Q2. Insert Ramesh with id 11 and undo the insertion.
START TRANSACTION;
INSERT INTO student VALUES (11, 'Ramesh');
ROLLBACK;

-- Q3. Change Mohan to Mohan Kumar and save the change.
START TRANSACTION;
UPDATE student SET name = 'Mohan Kumar' WHERE id = 10;
COMMIT;

-- Q4. Change Rahul Sharma to Rahul and undo the change.
START TRANSACTION;
UPDATE student SET name = 'Rahul' WHERE id = 1;
ROLLBACK;

-- Q5. Delete Mohan Kumar and undo the deletion.
START TRANSACTION;
DELETE FROM student WHERE id = 10;
ROLLBACK;

-- Q6. Insert Neha and Priya and save both records.
START TRANSACTION;
INSERT INTO student VALUES (12, 'Neha');
INSERT INTO student VALUES (13, 'Priya');
COMMIT;

-- Q7. Update Neha and Priya and save the changes.
START TRANSACTION;
UPDATE student SET name = 'Neha Sharma' WHERE id = 12;
UPDATE student SET name = 'Priya Singh' WHERE id = 13;
COMMIT;

-- Q8. Delete Neha and Priya and undo both deletions.
START TRANSACTION;
DELETE FROM student WHERE id = 12;
DELETE FROM student WHERE id = 13;
ROLLBACK;

-- Q9. Insert Ankit, update his name, and save all changes.
START TRANSACTION;
INSERT INTO student VALUES (14, 'Ankit');
UPDATE student SET name = 'Ankit Kumar' WHERE id = 14;
COMMIT;

-- Q10. Insert Pooja, update her name, and undo all changes.
START TRANSACTION;
INSERT INTO student VALUES (15, 'Pooja');
UPDATE student SET name = 'Pooja Sharma' WHERE id = 15;
ROLLBACK;