BEGIN;

CREATE TABLE locations
(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    location_code VARCHAR(20) NOT NULL,

    name VARCHAR(255),

    location_type VARCHAR(30) NOT NULL,

    address_line_1 VARCHAR(255),
    address_line_2 VARCHAR(255),

    city VARCHAR(100),
    state_province VARCHAR(100),

    postal_code VARCHAR(30),

    country_id UUID NOT NULL,

    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),

    timezone VARCHAR(100),

    is_verified BOOLEAN NOT NULL DEFAULT FALSE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_location_code
        UNIQUE(location_code),

    CONSTRAINT fk_location_country
        FOREIGN KEY(country_id)
        REFERENCES countries(id)
        ON DELETE RESTRICT,

    CONSTRAINT chk_location_type
        CHECK
        (
            location_type IN
            (
                'HEADQUARTERS',
                'OFFICE',
                'FACTORY',
                'WAREHOUSE',
                'PORT',
                'CUSTOMS',
                'AIRPORT',
                'OTHER'
            )
        ),

    CONSTRAINT chk_latitude
        CHECK
        (
            latitude IS NULL
            OR latitude BETWEEN -90 AND 90
        ),

    CONSTRAINT chk_longitude
        CHECK
        (
            longitude IS NULL
            OR longitude BETWEEN -180 AND 180
        )
);

COMMENT ON TABLE locations IS
'Master list of physical locations used throughout ExportIQ.';

COMMENT ON COLUMN locations.location_code IS
'Business identifier (LOC-000001).';

COMMIT;
