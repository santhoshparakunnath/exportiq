-- ============================================
-- ExportIQ
-- Migration: 004
-- Create Companies
-- ============================================

BEGIN;

CREATE TABLE IF NOT EXISTS companies (

    -- ============================================
    -- Primary Key
    -- ============================================
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    -- ============================================
    -- Business Identifier
    -- Human-friendly unique identifier
    -- Example: CMP-000001
    -- ============================================
    company_code VARCHAR(20) UNIQUE,

    -- ============================================
    -- Golden Record
    -- Stable business facts only
    -- ============================================
    name TEXT NOT NULL,
    legal_name TEXT,
    website TEXT UNIQUE,

    -- ============================================
    -- Headquarters
    -- ============================================
    country_id UUID NOT NULL,
    headquarters_city TEXT,

    -- ============================================
    -- Company Attributes
    -- ============================================
    founded_year SMALLINT,
    employee_count INTEGER,

    -- ============================================
    -- Company Lifecycle
    -- ============================================
    status VARCHAR(20) NOT NULL DEFAULT 'DISCOVERED',

    -- ============================================
    -- Verification
    -- ============================================
    last_verified TIMESTAMPTZ,

    -- ============================================
    -- Record Status
    -- ============================================
    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    -- ============================================
    -- Audit
    -- ============================================
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    -- ============================================
    -- Foreign Keys
    -- ============================================
    CONSTRAINT fk_companies_country
        FOREIGN KEY (country_id)
        REFERENCES countries(id),

    -- ============================================
    -- Business Rules
    -- ============================================

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

COMMIT;
