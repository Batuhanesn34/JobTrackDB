USE JobTrackDB;
GO

CREATE PROCEDURE sp_GetApplicationsByStatus
    @status VARCHAR(50)
AS
BEGIN
    SELECT
        candidate_name,
        company_name,
        job_title,
        application_date,
        current_status
    FROM vw_ApplicationDetails
    WHERE current_status = @status;
END;
GO

CREATE PROCEDURE sp_GetApplicationsByCandidate
    @candidate_id INT
AS
BEGIN
    SELECT
        application_id,
        candidate_name,
        company_name,
        job_title,
        job_type,
        work_model,
        application_date,
        current_status,
        source,
        notes
    FROM vw_ApplicationDetails
    WHERE candidate_id = @candidate_id;
END;
GO