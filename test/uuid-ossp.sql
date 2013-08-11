SET client_min_messages TO warning;
CREATE EXTENSION IF NOT EXISTS pgtap;
RESET client_min_messages;

-- Plan the tests.
BEGIN;
SELECT plan( 4 );

SELECT ok(
    EXISTS( SELECT 1 FROM pg_extension WHERE extname = 'uuid-ossp' ),
    'uuid-ossp should be loaded'
);
SELECT has_function( 'uuid_ns_url', 'uuid_ns_url()' );
SELECT has_function( 'uuid_generate_v4', 'uuid_generate_v4()' );
SELECT has_function(
  'uuid_generate_v3', ARRAY['uuid','text'], 'uuid_generate_v3()'
);

SELECT finish();
ROLLBACK;
