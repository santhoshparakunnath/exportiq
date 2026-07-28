BEGIN;

CREATE TABLE ai_embeddings
(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    ai_analysis_id UUID NOT NULL,

    embedding_model VARCHAR(100),

    embedding_dimensions INTEGER,

    embedding VECTOR(1536),

    generated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT fk_embedding_analysis
        FOREIGN KEY(ai_analysis_id)
        REFERENCES ai_analysis(id)
        ON DELETE CASCADE
);

COMMENT ON TABLE ai_embeddings IS
'Vector embeddings used for semantic search.';

COMMIT;
