BEGIN;

CREATE TABLE ai_models
(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    model_code VARCHAR(20) NOT NULL,

    provider VARCHAR(100) NOT NULL,

    model_name VARCHAR(150) NOT NULL,

    model_version VARCHAR(100),

    description TEXT,

    supports_embeddings BOOLEAN NOT NULL DEFAULT FALSE,
    supports_chat BOOLEAN NOT NULL DEFAULT TRUE,
    supports_function_calling BOOLEAN NOT NULL DEFAULT FALSE,

    max_input_tokens INTEGER,
    max_output_tokens INTEGER,

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_ai_model_code UNIQUE(model_code),

    CONSTRAINT uq_ai_provider_model
        UNIQUE(provider, model_name, model_version)
);

COMMENT ON TABLE ai_models IS
'Master list of AI models supported by ExportIQ.';

COMMENT ON COLUMN ai_models.model_code IS
'Business identifier (AIM-000001).';

COMMIT;
