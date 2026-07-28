-- ============================================
-- ExportIQ
-- Migration: 010
-- Create Company Data Sources
-- ============================================

BEGIN;

CREATE TABLE company_data_sources (

    -- =====================================================
    -- Primary Key
    -- =====================================================
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    -- =====================================================
    -- Relationships
    -- =====================================================
    company_id UUID NOT NULL,

    -- =====================================================
    -- Source Information
    -- =====================================================
    source_type VARCHAR(50) NOT NULL,

    source_name VARCHAR(100),

    source_url TEXT NOT NULL,

    external_reference VARCHAR(255),

    -- =====================================================
    -- Data Quality
    -- =====================================================
    confidence_score NUMERIC(5,2),

    is_primary BOOLEAN NOT NULL DEFAULT FALSE,

    is_verified BOOLEAN NOT NULL DEFAULT FALSE,

    -- =====================================================
    -- Crawl Information
    -- =====================================================
    first_discovered_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    last_checked_at TIMESTAMPTZ,

    last_successful_sync_at TIMESTAMPTZ,

    next_scheduled_check_at TIMESTAMPTZ,

    -- =====================================================
    -- Status
    -- =====================================================
    status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',

    last_error TEXT,

    -- =====================================================
    -- Audit
    -- =====================================================
    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    -- =====================================================
    -- Foreign Keys
    -- =====================================================

    CONSTRAINT fk_cds_company
        FOREIGN KEY (company_id)
        REFERENCES companies(id)
        ON DELETE CASCADE,

    -- =====================================================
    -- Validation
    -- =====================================================

    CONSTRAINT chk_source_type
        CHECK (
            source_type IN (
                'WEBSITE',
                'LINKEDIN',
                'TRADE_DIRECTORY',
                'GOVERNMENT_REGISTRY',
                'CUSTOMS_DATA',
                'MARKETPLACE',
                'SOCIAL_MEDIA',
                'NEWS',
                'MANUAL',
                'AI_DISCOVERED',
                'OTHER'
            )
        ),

    CONSTRAINT chk_status
        CHECK (
            status IN (
                'ACTIVE',
                'INACTIVE',
                'ERROR',
                'ARCHIVED'
            )
        ),

    CONSTRAINT chk_confidence
        CHECK (
            confidence_score IS NULL
            OR (
                confidence_score >= 0
                AND confidence_score <= 100
            )
        )

);

COMMENT ON TABLE company_data_sources IS
'Tracks all external data sources used to build and verify the company Golden Record.';

COMMENT ON COLUMN company_data_sources.source_type IS
'Classification of the external source.';

COMMENT ON COLUMN company_data_sources.external_reference IS
'External identifier such as registry number, marketplace ID or LinkedIn Company ID.';

COMMENT ON COLUMN company_data_sources.confidence_score IS
'Confidence score assigned by AI or data ingestion pipeline.';

COMMENT ON COLUMN company_data_sources.is_primary IS
'Indicates the preferred source for company information.';

COMMENT ON COLUMN company_data_sources.is_verified IS
'True if the source has been manually or automatically verified.';

COMMIT;
