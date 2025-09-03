-- Initial database setup for CSCI 243
-- This script runs automatically when the PostgreSQL container is first created

-- Create a schema for course work
CREATE SCHEMA IF NOT EXISTS course_work;

-- Set search path to include our schema
ALTER DATABASE csci243_db SET search_path TO course_work, public;

-- Create an example table to verify setup
CREATE TABLE IF NOT EXISTS course_work.setup_verification (
    id SERIAL PRIMARY KEY,
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert verification record
INSERT INTO course_work.setup_verification (message) 
VALUES ('Database successfully initialized for CSCI 243');

-- Create a practice schema for exercises from the textbook
CREATE SCHEMA IF NOT EXISTS practice;

-- Grant all privileges on schemas to the database user
GRANT ALL PRIVILEGES ON SCHEMA course_work TO csci243_user;
GRANT ALL PRIVILEGES ON SCHEMA practice TO csci243_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA course_work TO csci243_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA course_work TO csci243_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA practice TO csci243_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA practice TO csci243_user;

-- Set default privileges for future objects
ALTER DEFAULT PRIVILEGES IN SCHEMA course_work 
    GRANT ALL PRIVILEGES ON TABLES TO csci243_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA course_work 
    GRANT ALL PRIVILEGES ON SEQUENCES TO csci243_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA practice 
    GRANT ALL PRIVILEGES ON TABLES TO csci243_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA practice 
    GRANT ALL PRIVILEGES ON SEQUENCES TO csci243_user;

-- Confirmation message
DO $$
BEGIN
    RAISE NOTICE 'Database initialization complete!';
    RAISE NOTICE 'Schemas created: course_work, practice';
    RAISE NOTICE 'User csci243_user has full access to both schemas';
END $$;