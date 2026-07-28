CREATE INDEX idx_company_employments_company
ON company_employments(company_id);

CREATE INDEX idx_company_employments_contact
ON company_employments(contact_id);

CREATE INDEX idx_company_employments_role
ON company_employments(role_id);

CREATE INDEX idx_company_employments_job_title
ON company_employments(job_title);

CREATE INDEX idx_company_employments_department
ON company_employments(department);

CREATE INDEX idx_company_employments_decision_level
ON company_employments(decision_level);

CREATE INDEX idx_company_employments_current
ON company_employments(is_current);

CREATE INDEX idx_company_employments_active
ON company_employments(is_active);

CREATE INDEX idx_company_employments_verified
ON company_employments(is_verified);

CREATE INDEX idx_company_employments_work_email
ON company_employments(work_email);

CREATE INDEX idx_company_employments_start_date
ON company_employments(start_date);
