
CREATE TABLE departments (
    dept_no VARCHAR(10)  PRIMARY KEY NOT NULL,
    dept_name VARCHAR(100)   NOT NULL
);

CREATE TABLE employees (
    emp_no INTEGER  PRIMARY KEY NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    gender CHAR   NOT NULL,
    hire_date DATE   NOT NULL
);

CREATE TABLE dept_emp (
    de_id SERIAL  PRIMARY KEY,
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR(10)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

ALTER SEQUENCE dept_emp_de_id_seq RESTART WITH 1001 INCREMENT BY 1;

CREATE TABLE dept_manager (
    dm_id SERIAL PRIMARY KEY,
    dept_no VARCHAR(10)   NOT NULL,
    emp_no INTEGER   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
    FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

ALTER SEQUENCE dept_manager_dm_id_seq RESTART WITH 101 INCREMENT BY 1;

CREATE TABLE salaries (
    s_id SERIAL  PRIMARY KEY,
    emp_no INTEGER  NOT NULL,
    salary INTEGER   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

ALTER SEQUENCE salaries_s_id_seq RESTART WITH 3001 INCREMENT BY 1;

CREATE TABLE titles (
    t_id SERIAL  PRIMARY KEY,
    emp_no INTEGER   NOT NULL,
    title VARCHAR(30)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

ALTER SEQUENCE titles_t_id_seq RESTART WITH 5001 INCREMENT BY 1;
