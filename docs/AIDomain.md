# AI Domain

## Purpose

The AI Domain provides intelligence, analysis, recommendations and semantic understanding across the ExportIQ platform.

Unlike traditional systems, AI is treated as an independent domain rather than being embedded into individual business entities.

The AI Domain analyses business data but never owns or modifies the Golden Record.

---

# Vision

Every business entity within ExportIQ can be analysed by AI.

Examples

- Companies
- Contacts
- Products
- Certifications
- Trade Transactions
- News Articles
- Websites
- Documents

The AI framework should analyse any entity without requiring separate AI tables for each domain.

---

# Design Principles

## AI Never Owns Business Data

Business data belongs to its respective domain.

Examples

Company Domain

- Company Name
- Website
- Country
- Products

People Domain

- Contact Name
- Job Title

Product Domain

- Product Name
- HS Code

AI enriches these entities but never replaces verified business facts.

---

## Golden Record Principle

AI generated information must never overwrite verified data.

Instead AI generates

- summaries
- recommendations
- tags
- classifications
- insights
- scores

These remain separate from the Golden Record.

---

## AI Analysis is Immutable

Each AI execution creates a new analysis record.

Example

```
ABC Spices

↓

Analysis #1

GPT-5.5

January 2027

↓

Analysis #2

GPT-6

April 2027

↓

Analysis #3

Custom ExportIQ Model

August 2027
```

Historical analyses are preserved.

---

## Generic AI Framework

ExportIQ uses one AI framework for all entities.

Instead of

```
company_ai_analysis

product_ai_analysis

contact_ai_analysis
```

ExportIQ uses

```
ai_analysis
```

with

```
entity_type

entity_id
```

This makes the framework reusable across every domain.

---

# AI Architecture

```
                AI Analysis
                     │
        ┌────────────┼────────────┐
        ▼            ▼            ▼
    Companies     Contacts     Products
        │            │            │
        └────────────┼────────────┘
                     │
              Golden Record
```

---

# AI Responsibilities

The AI Domain is responsible for

- Company summaries
- Contact summaries
- Product summaries
- Classification
- Similarity matching
- Duplicate detection
- Recommendation generation
- Opportunity scoring
- Risk analysis
- Sentiment analysis
- Entity tagging
- Embedding generation
- Semantic search
- Prompt management
- Model management

---

# AI Analysis Lifecycle

```
QUEUED

↓

RUNNING

↓

COMPLETED

↓

REVIEWED

↓

APPROVED

↓

ARCHIVED
```

---

# AI Analysis

Every analysis contains

- Entity Type
- Entity ID
- Prompt Version
- Model Version
- Execution Date
- Confidence Score
- Processing Time
- Input Tokens
- Output Tokens
- Cost
- Status

---

# AI Summary

Every analysis may generate

- Executive Summary
- Business Overview
- Strengths
- Weaknesses
- Opportunities
- Risks

These are generated artifacts.

They are not business facts.

---

# AI Recommendations

AI may recommend

- Potential Buyers
- Potential Suppliers
- Similar Companies
- Cross-selling Opportunities
- Missing Certifications
- Market Expansion
- Follow-up Actions

Recommendations should always reference supporting evidence.

---

# AI Tags

AI automatically classifies entities.

Example

ABC Spices

↓

Organic

Exporter

Premium Supplier

ISO Certified

Private Company

India

Spices

SME

These tags improve search and filtering.

---

# AI Confidence

Every generated result includes a confidence score.

Example

95%

Verified by company website

85%

Multiple independent sources

60%

Trade directory

30%

AI inferred

Confidence indicates reliability.

It is not a business fact.

---

# Embeddings

Embeddings enable semantic search.

Examples

Find companies similar to

ABC Spices

Find buyers similar to

Nestlé

Find products similar to

Green Cardamom

Embeddings should be regenerated whenever important business facts change.

---

# Prompt Management

Every AI execution records

- Prompt Template
- Prompt Version
- Parameters
- Temperature
- Model

This guarantees reproducibility.

---

# Model Management

The platform may use multiple models.

Examples

- OpenAI GPT
- Anthropic Claude
- Gemini
- Local LLM
- ExportIQ Fine-tuned Model

The model used for every analysis is recorded.

---

# Human Review

AI output may be

- Accepted
- Edited
- Rejected

Human feedback improves future AI performance.

---

# AI Should Never

AI must never

- Modify the Golden Record
- Delete business data
- Replace verified facts
- Remove evidence
- Hide provenance

---

# Database Objects

The AI Domain will initially contain

```
ai_analysis

ai_summaries

ai_recommendations

ai_tags

ai_embeddings

ai_models

ai_prompts

ai_jobs
```

Future tables

```
ai_feedback

ai_cost_tracking

ai_cache

ai_conversations

ai_workflows

ai_agents
```

---

# Guiding Principles

- AI is a domain, not a feature.
- AI enriches business data but never owns it.
- Preserve every analysis.
- Every AI output has provenance.
- Every AI output has confidence.
- Every AI execution is reproducible.
- The framework must analyse any entity.
- Build one reusable AI platform rather than multiple AI implementations.
