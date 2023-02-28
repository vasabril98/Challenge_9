
-- Table creation
CREATE TABLE "employees" (
    "emp_no" integer   NOT NULL,
    "emp_title_id" varchar(50)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "sex" varchar(50)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar(50)   NOT NULL,
    "title" varchar(50)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "salaries" (
    "emp_no" integer   NOT NULL,
    "salary" varchar(50)   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no","salary"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" integer   NOT NULL,
    "dept_no" varchar(50)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(50)   NOT NULL,
    "emp_no" integer   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "departments" (
    "dept_no" varchar(50)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);
 -- Adding constraints for the tables to link to each other
ALTER TABLE "employees" ADD CONSTRAINT "fk_employess_emp_title" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- Importing the data from the provided CSV files
-- You may or may not run into a "Permission Denied" error
-- while running the code below depending on you computer setup
-- look at comment section for more information

COPY titles(title_id,title)
FROM '/tmp/data/titles.csv'
DELIMITER ','
CSV HEADER;

SELECT *
FROM titles;

COPY employees(emp_no,emp_title_id,birth_date,first_name,last_name,sex,hire_date)
FROM '/tmp/data/employees.csv'
DELIMITER ','
CSV HEADER;

SELECT *
FROM employees;

COPY salaries(emp_no,salary)
FROM '/tmp/data/salaries.csv'
DELIMITER ','
CSV HEADER;

SELECT *
FROM salaries;

COPY departments(dept_no,dept_name)
FROM '/tmp/data/departments.csv'
DELIMITER ','
CSV HEADER;

SELECT *
FROM departments;

COPY dept_manager(dept_no,emp_no)
FROM '/tmp/data/dept_manager.csv'
DELIMITER ','
CSV HEADER;

SELECT *
FROM dept_manager;

COPY dept_emp(emp_no,dept_no)
FROM '/tmp/data/dept_emp.csv'
DELIMITER ','
CSV HEADER;

SELECT *
FROM dept_emp;
