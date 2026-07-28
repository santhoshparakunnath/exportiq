-- ============================================
-- ExportIQ
-- Migration: 008
-- Create Company Products
-- ============================================

BEGIN;

CREATE TABLE company_products (

    -- =====================================================
    -- Primary Key
    -- =====================================================
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    -- =====================================================
    -- Relationships
    -- =====================================================
    company_id UUID NOT NULL,
    product_id UUID NOT NULL,
    role_id UUID NOT NULL,

    -- =====================================================
    -- Product Relationship
    -- =====================================================
    is_primary BOOLEAN NOT NULL DEFAULT FALSE,

    relationship_start_date DATE,

    relationship_end_date DATE,

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

    CONSTRAINT fk_cp_company
        FOREIGN KEY (company_id)
        REFERENCES companies(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_cp_product
        FOREIGN KEY (product_id)
        REFERENCES products(id),

    CONSTRAINT fk_cp_role
        FOREIGN KEY (role_id)
        REFERENCES roles(id),

    -- =====================================================
    -- Business Rules
    -- =====================================================

    CONSTRAINT uq_company_product_role
        UNIQUE (
            company_id,
            product_id,
            role_id
        ),

    CONSTRAINT chk_confidence
        CHECK (
            confidence_score IS NULL
            OR (
                confidence_score >= 0
                AND confidence_score <= 100
            )
        ),

    CONSTRAINT chk_relationship_dates
        CHECK (
            relationship_end_date IS NULL
            OR relationship_start_date IS NULL
            OR relationship_end_date >= relationship_start_date
        )

);

COMMENT ON TABLE company_products IS
'Associates companies with products and the business role they perform for that product.';

COMMIT;
