-- ============================================
-- ExportIQ
-- Indexes - Companies
-- Version: 1.0
-- ============================================

BEGIN;

--------------------------------------------------
-- Company Name
--------------------------------------------------
CREATE INDEX IF NOT EXISTS idx_companies_name
ON companies(name);

--------------------------------------------------
-- Website
--------------------------------------------------
CREATE INDEX IF NOT EXISTS idx_companies_website
ON companies(website);

--------------------------------------------------
-- Country
--------------------------------------------------
CREATE INDEX IF NOT EXISTS idx_companies_country
ON companies(country_id);

--------------------------------------------------
-- Company Code
--------------------------------------------------
CREATE UNIQUE INDEX IF NOT EXISTS idx_companies_company_code
ON companies(company_code);

--------------------------------------------------
-- Active Companies
--------------------------------------------------
CREATE INDEX IF NOT EXISTS idx_companies_is_active
ON companies(is_active);

--------------------------------------------------
-- Created Date
--------------------------------------------------
CREATE INDEX IF NOT EXISTS idx_companies_created_at
ON companies(created_at);

COMMIT;
