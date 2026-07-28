-- ============================================
-- ExportIQ
-- Company Role Assignment Indexes
-- ============================================

BEGIN;

CREATE INDEX idx_cra_company
ON company_role_assignments(company_id);

CREATE INDEX idx_cra_role
ON company_role_assignments(role_id);

CREATE INDEX idx_cra_primary
ON company_role_assignments(is_primary);

CREATE INDEX idx_cra_active
ON company_role_assignments(is_active);

COMMIT;
