CREATE INDEX idx_ai_analysis_entity
ON ai_analysis(entity_type_id, entity_id);

CREATE INDEX idx_ai_analysis_model
ON ai_analysis(ai_model_id);

CREATE INDEX idx_ai_analysis_prompt
ON ai_analysis(ai_prompt_id);

CREATE INDEX idx_ai_analysis_status
ON ai_analysis(status);

CREATE INDEX idx_ai_analysis_type
ON ai_analysis(analysis_type);

CREATE INDEX idx_ai_analysis_latest
ON ai_analysis(is_latest);

CREATE INDEX idx_ai_analysis_created
ON ai_analysis(created_at DESC);

CREATE INDEX idx_ai_analysis_completed
ON ai_analysis(analysis_completed_at DESC);

CREATE INDEX idx_ai_analysis_active
ON ai_analysis(is_active);
