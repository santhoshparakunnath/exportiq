-- ============================================
-- ExportIQ
-- Companies Indexes
-- ============================================

BEGIN;

CREATE INDEX idx_companies_name
    ON companies(name);

CREATE INDEX idx_companies_country
    ON companies(country_id);

CREATE INDEX idx_companies_status
    ON companies(status);

CREATE INDEX idx_companies_is_active
    ON companies(is_active);

CREATE INDEX idx_companies_last_verified
    ON companies(last_verified);

COMMIT;
