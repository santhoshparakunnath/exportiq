CREATE INDEX idx_contacts_last_name
ON contacts(last_name);

CREATE INDEX idx_contacts_first_name
ON contacts(first_name);

CREATE INDEX idx_contacts_status
ON contacts(status);

CREATE INDEX idx_contacts_active
ON contacts(is_active);

CREATE INDEX idx_contacts_email
ON contacts(primary_email);
