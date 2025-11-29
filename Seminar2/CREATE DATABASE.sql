SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'university'
  AND pid <> pg_backend_pid();
DROP DATABASE university;
CREATE DATABASE university;
\c university
\i 'Logical and Physical Model Seminar 1.sql'
\i Data.sql
