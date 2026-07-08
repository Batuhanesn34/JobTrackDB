# JobTrackDB – SQL Server Job & Internship Application Tracking Database

JobTrackDB is a SQL Server database project designed to manage and track job and internship applications.  
The project includes companies, job postings, candidates, applications, interviews, skills, application status history, views, stored procedures, triggers, and reporting queries.

## Project Purpose

The purpose of this project is to design a relational database system for tracking job and internship applications.  
It helps store application details, monitor interview stages, analyze requested skills, and keep a history of application status changes.

## Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio 2022
- T-SQL

## Main Features

- Relational database design
- Primary key and foreign key constraints
- Unique and check constraints
- Many-to-many relationship between job postings and skills
- Sample data insertion
- JOIN queries
- GROUP BY and HAVING report queries
- Views for reusable reports
- Stored procedures for filtering application records
- Trigger for automatic application status history tracking

## Database Tables

The project contains the following main tables:

- Companies
- Candidates
- JobPostings
- Applications
- Interview
- Skills
- JobPostingSkills
- ApplicationStatusHistory

## Views

The project includes the following views:

- `vw_ApplicationDetails`
- `vw_SkillDemandReport`
- `vw_StatusHistoryDetails`

These views are used to simplify complex JOIN queries and provide readable reports.

## Stored Procedures

The project includes stored procedures such as:

- `sp_GetApplicationsByStatus`
- `sp_GetApplicationsByCandidate`

These procedures allow reusable filtering of application records.

## Trigger

The project includes a trigger:

- `trg_ApplicationStatusChange`

This trigger automatically records old and new application status values when the `current_status` field in the `Applications` table is updated.

## File Structure

```text
JobTrackDB/
│
├── 01_create_database.sql
├── 02_create_tables.sql
├── 03_insert_sample_data.sql
├── 04_views.sql
├── 05_stored_procedures.sql
├── 06_triggers.sql
├── 07_report_queries.sql
└── README.md
```
