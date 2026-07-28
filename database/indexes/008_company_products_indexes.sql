-- ============================================
-- ExportIQ
-- Company Products Indexes
-- ============================================

BEGIN;

CREATE INDEX idx_company_products_company
ON company_products(company_id);

CREATE INDEX idx_company_products_product
ON company_products(product_id);

CREATE INDEX idx_company_products_role
ON company_products(role_id);

CREATE INDEX idx_company_products_primary
ON company_products(is_primary);

CREATE INDEX idx_company_products_active
ON company_products(is_active);

COMMIT;
