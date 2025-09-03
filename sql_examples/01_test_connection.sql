-- Test connection to CSCI 243 database
-- This file tests your database connection and shows basic information

-- Check PostgreSQL version
SELECT version();

-- List all databases
SELECT datname FROM pg_database WHERE datistemplate = false;

-- Show current user and database
SELECT current_user, current_database();

-- List available schemas
SELECT schema_name FROM information_schema.schemata 
WHERE schema_name NOT IN ('information_schema', 'pg_catalog', 'pg_toast');

-- Test the practice schema
CREATE TABLE IF NOT EXISTS practice.connection_test (
    id SERIAL PRIMARY KEY,
    test_message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert test data
INSERT INTO practice.connection_test (test_message) 
VALUES ('VS Code connection successful!');

-- Verify the test
SELECT * FROM practice.connection_test;