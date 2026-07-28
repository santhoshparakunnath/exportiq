# Platform Architecture

# Purpose

Platform Architecture describes how all domains within ExportIQ work together to transform raw business information into actionable trade intelligence.

It defines the responsibilities of each domain, the flow of information through the platform, and the principles that govern the overall architecture.

This document is intended to provide a complete end-to-end view of the ExportIQ platform.

---

# Vision

ExportIQ is an AI-powered Global Trade Intelligence Platform.

Its purpose is to continuously discover, validate, enrich and organise information about companies, products, people and global trade.

Unlike a CRM, ExportIQ does not manage customer relationships.

Unlike an ERP, ExportIQ does not manage business operations.

Instead, ExportIQ builds a trusted knowledge base of global trade participants and uses AI to generate intelligence and business insights.

---

# Core Principles

The platform is built around several key principles.

## Golden Record

Every business entity has a single trusted representation.

Business entities include:

- Companies
- People
- Products
- Certifications
- Trade Records

The Golden Record represents verified business facts.

---

## Evidence First

Every business fact must be traceable to its source.

Nothing exists without provenance.

Every piece of information should answer:

- Where did it come from?
- When was it discovered?
- How reliable is it?
- Can it be verified?

---

## AI Enrichment

AI enhances business data.

AI never owns business data.

AI never replaces verified facts.

AI generates:

- Summaries
- Tags
- Recommendations
- Similarity
- Risk Analysis
- Opportunity Scoring
- Embeddings

---

## Domain Driven Design

Each business capability belongs to a single domain.

Each domain owns its own data and business rules.

Domains collaborate through well-defined relationships.

---

# Platform Overview

```
                           External Sources
                                   │
                                   ▼
                     Data Acquisition & Discovery
                                   │
                                   ▼
                        Entity Resolution Engine
                                   │
                                   ▼
                           Golden Record Layer
                                   │
          ┌────────────────────────┼────────────────────────┐
          ▼                        ▼                        ▼
     Company Domain          People Domain          Product Domain
          │                        │                        │
          └────────────────────────┼────────────────────────┘
                                   ▼
                         Certification Domain
                                   │
                                   ▼
                           AI Intelligence Layer
                                   │
                ┌──────────────────┼──────────────────┐
                ▼                  ▼                  ▼
         Semantic Search     Recommendations     Knowledge Graph
                                   │
                                   ▼
                           REST APIs / GraphQL
                                   │
                                   ▼
                              Web Application
```

---

# Platform Layers

## 1. Data Acquisition Layer

Responsible for discovering information from external sources.

Examples

- Company websites
- Government registries
- Trade directories
- Customs data
- Import/export databases
- LinkedIn
- News
- Public APIs
- CSV imports

Responsibilities

- Discovery
- Crawling
- Retrieval
- Parsing
- Extraction

---

## 2. Entity Resolution Layer

Determines whether newly discovered information belongs to an existing entity.

Responsibilities

- Duplicate detection
- Identity matching
- Record merging
- Conflict detection
- Confidence scoring

Matching uses

- Registration numbers
- Website
- Email domain
- Phone
- LinkedIn
- AI similarity

---

## 3. Golden Record Layer

Stores trusted business entities.

This is the authoritative source of truth.

Entities include

- Companies
- Contacts
- Products
- Certifications

Only verified business facts belong here.

---

## 4. Evidence Layer

Every business fact is supported by evidence.

Evidence includes

- Source
- Discovery date
- Verification status
- Confidence score

The Evidence Layer provides complete traceability.

---

## 5. AI Intelligence Layer

AI transforms business data into intelligence.

Responsibilities

- Summaries
- Classification
- Recommendations
- Risk analysis
- Similarity analysis
- Missing information detection
- Embedding generation

AI analyses entities without modifying them.

---

## 6. Search Layer

Provides intelligent search capabilities.

Includes

- Full-text search
- Semantic search
- Autocomplete
- Filtering
- Similar company search

Search indexes are generated from the Golden Record.

---

## 7. API Layer

Exposes platform functionality to applications.

Future APIs include

- Company Search
- Company Details
- Product Search
- Contact Search
- AI Insights
- Recommendations
- Similar Companies
- Trade Intelligence

---

## 8. Presentation Layer

Provides user interaction.

Future clients may include

- Web Portal
- Mobile App
- Partner APIs
- AI Agents
- Internal Administration Portal

---

# Platform Domains

## Company Domain

Owns

- Companies
- Business Verticals
- Roles
- Relationships

---

## People Domain

Owns

- Contacts
- Employment
- Decision Makers
- Departments

---

## Product Domain

Owns

- Products
- HS Codes
- Product Categories

---

## Certification Domain

Owns

- Certifications
- Company Certifications

---

## Data Ingestion Domain

Owns

- Discovery
- Crawling
- Parsing
- Normalisation
- Entity Resolution

---

## AI Domain

Owns

- AI Analysis
- Summaries
- Recommendations
- Tags
- Embeddings
- Prompt Management

---

## Search Domain

Owns

- Full-text Indexes
- Vector Indexes
- Search Ranking
- Suggestions

---

## Future Trade Domain

Will own

- Importers
- Exporters
- Shipments
- Trade Relationships
- Ports
- Countries
- Buyers
- Suppliers

---

# Platform Workflow

```
External Source

↓

Discover

↓

Retrieve

↓

Parse

↓

Extract Entities

↓

Normalize

↓

Resolve Identity

↓

Generate Evidence

↓

Merge Golden Record

↓

AI Analysis

↓

Generate Embeddings

↓

Update Search

↓

Available to Users
```

---

# Platform Characteristics

The platform should be

- Modular
- Scalable
- Event Driven
- Cloud Native
- AI Native
- API First
- Search First
- Evidence Based
- Domain Driven

---

# Architectural Decisions

## Business data and AI are separated.

## AI never modifies verified business facts.

## Every business fact has evidence.

## Every AI result has confidence.

## Every entity has a Golden Record.

## Relationships are first-class citizens.

## Search is generated from business entities.

## Data is continuously refreshed.

## Historical information is preserved.

## Every domain owns its own business rules.

---

# Future Architecture

Future versions of ExportIQ may include

- Event streaming
- Knowledge Graph
- Multi-agent AI
- Workflow automation
- Customer workspaces
- Market intelligence dashboards
- Predictive analytics
- Trade forecasting
- Supplier discovery
- Buyer discovery
- Supply chain mapping

---

# Success Criteria

A successful ExportIQ platform should

- Continuously discover new companies
- Maintain trusted Golden Records
- Preserve complete provenance
- Scale to millions of entities
- Generate actionable AI insights
- Support semantic search
- Provide reliable APIs
- Enable future AI agents
- Serve as a trusted global trade intelligence platform

---

# Guiding Principles

- Build a platform, not an application.
- Separate facts from intelligence.
- Every fact has evidence.
- AI enriches, never replaces.
- Domains own business logic.
- Preserve history.
- Design for scale.
- Make every component reusable.
- Trust is more valuable than volume.
