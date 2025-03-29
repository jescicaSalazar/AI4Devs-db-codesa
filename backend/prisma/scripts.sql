CREATE TABLE COMPANY (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE EMPLOYEE (
    id SERIAL PRIMARY KEY,
    company_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    role VARCHAR(100) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (company_id) REFERENCES COMPANY(id) ON DELETE CASCADE
);

CREATE TABLE INTERVIEW_FLOW (
    id SERIAL PRIMARY KEY,
    description TEXT
);

CREATE TABLE POSITION (
    id SERIAL PRIMARY KEY,
    company_id INT NOT NULL,
    interview_flow_id INT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    status VARCHAR(50) NOT NULL,
    is_visible BOOLEAN DEFAULT TRUE,
    location VARCHAR(255),
    job_description TEXT,
    requirements TEXT,
    responsibilities TEXT,
    salary_min NUMERIC,
    salary_max NUMERIC,
    employment_type VARCHAR(50),
    benefits TEXT,
    company_description TEXT,
    application_deadline DATE,
    contact_info VARCHAR(255),
    FOREIGN KEY (company_id) REFERENCES COMPANY(id) ON DELETE CASCADE,
    FOREIGN KEY (interview_flow_id) REFERENCES INTERVIEW_FLOW(id) ON DELETE SET NULL
);

CREATE TABLE INTERVIEW_STEP (
    id SERIAL PRIMARY KEY,
    interview_flow_id INT NOT NULL,
    interview_type_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    order_index INT NOT NULL,
    FOREIGN KEY (interview_flow_id) REFERENCES INTERVIEW_FLOW(id) ON DELETE CASCADE
);

CREATE INDEX idx_employee_company ON EMPLOYEE(company_id);
CREATE INDEX idx_position_company ON POSITION(company_id);
CREATE INDEX idx_position_interview_flow ON POSITION(interview_flow_id);
