-- ============================================
-- ExportIQ
-- Migration: 005
-- Create Products
-- ============================================

BEGIN;

CREATE TABLE products (

    -- =====================================================
    -- Primary Key
    -- =====================================================
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    -- =====================================================
    -- Business Identifier
    -- Example: PRD-000001
    -- =====================================================
    product_code VARCHAR(20) UNIQUE,

    -- =====================================================
    -- Product Information
    -- =====================================================
    name TEXT NOT NULL,
    scientific_name TEXT,
    description TEXT,

    -- =====================================================
    -- Trade Classification
    -- =====================================================
    hs_code VARCHAR(20),

    -- =====================================================
    -- Business Classification
    -- =====================================================
    business_vertical_id UUID NOT NULL,

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

    CONSTRAINT fk_products_business_vertical
        FOREIGN KEY (business_vertical_id)
        REFERENCES business_verticals(id),

    -- =====================================================
    -- Validation
    -- =====================================================

    CONSTRAINT chk_product_code
        CHECK (
            product_code IS NULL
            OR product_code ~ '^PRD-[0-9]{6}$'
        ),

    CONSTRAINT uq_product_name_hs
        UNIQUE (name, hs_code)

);

COMMENT ON TABLE products IS
'Master list of products traded globally. Products exist independently of companies.';

COMMENT ON COLUMN products.product_code IS
'Human readable product identifier (e.g. PRD-000001).';

COMMENT ON COLUMN products.hs_code IS
'Harmonized System (HS) trade classification code.';

COMMIT;
