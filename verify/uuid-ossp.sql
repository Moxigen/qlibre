-- Verify uuid-ossp

BEGIN;

SELECT 1/count(*) FROM pg_extension WHERE extname = 'uuid-ossp';
SELECT has_function_privilege('uuid_generate_v4()',           'execute');
SELECT has_function_privilege('uuid_generate_v3(uuid, text)', 'execute');
SELECT has_function_privilege('uuid_ns_url()',                'execute');

ROLLBACK;
