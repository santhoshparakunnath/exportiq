BEGIN;

CREATE TABLE ai_tags
(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    ai_analysis_id UUID NOT NULL,

    tag VARCHAR(100) NOT NULL,

    confidence_score SMALLINT,

    category VARCHAR(50),

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_ai_tags_analysis
        FOREIGN KEY(ai_analysis_id)
        REFERENCES ai_analysis(id)
        ON DELETE CASCADE,

    CONSTRAINT chk_tag_confidence
        CHECK
        (
            confidence_score BETWEEN 0 AND 100
        )
);

COMMENT ON TABLE ai_tags IS
'AI generated keywords and classifications.';

COMMIT;
