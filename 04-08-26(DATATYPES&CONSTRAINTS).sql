
         
-- Datatypes & Constraints



/*==========================================================
1. NUMERIC DATATYPES
==========================================================

tinyint  -> 1 byte
smallint -> 2 bytes
int      -> 4 bytes
bigint   -> 8 bytes (64-bit)

Signed TinyInt Range   : -128 to 127
Unsigned TinyInt Range : 0 to 255

*/


-- Example : UNSIGNED TinyInt

drop table if exists test3;

create table test3(
    rollno tinyint unsigned
);

insert into test3 values(129);
insert into test3 values(255);

-- Error (Out of range)
insert into test3 values(256);

select * from test3;



/*==========================================================
2. STRING DATATYPES
==========================================================

CHAR(n)
--------
-> Fixed length
-> Always reserves n characters

VARCHAR(n)
-----------
-> Variable length
-> Uses only required space

Example:
CHAR(10) stores 10 character space.
VARCHAR(20) can store up to 20 characters.

*/


------------------------------------------------------------
-- CHAR Example
------------------------------------------------------------

drop table if exists test4;

create table test4(
    gender char(10)
);

insert into test4 values('Male');

select * from test4;


------------------------------------------------------------
-- VARCHAR Example
------------------------------------------------------------

drop table if exists test6;

create table test6(
    name varchar(20)
);

insert into test6 values('OM');

select * from test6;



/*==========================================================
3. CHAR vs VARCHAR
==========================================================*/

drop table if exists test7;

create table test7(
    name char(10),
    name2 varchar(10)
);

insert into test7 values('abc','abc');
insert into test7 values('def','def  ');

select
    name,
    char_length(name),
    name2,
    char_length(name2)
from test7;


-- Observation:
-- CHAR stores fixed size.
-- VARCHAR stores actual characters.



/*==========================================================
4. STORAGE SIZE CHECK
==========================================================*/

select
    table_name,
    data_length
from information_schema.tables
where table_schema = database()
and table_name in ('test4','test6');

-- Compare CHAR and VARCHAR storage.



/*==========================================================
5. CONSTRAINTS
==========================================================

Constraints are rules applied on columns
to maintain data integrity.

Examples:
NOT NULL
DEFAULT
UNIQUE
PRIMARY KEY

*/


/*==========================================================
6. NOT NULL CONSTRAINT
==========================================================*/

drop table if exists test9;

create table test9(
    id int,
    name varchar(20) not null
);

insert into test9 values(10,'abhishek');

-- Error
insert into test9 values(10,NULL);

select * from test9;



/*==========================================================
7. DEFAULT CONSTRAINT
==========================================================*/

drop table if exists test12;

create table test12(
    id int,
    name varchar(20) default 'regex'
);

insert into test12 values(10,'abhishek');

-- name becomes "regex"
insert into test12(id) values(11);

-- id becomes NULL
insert into test12(name) values('tushar');

select * from test12;



/*==========================================================
8. UNIQUE CONSTRAINT
==========================================================*/

drop table if exists test13;

create table test13(
    id int unique,
    name varchar(20)
);

insert into test13 values(10,'abhishek');

select * from test13;


-- Duplicate value will give error
-- insert into test13 values(10,'abc');



/*==========================================================
9. PRIMARY KEY
==========================================================

Primary Key =
    UNIQUE
    +
    NOT NULL

Only one Primary Key is allowed per table.

*/

drop table if exists test14;

create table test14(
    id int primary key,
    name varchar(20)
);

insert into test14 values(10,'abhishek');

-- Duplicate value (Error)
insert into test14 values(10,'ads');

-- NULL value (Error)
insert into test14 values(NULL,'ads');

select * from test14;



/*==========================================================
SUMMARY
==========================================================

tinyint   -> 1 byte
smallint  -> 2 bytes
int       -> 4 bytes
bigint    -> 8 bytes

CHAR      -> Fixed length
VARCHAR   -> Variable length

NOT NULL  -> NULL values not allowed
DEFAULT   -> Inserts default value if omitted
UNIQUE    -> Duplicate values not allowed
PRIMARY KEY -> UNIQUE + NOT NULL

==========================================================*/