-- ============================================
-- ExportIQ
-- Company Certifications Indexes
-- ============================================

BEGIN;

CREATE INDEX idx_company_certifications_company
ON company_certifications(company_id);

CREATE INDEX idx_company_certifications_certification
ON company_certifications(certification_id);

CREATE INDEX idx_company_certifications_status
ON company_certifications(verification_status);

CREATE INDEX idx_company_certifications_expiry
ON company_certifications(expiry_date);

CREATE INDEX idx_company_certifications_active
ON company_certifications(is_active);

COMMIT;
