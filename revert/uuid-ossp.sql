-- Revert uuid-ossp

BEGIN;

DROP EXTENSION "uuid-ossp";

COMMIT;
