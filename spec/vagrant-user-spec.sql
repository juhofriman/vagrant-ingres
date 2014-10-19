CREATE USER vagrant WITH
  PASSWORD = 'vagrant',
  NOGROUP,
  PRIVILEGES=(CREATEDB,TRACE,SECURITY,MAINTAIN_LOCATIONS,OPERATOR,AUDITOR,MAINTAIN_AUDIT,MAINTAIN_USERS),
  DEFAULT_PRIVILEGES=(CREATEDB,TRACE,SECURITY,MAINTAIN_LOCATIONS,OPERATOR,AUDITOR,MAINTAIN_AUDIT,MAINTAIN_USERS),
  NOEXPIRE_DATE,
  NOPROFILE,
  NOSECURITY_AUDIT;
\go
