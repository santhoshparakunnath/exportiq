BEGIN;

CREATE TABLE company_locations
(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    company_id UUID NOT NULL,

    location_id UUID NOT NULL,

    relationship_type VARCHAR(30) NOT NULL,

    is_primary BOOLEAN NOT NULL DEFAULT FALSE,

    start_date DATE,
    end_date DATE,

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_company_location
        UNIQUE(company_id, location_id, relationship_type),

    CONSTRAINT fk_company_locations_company
        FOREIGN KEY(company_id)
        REFERENCES companies(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_company_locations_location
        FOREIGN KEY(location_id)
        REFERENCES locations(id)
        ON DELETE CASCADE,

    CONSTRAINT chk_company_location_type
        CHECK
        (
            relationship_type IN
            (
                'HEADQUARTERS',
                'REGISTERED_OFFICE',
                'FACTORY',
                'WAREHOUSE',
                'SALES_OFFICE',
                'DISTRIBUTION_CENTER',
                'PORT',
                'OTHER'
            )
        ),

    CONSTRAINT chk_company_location_dates
        CHECK
        (
            end_date IS NULL
            OR start_date IS NULL
            OR end_date >= start_date
        )
);

COMMENT ON TABLE company_locations IS
'Associates companies with one or more physical locations.';

COMMIT;
