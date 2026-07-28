-- ============================================
-- ExportIQ
-- Certifications Indexes
-- ============================================

BEGIN;

CREATE INDEX idx_certifications_name
    ON certifications(name);

CREATE INDEX idx_certifications_scope
    ON certifications(scope);

CREATE INDEX idx_certifications_active
    ON certifications(is_active);

COMMIT;
