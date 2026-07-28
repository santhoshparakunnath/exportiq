-- ============================================
-- ExportIQ
-- Migration: 004
-- Create Companies
-- ============================================

BEGIN;

CREATE TABLE companies (

    -- =====================================================
    -- Primary Key
    -- =====================================================
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    -- =====================================================
    -- Business Identifier
    -- Human readable identifier
    -- Example: CMP-000001
    -- =====================================================
    company_code VARCHAR(20) UNIQUE,

    -- =====================================================
    -- Golden Record
    -- Stable company information only
    -- =====================================================
    name TEXT NOT NULL,
    legal_name TEXT,
    website TEXT UNIQUE,

    -- =====================================================
    -- Primary Classification
    -- =====================================================
    business_vertical_id UUID NOT NULL,

    -- =====================================================
    -- Headquarters
    -- =====================================================
    country_id UUID NOT NULL,
    headquarters_city TEXT,

    -- =====================================================
    -- Company Facts
    -- =====================================================
    founded_year SMALLINT,
    employee_count INTEGER,

    -- =====================================================
    -- Lifecycle
    -- =====================================================
    status VARCHAR(20) NOT NULL DEFAULT 'DISCOVERED',

    -- =====================================================
    -- Verification
    -- =====================================================
    last_verified TIMESTAMPTZ,

    -- =====================================================
    -- Record Status
    -- =====================================================
    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    -- =====================================================
    -- Audit Fields
    -- =====================================================
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    -- =====================================================
    -- Foreign Keys
    -- =====================================================

    CONSTRAINT fk_companies_country
        FOREIGN KEY (country_id)
        REFERENCES countries(id),

    CONSTRAINT fk_companies_business_vertical
        FOREIGN KEY (business_vertical_id)
        REFERENCES business_verticals(id),

    -- =====================================================
    -- Validation
    -- =====================================================

    CONSTRAINT chk_company_code
        CHECK (
            company_code IS NULL
            OR company_code ~ '^CMP-[0-9]{6}$'
        ),

    CONSTRAINT chk_company_status
        CHECK (
            status IN (
                'DISCOVERED',
                'IDENTIFIED',
                'ENRICHED',
                'VERIFIED',
                'ACTIVE',
                'DORMANT',
                'ARCHIVED'
            )
        ),

    CONSTRAINT chk_founded_year
        CHECK (
            founded_year IS NULL
            OR founded_year BETWEEN 1800
            AND EXTRACT(YEAR FROM CURRENT_DATE)
        ),

    CONSTRAINT chk_employee_count
        CHECK (
            employee_count IS NULL
            OR employee_count >= 0
        )

);

COMMENT ON TABLE companies IS
'Golden Record for companies participating in global trade. Stores only stable business facts. Dynamic information such as AI analysis, products, certifications, contacts and data sources are stored in separate tables.';

COMMENT ON COLUMN companies.company_code IS
'Human readable business identifier (e.g. CMP-000001).';

COMMENT ON COLUMN companies.status IS
'Lifecycle status of the company record.';

COMMENT ON COLUMN companies.website IS
'Primary company website. Additional web profiles are stored in company_data_sources.';

COMMIT;
