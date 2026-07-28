BEGIN;

CREATE TABLE ports
(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    port_code VARCHAR(20) NOT NULL,

    location_id UUID NOT NULL,

    un_locode VARCHAR(10),

    port_type VARCHAR(20) NOT NULL,

    is_international BOOLEAN NOT NULL DEFAULT TRUE,

    customs_authority VARCHAR(255),

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_port_code
        UNIQUE(port_code),

    CONSTRAINT uq_un_locode
        UNIQUE(un_locode),

    CONSTRAINT fk_ports_location
        FOREIGN KEY(location_id)
        REFERENCES locations(id)
        ON DELETE CASCADE,

    CONSTRAINT chk_port_type
        CHECK
        (
            port_type IN
            (
                'SEA',
                'AIR',
                'DRY_PORT',
                'INLAND'
            )
        )
);

COMMENT ON TABLE ports IS
'Trade ports used for import and export operations.';

COMMIT;
