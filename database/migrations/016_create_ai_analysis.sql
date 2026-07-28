BEGIN;

CREATE TABLE ai_analysis
(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    analysis_code VARCHAR(20) NOT NULL,

    entity_type_id UUID NOT NULL,
    entity_id UUID NOT NULL,

    ai_model_id UUID NOT NULL,
    ai_prompt_id UUID NOT NULL,

    analysis_type VARCHAR(50) NOT NULL,

    status VARCHAR(20) NOT NULL DEFAULT 'QUEUED',

    confidence_score SMALLINT,

    input_tokens INTEGER,
    output_tokens INTEGER,
    total_tokens INTEGER,

    processing_time_ms INTEGER,

    estimated_cost DECIMAL(10,4),

    input_hash VARCHAR(64),

    analysis_started_at TIMESTAMPTZ,
    analysis_completed_at TIMESTAMPTZ,

    error_message TEXT,

    metadata JSONB,

    is_latest BOOLEAN NOT NULL DEFAULT TRUE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_ai_analysis_code
        UNIQUE (analysis_code),

    CONSTRAINT fk_ai_analysis_entity_type
        FOREIGN KEY(entity_type_id)
        REFERENCES entity_types(id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_ai_analysis_model
        FOREIGN KEY(ai_model_id)
        REFERENCES ai_models(id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_ai_analysis_prompt
        FOREIGN KEY(ai_prompt_id)
        REFERENCES ai_prompts(id)
        ON DELETE RESTRICT,

    CONSTRAINT chk_ai_status
        CHECK
        (
            status IN
            (
                'QUEUED',
                'RUNNING',
                'COMPLETED',
                'FAILED',
                'REVIEWED',
                'APPROVED',
                'ARCHIVED'
            )
        ),

    CONSTRAINT chk_confidence
        CHECK
        (
            confidence_score IS NULL
            OR confidence_score BETWEEN 0 AND 100
        ),

    CONSTRAINT chk_analysis_type
        CHECK
        (
            analysis_type IN
            (
                'SUMMARY',
                'CLASSIFICATION',
                'TAGGING',
                'EMBEDDING',
                'RISK_ANALYSIS',
                'RECOMMENDATION',
                'SIMILARITY',
                'CUSTOM'
            )
        )
);

COMMENT ON TABLE ai_analysis IS
'Stores every AI execution performed against any ExportIQ entity.';

COMMENT ON COLUMN ai_analysis.analysis_code IS
'Business identifier (ANA-000001).';

COMMENT ON COLUMN ai_analysis.entity_type_id IS
'Type of entity analysed (Company, Contact, Product etc.).';

COMMENT ON COLUMN ai_analysis.entity_id IS
'Primary key of the analysed entity.';

COMMENT ON COLUMN ai_analysis.input_hash IS
'Hash of the input payload to detect duplicate analyses.';

COMMENT ON COLUMN ai_analysis.metadata IS
'Additional provider-specific metadata stored as JSON.';

COMMENT ON COLUMN ai_analysis.is_latest IS
'Indicates whether this is the most recent successful analysis for the entity and analysis type.';

COMMIT;
