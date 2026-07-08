USE JobTrackDB;
GO

INSERT INTO Companies (company_name, sector, city, website)
VALUES 
('Logo Yazilim', 'Software', 'Istanbul', 'https://www.logo.com.tr'),
('Akbank', 'Banking', 'Istanbul', 'https://www.akbank.com'),
('Trendyol', 'E-Commerce', 'Istanbul', 'https://www.trendyol.com'),
('Turkcell', 'Telecommunication', 'Istanbul', 'https://www.turkcell.com.tr'),
('ASELSAN', 'Defense Industry', 'Ankara', 'https://www.aselsan.com.tr');
GO

INSERT INTO Candidates
(first_name, last_name, email, university, department, graduation_year)
VALUES
('Tarik', 'Konar', 'tarik.konar@example.com', 'Halic University', 'Software Engineering', 2027),
('Ayse', 'Demir', 'ayse.demir@example.com', 'Istanbul University', 'Computer Engineering', 2026),
('Mehmet', 'Kaya', 'mehmet.kaya@example.com', 'Yildiz Technical University', 'Computer Engineering', 2025),
('Zeynep', 'Celik', 'zeynep.celik@example.com', 'Marmara University', 'Management Information Systems', 2026),
('Can', 'Aydin', 'can.aydin@example.com', 'Bahcesehir University', 'Software Engineering', 2027);
GO

INSERT INTO Skills (skill_name, category)
VALUES
('SQL', 'Database'),
('Java', 'Programming'),
('Python', 'Programming'),
('C++', 'Programming'),
('Kotlin', 'Programming'),
('Git', 'Version Control'),
('Power BI', 'Data Analysis'),
('Excel', 'Data Analysis'),
('REST API', 'Backend'),
('Machine Learning', 'AI');
GO

INSERT INTO JobPostings 
(company_id, title, job_type, location, work_model, posted_date, deadline)
VALUES
(1, 'Software Developer Intern', 'Internship', 'Istanbul', 'Hybrid', '2026-06-01', '2026-07-15'),
(2, 'Data Analyst Intern', 'Internship', 'Istanbul', 'On-site', '2026-06-05', '2026-07-20'),
(3, 'Backend Developer Intern', 'Internship', 'Istanbul', 'Remote', '2026-06-10', '2026-07-25'),
(4, 'Mobile Application Intern', 'Internship', 'Istanbul', 'Hybrid', '2026-06-12', '2026-07-30'),
(5, 'Embedded Software Intern', 'Internship', 'Ankara', 'On-site', '2026-06-15', '2026-08-01'),
(3, 'Junior Software Engineer', 'Full-time', 'Istanbul', 'Hybrid', '2026-06-20', '2026-08-10');
GO

INSERT INTO Applications
(candidate_id, job_id, application_date, current_status, source, notes)
VALUES
(1, 3, '2026-06-18', 'Interview', 'LinkedIn', 'Technical interview scheduled'),
(1, 4, '2026-06-20', 'Applied', 'Company Website', 'Waiting for response'),
(2, 2, '2026-06-12', 'Offer', 'LinkedIn', 'Offer received'),
(3, 5, '2026-06-22', 'Rejected', 'Career Fair', 'Rejected after HR screening'),
(4, 1, '2026-06-25', 'Applied', 'Company Website', 'No response yet'),
(5, 6, '2026-06-28', 'Interview', 'Referral', 'First interview completed');
GO

INSERT INTO Interview
(application_id, interview_date, interview_name, results, notes)
VALUES
(1, '2026-07-01', 'Technical Interview', 'Pending', 'Technical interview scheduled'),
(1, '2026-07-05', 'HR Interview', 'Pending', 'HR interview after technical stage'),
(3, '2026-06-25', 'HR Interview', 'Passed', 'Candidate passed HR interview'),
(6, '2026-07-03', 'First Interview', 'Pending', 'First interview completed');
GO

INSERT INTO JobPostingSkills (job_id, skill_id)
VALUES
(1, 1),
(1, 2),
(1, 6),

(2, 1),
(2, 3),
(2, 7),
(2, 8),

(3, 1),
(3, 2),
(3, 6),
(3, 9),

(4, 5),
(4, 6),
(4, 9),

(5, 4),
(5, 6),

(6, 1),
(6, 2),
(6, 3),
(6, 6);
GO