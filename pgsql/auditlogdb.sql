DROP DATABASE auditlogdb;
CREATE DATABASE auditlogdb;
ALTER DATABASE auditlogdb SET pgaudit.log = 'privilege,user,definition,config,admin,function';

-- Writer
CREATE ROLE audit001 WITH NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT LOGIN NOREPLICATION;
\password audit001

-- Viewer
CREATE ROLE audit102 WITH NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT LOGIN NOREPLICATION;
\password audit102

\c auditlogdb pi

DROP TABLE auditlog_raw;
CREATE TABLE auditlog_raw (
    tag text
    ,time Timestamptz
    ,record jsonb
);

REVOKE ALL ON auditlog_raw FROM audit001;
GRANT INSERT ON auditlog_raw TO audit001;

REVOKE ALL ON auditlog_raw FROM audit102;
GRANT SELECT ON auditlog_raw TO audit102;

\c auditlogdb audit001

-- Permission denied error.
SELECT * FROM auditlog_raw;


