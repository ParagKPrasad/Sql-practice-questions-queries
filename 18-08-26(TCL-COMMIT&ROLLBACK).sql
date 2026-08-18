CREATE DATABASE tcl_test;

USE tcl_test;

CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Initial data
INSERT INTO student VALUES
(1, 'Rahul'),
(2, 'Amit');

SELECT * FROM student;


-- TCL: COMMIT
START TRANSACTION;

INSERT INTO student VALUES (3, 'Ravi');

COMMIT;

SELECT * FROM student;


-- TCL: ROLLBACK
START TRANSACTION;

INSERT INTO student VALUES (4, 'Suresh');

ROLLBACK;

SELECT * FROM student;