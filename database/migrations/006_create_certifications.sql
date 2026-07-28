-- ============================================
-- ExportIQ
-- Migration: 006
-- Create Certifications
-- ============================================

BEGIN;

CREATE TABLE certifications (

    -- =====================================================
    -- Primary Key
    -- =====================================================
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    -- =====================================================
    -- Business Identifier
    -- Example: CRT-000001
    -- =====================================================
    certification_code VARCHAR(20) UNIQUE,

    -- =====================================================
    -- Certification Information
    -- =====================================================
    name TEXT NOT NULL,
    short_name VARCHAR(50),
    description TEXT,

    -- =====================================================
    -- Issuing Information
    -- =====================================================
    issuing_authority TEXT,

    -- =====================================================
    -- Scope
    -- Examples:
    -- Food
    -- Agriculture
    -- Manufacturing
    -- Pharmaceuticals
    -- General
    -- =====================================================
    scope VARCHAR(100),

    -- =====================================================
    -- Status
    -- =====================================================
    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    -- =====================================================
    -- Audit
    -- =====================================================
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    -- =====================================================
    -- Validation
    -- =====================================================

    CONSTRAINT chk_certification_code
        CHECK (
            certification_code IS NULL
            OR certification_code ~ '^CRT-[0-9]{6}$'
        ),

    CONSTRAINT uq_certification_name
        UNIQUE (name)

);

COMMENT ON TABLE certifications IS
'Master list of certifications that companies may hold.';

COMMENT ON COLUMN certifications.certification_code IS
'Human readable certification identifier (e.g. CRT-000001).';

COMMIT;
