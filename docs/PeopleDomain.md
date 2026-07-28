# People Domain

## Purpose

The People Domain models the individuals associated with companies within ExportIQ.

Rather than treating contacts as part of a company, ExportIQ treats people as first-class entities. A person may work for multiple companies over time and can hold different roles throughout their career.

This approach preserves employment history, improves data quality, supports AI enrichment, and enables relationship intelligence.

---

# Scope

The People Domain is responsible for:

- Individual contacts
- Company relationships
- Job titles
- Departments
- Decision-making authority
- Employment history
- Contact information
- LinkedIn profiles
- Relationship strength
- AI enrichment of people

The People Domain does **not** store company information. That belongs to the Company Domain.

---

# Design Principles

## Person First

A person exists independently of a company.

Example

John Smith

↓

works for

↓

ABC Spices

If John moves to another company, the person record remains unchanged.

---

## Employment is a Relationship

Employment is modelled separately.

Instead of

```
Company
    └── Contact
```

ExportIQ models

```
Person

↓

Company Employment

↓

Company
```

This preserves history.

Example

```
John Smith

2019–2024
ABC Spices

2024–
XYZ Foods
```

---

## One Person

One record should exist for each individual.

Duplicate people should be merged using:

- LinkedIn URL
- Email address
- Phone number
- AI similarity
- Manual review

---

## Contact Information

A person may have

- multiple email addresses
- multiple phone numbers
- multiple social profiles

The initial version may store only one email and phone number.

Future versions may normalise these into separate tables.

---

# Core Concepts

## Contact

Represents an individual person.

Examples

- CEO
- Procurement Manager
- Export Manager
- Sales Director

---

## Employment

Represents the relationship between a person and a company.

Employment stores

- company
- job title
- department
- employment dates
- decision level
- primary contact flag

---

## Decision Level

Decision level indicates how influential the contact is.

Examples

- Executive
- Director
- Manager
- Staff
- Unknown

This helps identify decision makers for outreach.

---

## Relationship Strength

Represents confidence in the relationship.

Example

```
100
Verified by company website

80
LinkedIn

60
Trade directory

30
AI inferred
```

---

# Contact Lifecycle

```
DISCOVERED

↓

ENRICHED

↓

VERIFIED

↓

ACTIVE

↓

INACTIVE

↓

ARCHIVED
```

---

# Business Rules

## A contact may exist without a company.

Reason

A person may be discovered before employment is confirmed.

---

## A company may have many contacts.

Example

ABC Spices

- CEO
- Sales Director
- Export Manager
- Procurement Manager

---

## A contact may work for multiple companies.

Examples

- Consultant
- Board member
- Founder
- Advisor

---

## Only one primary contact per department.

Example

Sales

✓ John

✗ Mary

---

## Employment history is never deleted.

Old employment becomes inactive.

---

# Duplicate Detection

Matching priority

1. LinkedIn URL
2. Email
3. Phone
4. Full name + Company
5. AI similarity

---

# AI Enrichment

AI may discover

- missing job titles
- seniority
- department
- responsibilities
- biography
- languages
- skills

AI-generated information should never overwrite verified data.

---

# Future Enhancements

Future versions may support

- Multiple emails
- Multiple phone numbers
- Social profiles
- Career history
- Education
- Certifications
- Languages
- AI-generated biographies
- Relationship graph
- Email verification
- Contact scoring
- Buying influence
- Communication preferences

---

# Database Objects

The People Domain will initially contain

```
contacts

company_contacts
```

Future tables

```
contact_emails

contact_phone_numbers

contact_social_profiles

contact_notes

contact_tags

contact_ai_analysis

contact_relationships
```

---

# Example

```
John Smith

↓

Company Contact

↓

ABC Spices

Role
Export Manager

Department
Sales

Decision Level
Manager

Employment Start
2024

Relationship Strength
95%

Primary Contact
Yes
```

---

# Guiding Principles

- A person is independent of a company.
- Employment is a relationship.
- Preserve employment history.
- Never duplicate people unnecessarily.
- AI enriches data but does not replace verified information.
- Contacts are valuable business assets and should be modelled independently.
