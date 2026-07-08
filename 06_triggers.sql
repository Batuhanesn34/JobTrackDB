USE JobTrackDB;
GO

CREATE TRIGGER trg_ApplicationStatusChange
ON Applications
AFTER UPDATE
AS
BEGIN
    INSERT INTO ApplicationStatusHistory
    (application_id, old_status, new_status)
    SELECT
        i.application_id,
        d.current_status AS old_status,
        i.current_status AS new_status
    FROM inserted i
    JOIN deleted d
        ON i.application_id = d.application_id
    WHERE i.current_status <> d.current_status;
END;
GO
