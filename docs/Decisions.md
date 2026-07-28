# Architecture Decisions

## ADR-001
A Company represents a legal organization and may have multiple business roles (Buyer, Supplier, Manufacturer, Distributor, etc.).

Roles are modelled using a many-to-many relationship through `company_role_assignments`.

## ADR-002
The `companies` table stores the golden record.

AI-generated content is stored separately in `company_ai_profiles`.

## ADR-003
A company may have multiple information sources. These will be stored in a separate `company_sources` table rather than embedding source information in the `companies` table.
