-- ============================================
-- ExportIQ
-- Migration: 004
-- Create Companies
-- ============================================

CREATE TABLE IF NOT EXISTS companies (

    -- Primary Key
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    -- Business Identifier
    company_code VARCHAR(20) UNIQUE,

    -- Basic Information
    name TEXT NOT NULL,
    legal_name TEXT,
    description TEXT,

    -- Online Presence
    website TEXT,
    linkedin_url TEXT,

    -- Contact Information
    email TEXT,
    phone TEXT,

    -- Headquarters
    country_id UUID,
    headquarters_city TEXT,

    -- Company Details
    employee_count INTEGER,
    founded_year SMALLINT,
    annual_revenue NUMERIC(18,2),

    -- Data Source
    source TEXT,
    source_url TEXT,
    last_verified TIMESTAMPTZ,

    -- Status
    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    -- Audit
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    -- Relationships
    CONSTRAINT fk_company_country
        FOREIGN KEY (country_id)
        REFERENCES countries(id)
);
