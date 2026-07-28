BEGIN;

CREATE TABLE contacts
(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    contact_code VARCHAR(20) NOT NULL,

    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    preferred_name VARCHAR(100),

    linkedin_url VARCHAR(500),

    primary_email VARCHAR(255),
    primary_phone VARCHAR(50),

    languages TEXT,

    status VARCHAR(20) NOT NULL DEFAULT 'DISCOVERED',

    last_verified TIMESTAMPTZ,

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_contact_code
        UNIQUE(contact_code),

    CONSTRAINT uq_contact_linkedin
        UNIQUE(linkedin_url),

    CONSTRAINT chk_contact_status
        CHECK
        (
            status IN
            (
                'DISCOVERED',
                'ENRICHED',
                'VERIFIED',
                'ACTIVE',
                'INACTIVE',
                'ARCHIVED'
            )
        )
);

COMMENT ON TABLE contacts IS
'Master list of people known to ExportIQ. A contact exists independently of any company.';

COMMENT ON COLUMN contacts.contact_code IS
'Business identifier (CNT-000001).';

COMMENT ON COLUMN contacts.linkedin_url IS
'Canonical LinkedIn profile URL used for identity resolution.';

COMMENT ON COLUMN contacts.primary_email IS
'Primary personal email if known.';

COMMENT ON COLUMN contacts.primary_phone IS
'Primary personal phone number if known.';

COMMENT ON COLUMN contacts.languages IS
'Languages spoken by the contact.';

COMMENT ON COLUMN contacts.status IS
'Lifecycle status of the contact.';

COMMIT;
