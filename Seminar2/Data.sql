-- ===== Activity Types =====
INSERT INTO ActivityType (Name, Factor, HpFactor, StudentFactor) VALUES
('Lecture', 3.6, 1.0, 1.0),
('Seminar', 1.8, 1.0, 1.0),
('Lab', 2.4, 1.0, 1.0),
('Tutorial', 2.4, 1.0, 1.0),
('ExamHours', 1.0, 1.0, 0.725),
('AdminHours', 1.0, 2.0, 0.2);

-- ===== Departments =====
-- ManagerID is identity → leave it NULL initially
INSERT INTO Department (DepartmentName) VALUES
('Computer Science'),
('Mathematics'),
('Physics'),
('Management');

-- ===== Persons =====
INSERT INTO Person (Name, PhoneNumber, EmailAdress, Adress, PersonalNumber) VALUES
('Alice Johnson', '555-1001', 'alice.johnson@example.com', 'Main Street 12', '9001011234'),
('Bob Smith', '555-1002', 'bob.smith@example.com', 'Oak Road 22', '8805055678'),
('Carol White', '555-1003', 'carol.white@example.com', 'Sunset Ave 3', '9202023456'),
('David Brown', '555-1004', 'david.brown@example.com', 'Pine Street 5', '8707079876'),
('Eva Green', '555-1005', 'eva.green@example.com', 'Maple Drive 18', '9303032222');

-- ===== Employees =====
-- EmpoyeID, ManagerSupervisor, PersonID are identity → DO NOT insert them.
-- PersonID MUST be inserted after creation using UPDATE.

INSERT INTO Employees (Salary, DepartmentName)
VALUES
(52000, 'Computer Science'),
(60000, 'Mathematics'),
(48000, 'Physics'),
(75000, 'Management'),
(55000, 'Computer Science');

-- ===== Fix Employees → connect Employee.PersonID to Person.PersonID =====
UPDATE Employees SET PersonID = Person.PersonID
FROM Person
WHERE Employees.EmpoyeID = Person.PersonID;

-- ===== Manager-Supervisor Links =====
-- Now IDs exist and can be referenced
UPDATE Department SET ManagerID = 4 WHERE DepartmentName = 'Management';
UPDATE Department SET ManagerID = 1 WHERE DepartmentName = 'Computer Science';
UPDATE Department SET ManagerID = 2 WHERE DepartmentName = 'Mathematics';
UPDATE Department SET ManagerID = 3 WHERE DepartmentName = 'Physics';

UPDATE Employees SET ManagerSupervisor = 4 WHERE EmpoyeID IN (1,2,3);
UPDATE Employees SET ManagerSupervisor = 1 WHERE EmpoyeID = 5;

-- ===== Titles =====
-- EmpoyeID is identity in Employees table → allowed here (FK reference)
INSERT INTO Titles (EmpoyeID, TitleDesignation) VALUES
(1, 'Senior Lecturer'),
(1, 'Course Coordinator'),
(2, 'Associate Professor'),
(3, 'Lab Assistant'),
(4, 'Department Head'),
(5, 'Lecturer');

-- ===== Course Layouts =====
INSERT INTO CourseLayout (Code, Name, HP, MinStudent, MaxStudent) VALUES
('CS101', 'Intro to Programming', 7, 10, 50),
('MA201', 'Linear Algebra', 5, 15, 100),
('PH110', 'General Physics', 10, 20, 80);

-- ===== Course Instances =====
-- LayoutID is identity → use generated values in FK
INSERT INTO Instance (RegisterdStudents, Period, StudyYear, LayoutID)
VALUES
(45, 'P1', '2024/2025', 1),
(80, 'P2', '2024/2025', 2),
(60, 'P3', '2024/2025', 3);

-- ===== Planned Activities =====
INSERT INTO PlannedActivities (Type, Hours, CourseInstanceID) VALUES
('Lecture', 20, 1),
('Lab', 10, 1),
('Seminar', 8, 2),
('Lecture', 25, 2),
('Project Supervision', 15, 3),
('Exam', 5, 3);

-- ===== Employee Activity Assignments =====
INSERT INTO EmployeesPlannedActivities (EmpoyeID, ActivityID) VALUES
(1, 1),
(5, 2),
(2, 3),
(1, 4),
(3, 5),
(4, 6);

