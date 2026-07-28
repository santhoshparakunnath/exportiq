-- ============================================
-- ExportIQ
-- Migration: 002
-- Create Business Verticals
-- ============================================

CREATE TABLE IF NOT EXISTS business_verticals (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    name TEXT NOT NULL,
    description TEXT,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_business_vertical_name UNIQUE(name)
);

CREATE INDEX idx_business_vertical_name
ON business_verticals(name);
