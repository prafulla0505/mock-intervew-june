-- ---------------------------------------------- Database Queries -----------------------------------------------

-- create a database
CREATE DATABASE E_Learning_Platform;

-- to work on it, you need to use it first
USE E_Learning_Platform;

-- delete database
-- DROP DATABASE E_Learning_Platform;

-- ---------------------------------------- Database Analysis ----------------------------------------

/*
T1 : Students(StudentID, FirstName, LastName, Email, Phone, DateOfBirth, Address, EnrollmentDate, Status, ClassID)

T2 : Teachers(TeacherID, FirstName, LastName, Email, Phone, Specialization, HireDate, Salary, Experience, Status)

T3 : Courses(CourseID, CourseName, Description, Credits, Category, DurationWeeks, TeacherID, Level, Language, Status)

T4 : Enrollments(EnrollmentID, StudentID, CourseID, EnrollmentDate, Progress, CompletionDate, Grade, Feedback, Status, PaymentStatus)

T5 : Classes(ClassID, ClassName, Schedule, RoomNumber, Capacity, CourseID, TeacherID, Semester, StartDate, EndDate)

T6 : Assignments(AssignmentID, Title, Description, DueDate, CourseID, ClassID, MaxMarks, AssignedDate, Status, AttachmentLink)

T7 : Submissions(SubmissionID, AssignmentID, StudentID, SubmissionDate, MarksObtained, Feedback, Status, FileLink, PlagiarismScore, LateSubmission)

T8 : Exams(ExamID, ExamName, Date, DurationMinutes, TotalMarks, CourseID, ClassID, Type, Status, ResultPublished)

T9 : Payments(PaymentID, StudentID, Amount, PaymentDate, PaymentMethod, Status, TransactionID, PaymentFor, ReceiptLink, Comments)

T10: DiscussionForum(PostID, StudentID, CourseID, Title, Content, PostDate, ReplyCount, LastReplyDate, Status, AttachmentLink)

*/

-- --------------------------------------- Table Related Queries ---------------------------------

-- Table 1: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    DateOfBirth DATE,
    Address VARCHAR(255),
    EnrollmentDate DATE,
    Status VARCHAR(20),
    ClassID INT
);

-- Insert 10 records into Students table
INSERT INTO Students (StudentID, FirstName, LastName, Email, Phone, DateOfBirth, Address, EnrollmentDate, Status, ClassID) VALUES
(1, 'Aarav', 'Sharma', 'aarav.sharma@example.com', '9876543210', '2005-05-10', 'Delhi, India', '2023-06-01', 'Active', 101),
(2, 'Saanvi', 'Verma', 'saanvi.verma@example.com', '9876543211', '2004-11-23', 'Mumbai, India', '2023-06-02', 'Active', 101),
(3, 'Vivaan', 'Patel', 'vivaan.patel@example.com', '9876543212', '2006-01-15', 'Ahmedabad, India', '2023-06-03', 'Active', 102),
(4, 'Ananya', 'Singh', 'ananya.singh@example.com', '9876543213', '2005-08-30', 'Lucknow, India', '2023-06-04', 'Active', 102),
(5, 'Arjun', 'Rao', 'arjun.rao@example.com', '9876543214', '2005-03-18', 'Hyderabad, India', '2023-06-05', 'Active', 103),
(6, 'Ishaan', 'Nair', 'ishaan.nair@example.com', '9876543215', '2006-12-11', 'Kochi, India', '2023-06-06', 'Active', 103),
(7, 'Diya', 'Mishra', 'diya.mishra@example.com', '9876543216', '2004-07-09', 'Pune, India', '2023-06-07', 'Active', 104),
(8, 'Kabir', 'Joshi', 'kabir.joshi@example.com', '9876543217', '2005-02-20', 'Bengaluru, India', '2023-06-08', 'Active', 104),
(9, 'Myra', 'Kaur', 'myra.kaur@example.com', '9876543218', '2006-04-14', 'Chandigarh, India', '2023-06-09', 'Active', 105),
(10, 'Ayaan', 'Yadav', 'ayaan.yadav@example.com', '9876543219', '2005-09-25', 'Jaipur, India', '2023-06-10', 'Active', 105);

-- to display/retrieve table data
-- show all students
SELECT * FROM Students;
-- Get students who are currently 'Active'
SELECT * FROM Students WHERE Status = 'Active';

-- Find students enrolled after 1st June 2022
SELECT * FROM Students WHERE EnrollmentDate > '2022-06-01';

-- List students who are in ClassID 101
SELECT * FROM Students WHERE ClassID = 101;

-- Display students with last name 'Sharma'
SELECT * FROM Students WHERE LastName = 'Sharma';

-- Date & Age Related Queries
-- Find students born after 1st Jan 2006

SELECT * FROM Students WHERE DateOfBirth > '2006-01-01';
-- List students with upcoming birthdays (in July)
SELECT * FROM Students WHERE MONTH(DateOfBirth) = 7;
--  Search & Pattern Queries
-- Find students whose first name starts with 'A'
SELECT * FROM Students WHERE FirstName LIKE 'A%';

-- Get students with Gmail addresses
SELECT * FROM Students WHERE Email LIKE '%@gmail.com';

-- Students who live in 'Delhi'
SELECT * FROM Students WHERE Address LIKE '%Delhi%';
-- Sorting & Limiting
-- Show top 5 recently enrolled students
SELECT * FROM Students ORDER BY EnrollmentDate DESC LIMIT 5;

-- List students ordered by last name

SELECT * FROM Students ORDER BY LastName;
-- Grouping & Counting
-- Count of students in each class
SELECT ClassID, COUNT(*) AS TotalStudents FROM Students GROUP BY ClassID;

-- Number of active vs inactive students
SELECT Status, COUNT(*) AS Count FROM Students GROUP BY Status;
-- Updating Data
-- Update status to 'Graduated' for students in ClassID 103
UPDATE Students SET Status = 'Graduated' WHERE ClassID = 103;
--  Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe updates
-- Change email domain for all students (e.g., example.com → school.edu)
UPDATE Students
SET Email = REPLACE(Email, '@example.com', '@school.edu')
WHERE Email LIKE '%@example.com';
--  Deletion Queries
-- Delete students who are inactive

DELETE FROM Students WHERE Status = 'Inactive';
-- Remove students who enrolled before 2020
DELETE FROM Students WHERE EnrollmentDate < '2020-01-01';
-- Advanced Logic
-- Find students who share the same first name

SELECT FirstName, COUNT(*) FROM Students
GROUP BY FirstName HAVING COUNT(*) > 1;
-- List students who are NOT assigned to any class (ClassID is NULL)
SELECT * FROM Students WHERE ClassID IS NULL;


-- Table 2: Teachers
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Specialization VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2),
    Experience INT,
    Status VARCHAR(20)
);


INSERT INTO Teachers (TeacherID, FirstName, LastName, Email, Phone, Specialization, HireDate, Salary, Experience, Status) VALUES
(1, 'Rajesh', 'Kumar', 'rajesh.kumar@example.com', '9998887770', 'Mathematics', '2015-01-15', 75000.00, 10, 'Active'),
(2, 'Anita', 'Desai', 'anita.desai@example.com', '9998887771', 'Science', '2016-02-20', 70000.00, 9, 'Active'),
(3, 'Sanjay', 'Gupta', 'sanjay.gupta@example.com', '9998887772', 'English', '2014-03-25', 80000.00, 11, 'Active'),
(4, 'Priya', 'Sharma', 'priya.sharma@example.com', '9998887773', 'History', '2017-04-30', 68000.00, 8, 'Active'),
(5, 'Rakesh', 'Mehta', 'rakesh.mehta@example.com', '9998887774', 'Geography', '2013-05-10', 85000.00, 12, 'Active'),
(6, 'Kavita', 'Singh', 'kavita.singh@example.com', '9998887775', 'Computer Science', '2018-06-15', 72000.00, 6, 'Active'),
(7, 'Ajay', 'Patel', 'ajay.patel@example.com', '9998887776', 'Physics', '2012-07-20', 90000.00, 13, 'Active'),
(8, 'Sunita', 'Nair', 'sunita.nair@example.com', '9998887777', 'Chemistry', '2019-08-25', 71000.00, 5, 'Active'),
(9, 'Vikram', 'Rao', 'vikram.rao@example.com', '9998887778', 'Economics', '2011-09-30', 95000.00, 14, 'Active'),
(10, 'Meena', 'Joshi', 'meena.joshi@example.com', '9998887779', 'Biology', '2020-10-05', 68000.00, 4, 'Active');

-- Get all teachers
SELECT * FROM Teachers;

-- List teachers who are currently 'Active'
SELECT * FROM Teachers WHERE Status = 'Active';

-- Find teachers with experience more than 10 years
SELECT * FROM Teachers WHERE Experience > 10;

-- Show all teachers hired in 2020
SELECT * FROM Teachers WHERE YEAR(HireDate) = 2020;

-- Retrieve teachers specialized in 'Mathematics'
SELECT * FROM Teachers WHERE Specialization = 'Mathematics';

-- Salary-Based Queries
-- List teachers earning more than ₹50,000
SELECT * FROM Teachers WHERE Salary > 50000;

-- Find teacher with the highest salary
SELECT * FROM Teachers ORDER BY Salary DESC LIMIT 1;

-- Show teachers with salary between ₹30,000 and ₹60,000

SELECT * FROM Teachers WHERE Salary BETWEEN 30000 AND 60000;
 -- HireDate Queries
-- Teachers hired before 2018
SELECT * FROM Teachers WHERE HireDate < '2018-01-01';

-- Top 3 recently hired teachers
SELECT * FROM Teachers ORDER BY HireDate DESC LIMIT 3;
-- Counting & Grouping
-- Count of teachers by specialization
SELECT Specialization, COUNT(*) AS TotalTeachers
FROM Teachers
GROUP BY Specialization;

-- Average salary by specialization
SELECT Specialization, AVG(Salary) AS AverageSalary
FROM Teachers
GROUP BY Specialization;
--  Pattern Matching & Text Filters
-- List teachers whose first name starts with 'A'
SELECT * FROM Teachers WHERE FirstName LIKE 'A%';

-- Get teachers with Gmail addresses
SELECT * FROM Teachers WHERE Email LIKE '%@gmail.com';

-- Find teachers whose last name ends with 'kar'
SELECT * FROM Teachers WHERE LastName LIKE '%kar';
-- Updates
-- Update status to 'Retired' for teachers with experience > 30 years
UPDATE Teachers SET Status = 'Retired' WHERE Experience > 30;

-- Increase salary by 10% for teachers with more than 5 years of experience
UPDATE Teachers
SET Salary = Salary * 1.10
WHERE Experience > 5;
--  Deletions
-- Delete teachers who are marked as 'Inactive'
DELETE FROM Teachers WHERE Status = 'Inactive';

-- Remove records of teachers hired before 2010
DELETE FROM Teachers WHERE HireDate < '2010-01-01';
-- Advanced Condition
-- Find teachers who earn above the average salary

SELECT * FROM Teachers
WHERE Salary > (SELECT AVG(Salary) FROM Teachers);




-- Table 3: Courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Description TEXT,
    Credits INT,
    Category VARCHAR(50),
    DurationWeeks INT,
    TeacherID INT,
    Level VARCHAR(20),
    Language VARCHAR(30),
    Status VARCHAR(20),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);


INSERT INTO Courses (CourseID, CourseName, Description, Credits, Category, DurationWeeks, TeacherID, Level, Language, Status) VALUES
(1, 'Mathematics 101', 'Introductory math course', 4, 'STEM', 12, 1, 'Beginner', 'English', 'Active'),
(2, 'Science Basics', 'Foundation in science', 3, 'STEM', 10, 2, 'Beginner', 'English', 'Active'),
(3, 'English Grammar', 'Grammar essentials', 2, 'Languages', 8, 3, 'Intermediate', 'English', 'Active'),
(4, 'World History', 'Global historical events', 3, 'Social Studies', 10, 4, 'Intermediate', 'English', 'Active'),
(5, 'Physical Geography', 'Earth’s features', 3, 'Social Studies', 10, 5, 'Intermediate', 'English', 'Active'),
(6, 'Python Programming', 'Basics of Python', 4, 'Computer Science', 12, 6, 'Beginner', 'English', 'Active'),
(7, 'Physics Concepts', 'Mechanics and waves', 4, 'STEM', 12, 7, 'Intermediate', 'English', 'Active'),
(8, 'Organic Chemistry', 'Carbon compounds', 4, 'STEM', 12, 8, 'Advanced', 'English', 'Active'),
(9, 'Macroeconomics', 'National economy', 3, 'Commerce', 10, 9, 'Advanced', 'English', 'Active'),
(10, 'Botany Basics', 'Plant biology', 3, 'Science', 10, 10, 'Beginner', 'English', 'Active');

-- List all courses
SELECT * FROM Courses;

-- Show active courses only
SELECT * FROM Courses WHERE Status = 'Active';

-- Get courses with more than 3 credits
SELECT * FROM Courses WHERE Credits > 3;

-- Find courses in the 'Science' category
SELECT * FROM Courses WHERE Category = 'Science';

-- List all 'Beginner' level courses
SELECT * FROM Courses WHERE Level = 'Beginner';

--  Aggregate & Grouping Queries
-- Count of courses per category
SELECT Category, COUNT(*) AS TotalCourses FROM Courses GROUP BY Category;
-- Average duration of courses by level
SELECT Level, AVG(DurationWeeks) AS AvgDuration FROM Courses GROUP BY Level;
-- Total credits assigned to each teacher
SELECT TeacherID, SUM(Credits) AS TotalCredits FROM Courses GROUP BY TeacherID;
-- Duration & Time-Based Queries
-- Courses lasting more than 12 weeks
SELECT * FROM Courses WHERE DurationWeeks > 12;

-- Courses with duration between 8 and 16 weeks
SELECT * FROM Courses WHERE DurationWeeks BETWEEN 8 AND 16;

-- Language & Text Filters
-- Courses offered in English

SELECT * FROM Courses WHERE Language = 'English';

-- Find courses whose names start with 'Intro'
SELECT * FROM Courses WHERE CourseName LIKE 'Intro%';

-- Get courses that mention 'data' in the description
SELECT * FROM Courses WHERE Description LIKE '%data%';
-- Update Queries
-- Change status of all ‘Archived’ courses to ‘Inactive’
UPDATE Courses SET Status = 'Inactive' WHERE Status = 'Archived';

-- Update duration to 15 weeks for all 'Intermediate' level courses
UPDATE Courses SET DurationWeeks = 15 WHERE Level = 'Intermediate';
--  Delete Queries
-- Delete courses with 0 credits
DELETE FROM Courses WHERE Credits = 0;

-- Remove courses that are marked as 'Cancelled'
DELETE FROM Courses WHERE Status = 'Cancelled';

-- Join with Teachers Table
-- List courses with teacher names
SELECT c.CourseID, c.CourseName, t.FirstName, t.LastName
FROM Courses c
JOIN Teachers t ON c.TeacherID = t.TeacherID;

-- Find number of courses assigned to each teacher
SELECT TeacherID, COUNT(*) AS CourseCount
FROM Courses
GROUP BY TeacherID;
-- Advanced Condition
-- List courses whose duration is longer than the average course duration
SELECT * FROM Courses
WHERE DurationWeeks > (SELECT AVG(DurationWeeks) FROM Courses);


-- Table 4: Enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Progress INT,
    CompletionDate DATE,
    Grade VARCHAR(5),
    Feedback TEXT,
    Status VARCHAR(20),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate, Progress, CompletionDate, Grade, Feedback, Status, PaymentStatus) VALUES
(1, 1, 1, '2023-06-01', 50, NULL, NULL, 'Doing well', 'In Progress', 'Paid'),
(2, 2, 1, '2023-06-02', 60, NULL, NULL, 'Excellent', 'In Progress', 'Paid'),
(3, 3, 2, '2023-06-03', 45, NULL, NULL, 'Needs improvement', 'In Progress', 'Pending'),
(4, 4, 3, '2023-06-04', 70, NULL, NULL, 'Great participation', 'In Progress', 'Paid'),
(5, 5, 4, '2023-06-05', 40, NULL, NULL, 'Struggling', 'In Progress', 'Paid'),
(6, 6, 5, '2023-06-06', 55, NULL, NULL, 'Average', 'In Progress', 'Paid'),
(7, 7, 6, '2023-06-07', 65, NULL, NULL, 'Above average', 'In Progress', 'Paid'),
(8, 8, 7, '2023-06-08', 35, NULL, NULL, 'Needs assistance', 'In Progress', 'Pending'),
(9, 9, 8, '2023-06-09', 80, NULL, NULL, 'Outstanding', 'In Progress', 'Paid'),
(10, 10, 9, '2023-06-10', 50, NULL, NULL, 'Good effort', 'In Progress', 'Paid');

-- Table 5: Classes
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(100),
    Schedule VARCHAR(50),
    RoomNumber VARCHAR(20),
    Capacity INT,
    CourseID INT,
    TeacherID INT,
    Semester VARCHAR(10),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);


INSERT INTO Classes (ClassID, ClassName, Schedule, RoomNumber, Capacity, CourseID, TeacherID, Semester, StartDate, EndDate) VALUES
(101, 'Math A', 'Mon-Wed 10am', 'R101', 30, 1, 1, '2023S1', '2023-06-01', '2023-08-31'),
(102, 'Science B', 'Tue-Thu 11am', 'R102', 25, 2, 2, '2023S1', '2023-06-01', '2023-08-31'),
(103, 'English C', 'Mon-Wed 2pm', 'R103', 20, 3, 3, '2023S1', '2023-06-01', '2023-08-31'),
(104, 'History D', 'Tue-Thu 1pm', 'R104', 30, 4, 4, '2023S1', '2023-06-01', '2023-08-31'),
(105, 'Geography E', 'Fri 9am', 'R105', 15, 5, 5, '2023S1', '2023-06-01', '2023-08-31'),
(106, 'Python F', 'Mon 3pm', 'R106', 20, 6, 6, '2023S1', '2023-06-01', '2023-08-31'),
(107, 'Physics G', 'Wed 10am', 'R107', 25, 7, 7, '2023S1', '2023-06-01', '2023-08-31'),
(108, 'Chemistry H', 'Thu 2pm', 'R108', 20, 8, 8, '2023S1', '2023-06-01', '2023-08-31'),
(109, 'Economics I', 'Fri 11am', 'R109', 30, 9, 9, '2023S1', '2023-06-01', '2023-08-31'),
(110, 'Botany J', 'Tue 4pm', 'R110', 15, 10, 10, '2023S1', '2023-06-01', '2023-08-31');


-- Table 6: Assignments
CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY,
    Title VARCHAR(100),
    Description TEXT,
    DueDate DATE,
    CourseID INT,
    ClassID INT,
    MaxMarks INT,
    AssignedDate DATE,
    Status VARCHAR(20),
    AttachmentLink VARCHAR(255),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

INSERT INTO Assignments (AssignmentID, Title, Description, DueDate, CourseID, ClassID, MaxMarks, AssignedDate, Status, AttachmentLink) VALUES
(1, 'Algebra HW', 'Practice algebra problems', '2023-07-15', 1, 101, 100, '2023-06-15', 'Open', 'link1'),
(2, 'Physics Quiz', 'Concepts of motion', '2023-07-20', 7, 107, 50, '2023-06-18', 'Open', 'link2'),
(3, 'Essay', 'Write on World Wars', '2023-07-25', 4, 104, 100, '2023-06-20', 'Open', 'link3'),
(4, 'Python Project', 'Basic calculator app', '2023-07-30', 6, 106, 100, '2023-06-22', 'Open', 'link4'),
(5, 'Grammar Test', 'Tenses exercise', '2023-07-10', 3, 103, 50, '2023-06-10', 'Open', 'link5'),
(6, 'Botany Diagram', 'Label plant parts', '2023-07-12', 10, 110, 30, '2023-06-12', 'Open', 'link6'),
(7, 'Chemistry Lab', 'Acid-base reactions', '2023-07-28', 8, 108, 70, '2023-06-25', 'Open', 'link7'),
(8, 'Economic Report', 'Indian GDP growth', '2023-07-22', 9, 109, 80, '2023-06-19', 'Open', 'link8'),
(9, 'Geography Map', 'Continents labeling', '2023-07-17', 5, 105, 60, '2023-06-16', 'Open', 'link9'),
(10, 'Science Experiment', 'Simple circuits', '2023-07-18', 2, 102, 90, '2023-06-14', 'Open', 'link10');


-- Table 7: Submissions
CREATE TABLE Submissions (
    SubmissionID INT PRIMARY KEY,
    AssignmentID INT,
    StudentID INT,
    SubmissionDate DATE,
    MarksObtained INT,
    Feedback TEXT,
    Status VARCHAR(20),
    FileLink VARCHAR(255),
    PlagiarismScore DECIMAL(5,2),
    LateSubmission BOOLEAN,
    FOREIGN KEY (AssignmentID) REFERENCES Assignments(AssignmentID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Submissions (SubmissionID, AssignmentID, StudentID, SubmissionDate, MarksObtained, Feedback, Status, FileLink, PlagiarismScore, LateSubmission) VALUES
(1, 1, 1, '2023-07-14', 90, 'Excellent work', 'Graded', 'sub_link1', 5.00, FALSE),
(2, 2, 2, '2023-07-19', 45, 'Good effort', 'Graded', 'sub_link2', 10.00, FALSE),
(3, 3, 3, '2023-07-24', 70, 'Needs clarity', 'Graded', 'sub_link3', 0.00, FALSE),
(4, 4, 4, '2023-07-29', 95, 'Outstanding project', 'Graded', 'sub_link4', 2.50, FALSE),
(5, 5, 5, '2023-07-09', 48, 'Improve grammar', 'Graded', 'sub_link5', 15.00, TRUE),
(6, 6, 6, '2023-07-11', 25, 'Incomplete submission', 'Graded', 'sub_link6', 0.00, TRUE),
(7, 7, 7, '2023-07-27', 60, 'Well done', 'Graded', 'sub_link7', 5.00, FALSE),
(8, 8, 8, '2023-07-21', 78, 'Very detailed', 'Graded', 'sub_link8', 7.50, FALSE),
(9, 9, 9, '2023-07-16', 55, 'Good attempt', 'Graded', 'sub_link9', 3.00, FALSE),
(10, 10, 10, '2023-07-17', 65, 'Nice experiment', 'Graded', 'sub_link10', 12.00, FALSE);

-- Table 8: Exams
CREATE TABLE Exams (
    ExamID INT PRIMARY KEY,
    ExamName VARCHAR(100),
    Date DATE,
    DurationMinutes INT,
    TotalMarks INT,
    CourseID INT,
    ClassID INT,
    Type VARCHAR(30),
    Status VARCHAR(20),
    ResultPublished BOOLEAN,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

INSERT INTO Exams (ExamID, ExamName, Date, DurationMinutes, TotalMarks, CourseID, ClassID, Type, Status, ResultPublished) VALUES
(1, 'Math Midterm', '2023-07-20', 90, 100, 1, 101, 'Written', 'Completed', TRUE),
(2, 'Science Quiz', '2023-07-22', 60, 50, 2, 102, 'Online', 'Completed', TRUE),
(3, 'English Final', '2023-07-30', 120, 100, 3, 103, 'Written', 'Upcoming', FALSE),
(4, 'History Exam', '2023-07-28', 90, 100, 4, 104, 'Written', 'Completed', TRUE),
(5, 'Geography Test', '2023-07-25', 60, 50, 5, 105, 'Online', 'Upcoming', FALSE),
(6, 'Python Practical', '2023-07-29', 90, 100, 6, 106, 'Practical', 'Upcoming', FALSE),
(7, 'Physics Theory', '2023-07-23', 90, 100, 7, 107, 'Written', 'Completed', TRUE),
(8, 'Chemistry Lab', '2023-07-27', 60, 50, 8, 108, 'Practical', 'Upcoming', FALSE),
(9, 'Economics Exam', '2023-07-24', 90, 100, 9, 109, 'Written', 'Completed', TRUE),
(10, 'Botany Assessment', '2023-07-26', 60, 50, 10, 110, 'Written', 'Upcoming', FALSE);


-- Table 9: Payments
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    StudentID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(30),
    Status VARCHAR(20),
    TransactionID VARCHAR(50),
    PaymentFor VARCHAR(100),
    ReceiptLink VARCHAR(255),
    Comments TEXT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Payments (PaymentID, StudentID, Amount, PaymentDate, PaymentMethod, Status, TransactionID, PaymentFor, ReceiptLink, Comments) VALUES
(1, 1, 5000.00, '2023-06-01', 'Card', 'Completed', 'TXN001', 'Course Fee', 'receipt1', 'First installment'),
(2, 2, 5200.00, '2023-06-02', 'UPI', 'Completed', 'TXN002', 'Course Fee', 'receipt2', ''),
(3, 3, 5300.00, '2023-06-03', 'NetBanking', 'Completed', 'TXN003', 'Course Fee', 'receipt3', 'On time'),
(4, 4, 5500.00, '2023-06-04', 'Card', 'Completed', 'TXN004', 'Course Fee', 'receipt4', ''),
(5, 5, 5100.00, '2023-06-05', 'UPI', 'Pending', 'TXN005', 'Course Fee', 'receipt5', 'Awaiting clearance'),
(6, 6, 5400.00, '2023-06-06', 'Cash', 'Completed', 'TXN006', 'Course Fee', 'receipt6', 'Paid at center'),
(7, 7, 5000.00, '2023-06-07', 'Card', 'Completed', 'TXN007', 'Course Fee', 'receipt7', ''),
(8, 8, 5200.00, '2023-06-08', 'NetBanking', 'Completed', 'TXN008', 'Course Fee', 'receipt8', ''),
(9, 9, 5300.00, '2023-06-09', 'UPI', 'Completed', 'TXN009', 'Course Fee', 'receipt9', ''),
(10, 10, 5500.00, '2023-06-10', 'Card', 'Completed', 'TXN010', 'Course Fee', 'receipt10', 'Final installment');


-- Table 10: DiscussionForum
CREATE TABLE DiscussionForum (
    PostID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Title VARCHAR(150),
    Content TEXT,
    PostDate DATE,
    ReplyCount INT,
    LastReplyDate DATE,
    Status VARCHAR(20),
    AttachmentLink VARCHAR(255),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO DiscussionForum (PostID, StudentID, CourseID, Title, Content, PostDate, ReplyCount, LastReplyDate, Status, AttachmentLink) VALUES
(1, 1, 1, 'Doubt in Algebra', 'How to solve quadratic equations?', '2023-07-01', 5, '2023-07-03', 'Open', 'forum_link1'),
(2, 2, 1, 'Math formulas', 'Request for formula sheet', '2023-07-02', 3, '2023-07-04', 'Closed', 'forum_link2'),
(3, 3, 2, 'Science Project', 'Need help with model ideas', '2023-07-05', 2, '2023-07-06', 'Open', 'forum_link3'),
(4, 4, 3, 'English Essay', 'Tips for writing essays?', '2023-07-07', 4, '2023-07-08', 'Open', 'forum_link4'),
(5, 5, 4, 'History Timeline', 'Where can I get a good timeline?', '2023-07-09', 1, '2023-07-10', 'Closed', 'forum_link5'),
(6, 6, 5, 'Map Reading', 'Help with latitude and longitude', '2023-07-11', 0, NULL, 'Open', 'forum_link6'),
(7, 7, 6, 'Python Installation', 'Installation error on Windows', '2023-07-12', 3, '2023-07-13', 'Open', 'forum_link7'),
(8, 8, 7, 'Physics Formulas', 'Derivation of kinematic equations', '2023-07-14', 2, '2023-07-15', 'Open', 'forum_link8'),
(9, 9, 8, 'Chemistry Lab', 'Safety precautions for experiments', '2023-07-16', 1, '2023-07-17', 'Open', 'forum_link9'),
(10, 10, 9, 'Economic Data', 'Where to find recent GDP figures?', '2023-07-18', 4, '2023-07-19', 'Closed', 'forum_link10');
