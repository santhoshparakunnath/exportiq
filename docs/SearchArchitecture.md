# Search Architecture

# Purpose

The Search Domain enables users to discover companies, products, people and trade intelligence using structured, full-text and AI-powered semantic search.

Search is a core capability of ExportIQ rather than a feature layered on top of the database.

The search platform transforms business entities into searchable knowledge.

---

# Vision

Users should be able to ask business questions rather than database questions.

Examples

- Find spice exporters in India
- Find suppliers similar to ABC Spices
- Find organic coffee producers in Brazil
- Find buyers importing cardamom into Germany
- Find companies certified for ISO 22000
- Find companies with more than 500 employees
- Find companies that recently expanded into Europe

The platform should understand intent rather than requiring exact keywords.

---

# Design Principles

## Search First

Every entity should be designed with searchability in mind.

Search requirements influence:

- Data modelling
- AI enrichment
- Indexing
- Relationships

---

## Search Uses Read Models

The search engine is not the source of truth.

The Golden Record remains the authoritative source.

Search indexes are generated from the Golden Record.

---

## Multiple Search Types

ExportIQ supports multiple search strategies.

- Structured Search
- Full-text Search
- Semantic Search
- Faceted Search
- Similarity Search
- Relationship Search
- Hybrid Search

The platform chooses the best strategy depending on the query.

---

## AI Enhances Search

AI improves search by generating

- Summaries
- Tags
- Keywords
- Embeddings
- Classifications
- Similarity vectors

AI does not replace structured search.

---

# Search Layers

```
Golden Record

↓

Search Projection

↓

Search Index

↓

Vector Embeddings

↓

Query Engine

↓

Search Results
```

---

# Search Types

## Structured Search

Uses database fields.

Examples

Country = India

Business Vertical = Agriculture

Certification = Organic

Employee Count > 500

---

## Full Text Search

Searches indexed text.

Examples

Organic spices

Coffee exporter

Cashew supplier

Searches

- Company names
- Descriptions
- Products
- Certifications
- AI summaries

---

## Semantic Search

Uses embeddings to find meaning rather than keywords.

Example

Search

Organic spice exporter

Results

Masala producer

Seasoning manufacturer

Pepper exporter

Cardamom processor

Even if the words differ.

---

## Similarity Search

Find entities similar to another entity.

Examples

Companies similar to

ABC Spices

Products similar to

Green Cardamom

Contacts similar to

Senior Procurement Manager

Similarity is based on embeddings.

---

## Faceted Search

Users may combine filters.

Example

Country

India

+

Certification

Organic

+

Business Vertical

Agriculture

+

Employees

100–500

+

Exporter

Yes

---

## Relationship Search

Traverse relationships.

Example

Company

↓

Products

↓

Certifications

↓

Countries

↓

Buyers

↓

Suppliers

This enables knowledge graph style discovery.

---

# Search Pipeline

```
Golden Record Updated

↓

Detect Changes

↓

Build Search Projection

↓

Generate Embeddings

↓

Update Search Index

↓

Update Vector Index

↓

Search Ready
```

---

# Search Projection

Search uses denormalised documents.

Example

Company Search Document

Contains

- Company
- Products
- Certifications
- Contacts
- AI Summary
- Tags
- Countries
- Roles

The search engine should not perform joins.

---

# Search Documents

Each entity has a dedicated search document.

Examples

Company Document

Product Document

Contact Document

Certification Document

Future

Trade Document

News Document

Market Document

---

# Search Ranking

Ranking combines multiple signals.

Examples

Text relevance

Business relevance

Verification status

Confidence score

Popularity

AI similarity

Freshness

Users should receive the most useful results rather than the closest keyword match.

---

# AI Search Features

AI provides

- Query understanding
- Query expansion
- Similarity search
- Recommendation generation
- Related entities
- Suggested searches

---

# Autocomplete

Autocomplete should support

Company Names

Products

Countries

Cities

Certifications

Industries

Tags

People

---

# Search Suggestions

Example

User types

Organic

Suggestions

Organic Food

Organic Cotton

Organic Coffee

Organic Tea

Organic Certification

Organic Exporter

---

# Search Results

Each result should include

- Name
- Type
- Summary
- Country
- Confidence
- Verification Status
- Key Products
- Certifications
- AI Summary
- Similarity Score (when applicable)

---

# Search Filters

Common filters

Country

City

Business Vertical

Role

Products

Certifications

Employee Count

Founded Year

AI Tags

Verification Status

Company Status

Trade Activity

Languages

Risk Level

Opportunity Score

---

# Search Index Strategy

Separate indexes should exist for

Companies

Contacts

Products

Certifications

Future

Trade

News

Documents

This improves scalability.

---

# Hybrid Search

Search combines

Structured Filters

+

Keyword Matching

+

Semantic Similarity

Example

Country = India

AND

Organic

AND

Similar to

ABC Spices

The engine merges and ranks the results.

---

# Knowledge Graph

Future versions will support graph traversal.

Example

Supplier

↓

Product

↓

Importer

↓

Country

↓

Certification

↓

Buyer

Graph search enables discovery beyond direct matches.

---

# Search Performance

Target

Autocomplete

<100 ms

Structured Search

<500 ms

Semantic Search

<1 second

Hybrid Search

<2 seconds

---

# Security

Search results must respect

- User permissions
- Subscription level
- Data visibility
- API limits

Search should never expose restricted information.

---

# Monitoring

Track

Search latency

Popular searches

Zero-result searches

Search quality

Click-through rate

Semantic accuracy

Index freshness

Embedding freshness

---

# Future Enhancements

Future capabilities

Natural language search

Voice search

Conversational AI

Knowledge graph navigation

Agentic search

Personalised ranking

Saved searches

Alerts

Market trend discovery

Predictive recommendations

---

# Technology

Current architecture

PostgreSQL

↓

Change Detection

↓

Search Projection

↓

OpenSearch / Elasticsearch

↓

Vector Database

↓

Search API

↓

Web Application

---

# Success Criteria

Users should be able to

- Find companies in seconds
- Discover similar businesses
- Navigate relationships
- Ask natural language questions
- Filter millions of records
- Trust the search results
- Discover new business opportunities

---

# Guiding Principles

- Search is a core platform capability.
- Search indexes are derived from the Golden Record.
- AI enhances search rather than replacing it.
- Relationships are searchable.
- Semantic understanding is as important as keywords.
- Every searchable entity should have a dedicated search document.
- Design for millions of entities.
