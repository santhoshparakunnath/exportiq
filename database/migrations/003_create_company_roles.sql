CREATE TABLE IF NOT EXISTS company_roles (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    name TEXT NOT NULL,

    description TEXT,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_company_role UNIQUE(name)
);

CREATE INDEX idx_company_role_name
ON company_roles(name);
