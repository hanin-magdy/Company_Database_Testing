# Company Database Management & Testing Project

## Project Overview
A comprehensive relational database management system built and tested using MySQL Workbench to demonstrate data integrity verification, schema optimization, and complex querying.

## Database Schema & Tables
- Employee: Stores employee profiles, salaries, and supervisor links.
- Department: Manages department details and manager assignments.
- Project: Details active projects and their locations.
- Works_On: Junction table tracking employee hours per project.
- Students: Practice table created for basic DDL and DML operations.

## Key SQL Concepts Applied
- DDL & DML: Database and table creation, modifications (ALTER, DROP, TRUNCATE), and data insertion.
- Constraints: Primary Keys, Foreign Keys (ON DELETE CASCADE / SET NULL), NOT NULL, and CHECK constraints.
- Queries & Data Analysis: 
  - Pattern matching with wildcards (LIKE, _, %).
  - Aggregation functions (SUM, AVG, MAX, MIN) paired with GROUP BY and HAVING.
  - Joining multiple tables (INNER JOIN, LEFT JOIN, RIGHT JOIN).
- Database Objects: Creating and updating Database VIEWS and INDEXES.

## Files Included
- Company_Database_Project.sql: Schema setup, table structure, constraints, and data population scripts.
- Company_Queries_And_Testing.sql: Analytical queries, joins, views, and data validation test scenarios.
