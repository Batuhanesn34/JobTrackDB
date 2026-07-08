USE JobTrackDB;
GO

CREATE TABLE Companies (
    company_id INT PRIMARY KEY IDENTITY(1,1),
    company_name VARCHAR(100) NOT NULL,
    sector VARCHAR(100),
    city VARCHAR(100),
    website VARCHAR(150)
);
GO

CREATE TABLE Candidates (
    candidate_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    university VARCHAR(100),
    department VARCHAR(100),
    graduation_year INT
);
GO

CREATE TABLE Skills (
    skill_id INT PRIMARY KEY IDENTITY(1,1),
    skill_name VARCHAR(50) NOT NULL UNIQUE,
    category VARCHAR(50)
);
GO

CREATE TABLE JobPostings (
    job_id INT PRIMARY KEY IDENTITY(1,1),
    company_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    job_type VARCHAR(50) NOT NULL,
    location VARCHAR(100),
    work_model VARCHAR(50),
    posted_date DATE,
    deadline DATE,

    CONSTRAINT FK_JobPostings_Companies
    FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);
GO

CREATE TABLE Applications (
    application_id INT PRIMARY KEY IDENTITY(1,1),
    candidate_id INT NOT NULL,
    job_id INT NOT NULL,
    application_date DATE NOT NULL,
    current_status VARCHAR(50) NOT NULL,
    source VARCHAR(50),
    notes VARCHAR(255),

    CONSTRAINT FK_Applications_Candidates
    FOREIGN KEY (candidate_id) REFERENCES Candidates(candidate_id),

    CONSTRAINT FK_Applications_JobPostings
    FOREIGN KEY (job_id) REFERENCES JobPostings(job_id),

    CONSTRAINT CK_Applications_Status
    CHECK (current_status IN ('Applied', 'Interview', 'Offer', 'Rejected', 'Withdrawn'))
);
GO

CREATE TABLE Interview (
    interview_id INT PRIMARY KEY IDENTITY(1,1),
    application_id INT NOT NULL,
    interview_date DATE NOT NULL,
    interview_name VARCHAR(50),
    results VARCHAR(50),
    notes VARCHAR(300),

    CONSTRAINT FK_Interview_Applications
    FOREIGN KEY (application_id) REFERENCES Applications(application_id),

    CONSTRAINT CK_Interview_Results
    CHECK (results IN ('Pending', 'Passed', 'Failed', 'Cancelled'))
);
GO

CREATE TABLE JobPostingSkills (
    job_id INT NOT NULL,
    skill_id INT NOT NULL,

    CONSTRAINT PK_JobPostingSkills
    PRIMARY KEY (job_id, skill_id),

    CONSTRAINT FK_JobPostingSkills_JobPostings
    FOREIGN KEY (job_id) REFERENCES JobPostings(job_id),

    CONSTRAINT FK_JobPostingSkills_Skills
    FOREIGN KEY (skill_id) REFERENCES Skills(skill_id)
);
GO

CREATE TABLE ApplicationStatusHistory (
    history_id INT PRIMARY KEY IDENTITY(1,1),
    application_id INT NOT NULL,
    old_status VARCHAR(50),
    new_status VARCHAR(50) NOT NULL,
    changed_date DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_StatusHistory_Applications
    FOREIGN KEY (application_id) REFERENCES Applications(application_id),

    CONSTRAINT CK_StatusHistory_OldStatus
    CHECK (old_status IN ('Applied', 'Interview', 'Offer', 'Rejected', 'Withdrawn')),

    CONSTRAINT CK_StatusHistory_NewStatus
    CHECK (new_status IN ('Applied', 'Interview', 'Offer', 'Rejected', 'Withdrawn'))
);
GO
