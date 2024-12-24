CREATE TABLE company (
    company_id VARCHAR(20) NOT NULL,
    company_name VARCHAR(500) NOT NULL,
    ceo VARCHAR(200) NOT NULL,
    revenue NUMERIC(20,2) NULL,
    created_by VARCHAR(50) NOT NULL,
    created_at timestamptz NOT NULL DEFAULT NOW(),
    updated_by VARCHAR(50) NOT NULL,
    updated_at timestamptz NOT NULL DEFAULT NOW(),
    deleted_by VARCHAR(50) NULL,
    deleted_at timestamptz NULL,
    id bigserial NOT NULL,
    CONSTRAINT company_pk PRIMARY KEY (company_id)
);
CREATE INDEX company_deleted_at_idx ON company USING btree (deleted_at);

CREATE TABLE employee (
    employee_id VARCHAR(20) NOT NULL,
    employee_name VARCHAR(500) NOT NULL,
    salary NUMERIC(10,2) NULL,
    project VARCHAR(500) NULL,
    company_id VARCHAR(20) NOT NULL,
    created_by VARCHAR(50) NOT NULL,
    created_at timestamptz NOT NULL DEFAULT NOW(),
    updated_by VARCHAR(50) NOT NULL,
    updated_at timestamptz NOT NULL DEFAULT NOW(),
    deleted_by VARCHAR(50) NULL,
    deleted_at timestamptz NULL,
    id bigserial NOT NULL,
    CONSTRAINT employee_pk PRIMARY KEY (employee_id),
    CONSTRAINT fk_company_employee FOREIGN KEY (company_id) REFERENCES company(company_id)
);
CREATE INDEX employee_deleted_at_idx ON employee USING btree (deleted_at);
