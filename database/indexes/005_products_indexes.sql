-- ============================================
-- ExportIQ
-- Products Indexes
-- ============================================

BEGIN;

CREATE INDEX idx_products_name
    ON products(name);

CREATE INDEX idx_products_hs_code
    ON products(hs_code);

CREATE INDEX idx_products_business_vertical
    ON products(business_vertical_id);

CREATE INDEX idx_products_active
    ON products(is_active);

COMMIT;
