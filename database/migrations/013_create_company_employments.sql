BEGIN;

CREATE TABLE company_employments
(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    employment_code VARCHAR(20) NOT NULL,

    company_id UUID NOT NULL,
    contact_id UUID NOT NULL,

    role_id UUID,

    job_title VARCHAR(255),
    department VARCHAR(150),

    decision_level VARCHAR(20) NOT NULL DEFAULT 'UNKNOWN',

    work_email VARCHAR(255),
    work_phone VARCHAR(50),

    reports_to_contact_id UUID,

    employment_type VARCHAR(30) NOT NULL DEFAULT 'FULL_TIME',

    start_date DATE,
    end_date DATE,

    relationship_strength SMALLINT DEFAULT 100,

    is_primary BOOLEAN NOT NULL DEFAULT FALSE,
    is_current BOOLEAN NOT NULL DEFAULT TRUE,
    is_verified BOOLEAN NOT NULL DEFAULT FALSE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    notes TEXT,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_company_employment_code
        UNIQUE(employment_code),

    CONSTRAINT uq_company_contact_current
        UNIQUE(company_id, contact_id, work_email),

    CONSTRAINT fk_company_employment_company
        FOREIGN KEY(company_id)
        REFERENCES companies(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_company_employment_contact
        FOREIGN KEY(contact_id)
        REFERENCES contacts(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_company_employment_role
        FOREIGN KEY(role_id)
        REFERENCES roles(id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_company_employment_manager
        FOREIGN KEY(reports_to_contact_id)
        REFERENCES contacts(id)
        ON DELETE SET NULL,

    CONSTRAINT chk_decision_level
        CHECK
        (
            decision_level IN
            (
                'EXECUTIVE',
                'DIRECTOR',
                'MANAGER',
                'STAFF',
                'UNKNOWN'
            )
        ),

    CONSTRAINT chk_employment_type
        CHECK
        (
            employment_type IN
            (
                'FULL_TIME',
                'PART_TIME',
                'CONTRACTOR',
                'CONSULTANT',
                'ADVISOR',
                'BOARD_MEMBER',
                'OWNER',
                'FOUNDER',
                'OTHER'
            )
        ),

    CONSTRAINT chk_relationship_strength
        CHECK
        (
            relationship_strength BETWEEN 0 AND 100
        ),

    CONSTRAINT chk_employment_dates
        CHECK
        (
            end_date IS NULL
            OR start_date IS NULL
            OR end_date >= start_date
        )
);

COMMENT ON TABLE company_employments IS
'Represents the relationship between a person and a company. Stores employment, consulting, advisory and board relationships.';

COMMENT ON COLUMN company_employments.employment_code IS
'Business identifier (EMP-000001).';

COMMENT ON COLUMN company_employments.role_id IS
'Business role played by the company (Supplier, Buyer, Manufacturer etc.).';

COMMENT ON COLUMN company_employments.job_title IS
'Job title held by the contact within the company.';

COMMENT ON COLUMN company_employments.department IS
'Department within the company.';

COMMENT ON COLUMN company_employments.decision_level IS
'Decision-making authority of the contact.';

COMMENT ON COLUMN company_employments.relationship_strength IS
'Confidence score (0-100) indicating the strength of this employment relationship.';

COMMENT ON COLUMN company_employments.is_primary IS
'Indicates whether this is the primary relationship for the contact with the company.';

COMMENT ON COLUMN company_employments.is_current IS
'Indicates whether the relationship is currently active.';

COMMENT ON COLUMN company_employments.reports_to_contact_id IS
'Optional manager or reporting contact within the same company.';

COMMIT;
