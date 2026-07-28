CREATE TABLE roles (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    role_code VARCHAR(20) UNIQUE,

    name TEXT NOT NULL,

    description TEXT,

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_company_role_name UNIQUE(name),

    CONSTRAINT chk_role_code
        CHECK (
            role_code IS NULL
            OR role_code ~ '^ROL-[0-9]{6}$'
        )
);
