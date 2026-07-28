BEGIN;

CREATE TABLE entity_types
(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    entity_type_code VARCHAR(20) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_entity_type_code UNIQUE(entity_type_code),
    CONSTRAINT uq_entity_type_name UNIQUE(name)
);

COMMENT ON TABLE entity_types IS
'Master list of all entity types supported by ExportIQ.';

COMMENT ON COLUMN entity_types.entity_type_code IS
'Business identifier (ENT-000001).';

COMMIT;
