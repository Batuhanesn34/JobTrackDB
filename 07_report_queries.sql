USE JobTrackDB;
GO

-- 1. All application details
SELECT *
FROM vw_ApplicationDetails;
GO

-- 2. Applications by status
SELECT
    current_status,
    COUNT(*) AS application_count
FROM vw_ApplicationDetails
GROUP BY current_status
ORDER BY application_count DESC;
GO

-- 3. Applications by company
SELECT
    company_name,
    COUNT(*) AS application_count
FROM vw_ApplicationDetails
GROUP BY company_name
ORDER BY application_count DESC;
GO

-- 4. Most requested skills
SELECT
    skill_name,
    category,
    COUNT(*) AS requested_count
FROM vw_SkillDemandReport
GROUP BY skill_name, category
ORDER BY requested_count DESC;
GO

-- 5. Jobs requiring SQL
SELECT
    company_name,
    job_title,
    skill_name,
    category
FROM vw_SkillDemandReport
WHERE skill_name = 'SQL';
GO

-- 6. Latest applications
SELECT
    candidate_name,
    company_name,
    job_title,
    application_date,
    current_status
FROM vw_ApplicationDetails
ORDER BY application_date DESC;
GO

-- 7. Status change history
SELECT *
FROM vw_StatusHistoryDetails
ORDER BY changed_date DESC;
GO

-- 8. Interview stage applications using stored procedure
EXEC sp_GetApplicationsByStatus 'Interview';
GO

-- 9. Applications of a specific candidate
EXEC sp_GetApplicationsByCandidate 1;
GO
