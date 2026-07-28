BEGIN;

CREATE TABLE ai_prompts
(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    prompt_code VARCHAR(20) NOT NULL,

    name VARCHAR(200) NOT NULL,

    description TEXT,

    prompt_template TEXT NOT NULL,

    prompt_version INTEGER NOT NULL DEFAULT 1,

    category VARCHAR(100),

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_prompt_code UNIQUE(prompt_code)
);

COMMENT ON TABLE ai_prompts IS
'Reusable AI prompt templates.';

COMMIT;
