CREATE TABLE ipv6_ndp_log (
    ID          SERIAL,
    IP	        INET NOT NULL,
    Mac         TEXT CHECK (mac ~
	               '^([0-9a-f]{2}:){5}[0-9a-f]{2}$'),
    First_Seen  TIMESTAMPTZ NOT NULL DEFAULT now(),
    Last_Seen   TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE USER ipv6ndpwatchd;

GRANT SELECT, USAGE ON ipv6_ndp_log_id_seq TO ipv6ndpwatchd;
GRANT SELECT, INSERT, UPDATE ON ipv6_ndp_log TO ipv6ndpwatchd;

CREATE INDEX ipv6_ndp_log_last_seen ON ipv6_ndp_log(Last_Seen);
