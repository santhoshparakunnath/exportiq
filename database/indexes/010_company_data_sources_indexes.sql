-- ============================================
-- ExportIQ
-- Company Data Sources Indexes
-- ============================================

BEGIN;

CREATE INDEX idx_cds_company
ON company_data_sources(company_id);

CREATE INDEX idx_cds_source_type
ON company_data_sources(source_type);

CREATE INDEX idx_cds_status
ON company_data_sources(status);

CREATE INDEX idx_cds_verified
ON company_data_sources(is_verified);

CREATE INDEX idx_cds_primary
ON company_data_sources(is_primary);

CREATE INDEX idx_cds_next_check
ON company_data_sources(next_scheduled_check_at);

CREATE INDEX idx_cds_active
ON company_data_sources(is_active);

COMMIT;
