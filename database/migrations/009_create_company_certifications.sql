-- ============================================
-- ExportIQ
-- Migration: 009
-- Create Company Certifications
-- ============================================

BEGIN;

CREATE TABLE company_certifications (

    -- =====================================================
    -- Primary Key
    -- =====================================================
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    -- =====================================================
    -- Relationships
    -- =====================================================
    company_id UUID NOT NULL,
    certification_id UUID NOT NULL,

    -- =====================================================
    -- Certificate Details
    -- =====================================================
    certificate_number VARCHAR(100),

    issuing_body TEXT,

    issue_date DATE,

    expiry_date DATE,

    verification_date DATE,

    -- =====================================================
    -- Verification
    -- =====================================================
    verification_status VARCHAR(20) NOT NULL DEFAULT 'UNVERIFIED',

    confidence_score NUMERIC(5,2),

    notes TEXT,

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
    -- Foreign Keys
    -- =====================================================

    CONSTRAINT fk_cc_company
        FOREIGN KEY (company_id)
        REFERENCES companies(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_cc_certification
        FOREIGN KEY (certification_id)
        REFERENCES certifications(id),

    -- =====================================================
    -- Validation
    -- =====================================================

    CONSTRAINT chk_verification_status
        CHECK (
            verification_status IN (
                'UNVERIFIED',
                'PENDING',
                'VERIFIED',
                'EXPIRED',
                'REVOKED'
            )
        ),

    CONSTRAINT chk_confidence
        CHECK (
            confidence_score IS NULL
            OR (
                confidence_score >= 0
                AND confidence_score <= 100
            )
        ),

    CONSTRAINT chk_certificate_dates
        CHECK (
            expiry_date IS NULL
            OR issue_date IS NULL
            OR expiry_date >= issue_date
        )

);

COMMENT ON TABLE company_certifications IS
'Certificates held by companies, including issue and expiry information.';

COMMIT;
