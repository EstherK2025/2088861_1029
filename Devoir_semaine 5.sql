CREATE DATABASE library24;

DROP DATABASE IF EXISTS library;

USE library24;
DROP TABLE IF EXISTS jobs;


CREATE TABLE jobs (
job_id tinyint NOT NULL AUTO_INCREMENT /* PRIMARY KEY*/,
job_desc VARCHAR(50) NOT NULL,
min_lvl ENUM ("Stagiaire","Junior","Intermediate", "Senior"),
max_lvl ENUM("Stagiaire","Junior","Intermediate", "Senior"),

CONSTRAINT PK_jobs PRIMARY KEY(job_id)

);

CREATE TABLE publishers(
pub_id tinyint NOT NULL AUTO_INCREMENT,  /* PRIMARY KEY*/
Pub_name VARCHAR(50) unique NOT NULL,
city VARCHAR (50) NULL,
state VARCHAR (50) NULL,
country VARCHAR (50) NULL,
email VARCHAR (50) unique NOT NULL,

CONSTRAINT C_email CHECK( Email RLIKE '%@%'),
CONSTRAINT PK_pub_id primary key(pub_id)
);

CREATE TABLE employees(
emp_id tinyint NOT NULL AUTO_INCREMENT,  /* PRIMARY KEY*/
emp_name VARCHAR(50) unique NULL,
salary smallint,
fname VARCHAR(50) unique ,
lname VARCHAR(50) unique ,
job_id smallint NOT NULL AUTO_INCREMENT REFERENCES jobs(job_id),
pub_id smallint NOT NULL AUTO_INCREMENT REFERENCES publishers(pub_id),
pub_date DATE NOT NULL, 
email VARCHAR (50) unique NOT NULL,

CONSTRAINT PK_emp_id PRIMARY KEY (emp_id),

CONSTRAINT C_email CHECK( Email RLIKE '%@%')

);

CREATE TABLE Authors(
au_id tinyint NOT NULL AUTO_INCREMENT,  /* PRIMARY KEY*/
au_lname VARCHAR(50) unique NULL,
au_fname VARCHAR(50) unique NULL,
phone VARCHAR(20) unique NOT NULL,
address VARCHAR(50) NULL,
city VARCHAR (50) NULL,
state VARCHAR (50) NULL,
country VARCHAR (50) NULL,
zip VARCHAR (6) NULL,
contract text,
email VARCHAR (50)  unique NOT NULL ,

CONSTRAINT C_email CHECK( Email RLIKE '%@%'),
CONSTRAINT C_tel CHECK( Tel RLIKE '+[0-9]{10,15}'),
CONSTRAINT C_zip CHECK(Zip RLIKE '[A-Z]{1}[0-9]{1}{3}'),

CONSTRAINT PK_au_id PRIMARY KEY(au_id)
);


CREATE TABLE Redactions(
au_id tinyint NOT NULL AUTO_INCREMENT REFERENCES Authors(au_id),  /* PRIMARY KEY*/
title_id tinyint NOT NULL,
au_ord tinyint NOT NULL,
royalty float NOT NULL,

CONSTRAINT PK_au_id PRIMARY KEY(au_id)
);

CREATE TYPE t_types AS ENUM ("Roman", "Politique", "science", "Histoire");
CREATE TABLE Titles(
title_id tinyint NOT NULL,  /* PRIMARY KEY*/
title VARCHAR (100) NOT NULL,
pub_id smallint REFERENCES publishers(pub_id),
price float,
advance float,
notes VARCHAR (225) NULL,
pub_id DATE,

CONSTRAINT PK_title_id PRIMARY KEY(title_id)
);



CREATE TABLE sales (
store_id tinyint NOT NULL,  /* PRIMARY KEY*/
ord_num tinyint NOT NULL,
title_id smallint,
ord_date datetime ,
qty INT
);

CREATE TABLE stores(
stor_id tinyint NOT NULL,  /* PRIMARY KEY*/
stor_name VARCHAR(50) NOT NULL,
city VARCHAR (50) NULL,
state VARCHAR (50) NULL,
country VARCHAR (50) NULL

);