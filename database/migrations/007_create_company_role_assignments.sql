-- ============================================
-- ExportIQ
-- Migration: 007
-- Create Company Role Assignments
-- ============================================

BEGIN;

CREATE TABLE company_role_assignments (

    -- =====================================================
    -- Primary Key
    -- =====================================================
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    -- =====================================================
    -- Relationships
    -- =====================================================
    company_id UUID NOT NULL,
    role_id UUID NOT NULL,

    -- =====================================================
    -- Status
    -- =====================================================
    is_primary BOOLEAN NOT NULL DEFAULT FALSE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    -- =====================================================
    -- Audit
    -- =====================================================
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    -- =====================================================
    -- Foreign Keys
    -- =====================================================
    CONSTRAINT fk_cra_company
        FOREIGN KEY (company_id)
        REFERENCES companies(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_cra_role
        FOREIGN KEY (role_id)
        REFERENCES roles(id),

    -- =====================================================
    -- Business Rules
    -- =====================================================
    CONSTRAINT uq_company_role
        UNIQUE (company_id, role_id)

);

COMMENT ON TABLE company_role_assignments IS
'Assigns one or more business roles to a company.';

COMMIT;
