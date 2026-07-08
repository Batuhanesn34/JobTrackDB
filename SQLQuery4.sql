USE JobTrackDB;
GO

CREATE VIEW vw_ApplicationDetails AS
SELECT 
    a.application_id,
    c.candidate_id,
    jp.job_id,
    co.company_id,
    c.first_name + ' ' + c.last_name AS candidate_name,
    co.company_name,
    jp.title AS job_title,
    jp.job_type,
    jp.work_model,
    a.application_date,
    a.current_status,
    a.source,
    a.notes
FROM Applications a
JOIN Candidates c
    ON a.candidate_id = c.candidate_id
JOIN JobPostings jp
    ON a.job_id = jp.job_id
JOIN Companies co
    ON jp.company_id = co.company_id;
GO

CREATE VIEW vw_SkillDemandReport AS
SELECT
    co.company_name,
    jp.title AS job_title,
    s.skill_name,
    s.category
FROM JobPostingSkills jps
JOIN JobPostings jp
    ON jps.job_id = jp.job_id
JOIN Skills s
    ON jps.skill_id = s.skill_id
JOIN Companies co
    ON jp.company_id = co.company_id;
GO

CREATE VIEW vw_StatusHistoryDetails AS
SELECT
    h.history_id,
    c.first_name + ' ' + c.last_name AS candidate_name,
    co.company_name,
    jp.title AS job_title,
    h.old_status,
    h.new_status,
    h.changed_date
FROM ApplicationStatusHistory h
JOIN Applications a
    ON h.application_id = a.application_id
JOIN Candidates c
    ON a.candidate_id = c.candidate_id
JOIN JobPostings jp
    ON a.job_id = jp.job_id
JOIN Companies co
    ON jp.company_id = co.company_id;
GO