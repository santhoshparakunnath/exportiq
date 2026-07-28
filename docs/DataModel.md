# ExportIQ Data Model

## Purpose

The ExportIQ database stores structured information about companies, buyers, products, contacts, certifications and AI-generated insights.

The database is designed to:

- Support buyer discovery
- Store verified company information
- Store AI-generated insights separately
- Scale to millions of companies
- Support multiple business verticals

---

## Core Entities

| Table | Description |
|--------|-------------|
| countries | Country master data |
| business_verticals | Business sectors such as Spices, Tea, Coffee |
| companies | Company master data |
| contacts | People working for companies |
| products | Products bought or sold |
| certifications | Food and quality certifications |
| company_products | Links companies and products |
| company_certifications | Links companies and certifications |
| company_ai_profiles | AI-generated analysis |

---

## Design Principles

- UUID primary keys
- Foreign keys for relationships
- Store facts separately from AI-generated content
- Use lookup tables where appropriate
- Soft delete support in future
