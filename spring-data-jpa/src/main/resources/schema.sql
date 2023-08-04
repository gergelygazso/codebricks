/* ***************************************************************
***************************CREATING TABLES************************
**************************************************************** */
CREATE TABLE regions (
                         region_id INT NOT NULL,
                         region_name VARCHAR(25),
                         PRIMARY KEY (region_id)
);

CREATE TABLE countries (
                           country_id VARCHAR(2) NOT NULL,
                           country_name VARCHAR(40),
                           region_id INT NOT NULL,
                           PRIMARY KEY (country_id)
);

CREATE TABLE locations (
                           location_id INT NOT NULL AUTO_INCREMENT,
                           street_address VARCHAR(40),
                           postal_code VARCHAR(12),
                           city VARCHAR(30) NOT NULL,
                           state_province VARCHAR(25),
                           country_id VARCHAR(2) NOT NULL,
                           PRIMARY KEY (location_id)
);

CREATE TABLE departments (
                             department_id INT NOT NULL,
                             department_name VARCHAR(30) NOT NULL,
                             manager_id INT ,
                             location_id INT,
                             PRIMARY KEY (department_id)
);

CREATE TABLE jobs (
                      job_id VARCHAR(10) NOT NULL,
                      job_title VARCHAR(35) NOT NULL,
                      min_salary DECIMAL(8, 0) ,
                      max_salary DECIMAL(8, 0) ,
                      PRIMARY KEY (job_id)
);

CREATE TABLE employees (
                           employee_id INT  NOT NULL,
                           first_name VARCHAR(20),
                           last_name VARCHAR(25) NOT NULL,
                           email VARCHAR(25) NOT NULL,
                           phone_number VARCHAR(20),
                           hire_date DATE,
                           job_id VARCHAR(10) NOT NULL,
                           salary DECIMAL(8, 2) NOT NULL,
                           commission_pct DECIMAL(2, 2),
                           manager_id INT,
                           department_id INT,
                           PRIMARY KEY (employee_id)
);

CREATE TABLE job_history (
                             employee_id INT  NOT NULL,
                             start_date DATE,
                             end_date DATE,
                             job_id VARCHAR(10) NOT NULL,
                             department_id INT  NOT NULL
);


CREATE UNIQUE INDEX UI_job_history ON job_history(
    employee_id,
    start_date
    );

/* ***************************************************************
***************************FOREIGN KEYS***************************
**************************************************************** */
ALTER TABLE countries ADD FOREIGN KEY (region_id) REFERENCES regions(region_id);
ALTER TABLE locations ADD FOREIGN KEY (country_id) REFERENCES countries(country_id);
ALTER TABLE departments ADD FOREIGN KEY (location_id) REFERENCES locations(location_id);
ALTER TABLE employees ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id);
ALTER TABLE employees ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);
ALTER TABLE employees ADD FOREIGN KEY (manager_id) REFERENCES employees(employee_id);
ALTER TABLE departments ADD FOREIGN KEY (manager_id) REFERENCES employees (employee_id);
ALTER TABLE job_history ADD FOREIGN KEY (employee_id) REFERENCES employees(employee_id);
ALTER TABLE job_history ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id);
ALTER TABLE job_history ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);
