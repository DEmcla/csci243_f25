-- Basic SQL queries for CSCI 243
-- Practice fundamental SQL operations

-- Create a sample table for practice
CREATE TABLE IF NOT EXISTS practice.students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    gpa DECIMAL(3,2) CHECK (gpa >= 0.0 AND gpa <= 4.0)
);

-- Insert sample data
INSERT INTO practice.students (first_name, last_name, email, gpa) VALUES
('John', 'Doe', 'john.doe@student.edu', 3.5),
('Jane', 'Smith', 'jane.smith@student.edu', 3.8),
('Bob', 'Johnson', 'bob.johnson@student.edu', 3.2),
('Alice', 'Brown', 'alice.brown@student.edu', 3.9);

-- Basic SELECT queries
-- Select all students
SELECT * FROM practice.students;

-- Select specific columns
SELECT first_name, last_name, gpa FROM practice.students;

-- Filter with WHERE clause
SELECT * FROM practice.students WHERE gpa > 3.5;

-- Sort results
SELECT * FROM practice.students ORDER BY gpa DESC;

-- Count records
SELECT COUNT(*) as total_students FROM practice.students;

-- Calculate average GPA
SELECT AVG(gpa) as average_gpa FROM practice.students;

-- Group by example (when you have more data)
SELECT 
    CASE 
        WHEN gpa >= 3.5 THEN 'High'
        WHEN gpa >= 3.0 THEN 'Medium' 
        ELSE 'Low'
    END as gpa_category,
    COUNT(*) as student_count
FROM practice.students 
GROUP BY gpa_category;