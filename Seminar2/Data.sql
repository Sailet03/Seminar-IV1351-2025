INSERT INTO ActivityType (Name, Factor, HpFactor, StudentFactor) VALUES
('Lecture', 3.6, 1.0, 1.0),
('Seminar', 1.8, 1.0, 1.0),
('Lab', 2.4, 1.0, 1.0),
('Tutorial', 2.0, 1.0, 1.0),
('ExamHours', 1.0, 1.0, 0.725),
('AdminHours', 1.0, 2.0, 0.2),
('Other', 1.0, 1.0, 1.0);


INSERT INTO Department (DepartmentName) VALUES
('Biology'),
('Chemistry'),
('Computer Science'),
('Mathematics'),
('Physics');


INSERT INTO Person (Name, PhoneNumber, EmailAdress, Adress, PersonalNumber) VALUES
('Frank Miller', '555-1006', 'frank.miller@example.com', 'River Street 8', '9101016789'),
('Grace Lee', '555-1007', 'grace.lee@example.com', 'Hill Avenue 12', '9202023344'),
('Hannah Kim', '555-1008', 'hannah.kim@example.com', 'Forest Lane 5', '9303031122'),
('Ian Clark', '555-1009', 'ian.clark@example.com', 'Lake Road 14', '9404045566'),
('Alice Johnson', '555-1010', 'alice.johnson@example.com', 'Main Street 12', '9001011234'),
('Bob Smith', '555-1011', 'bob.smith@example.com', 'Oak Road 22', '8805055678');


INSERT INTO Employees (Salary, ManagerSupervisor, DepartmentName, PersonID) VALUES
(50000, NULL, 'Biology', 1),
(58000, NULL, 'Chemistry', 2),
(53000, NULL, 'Computer Science', 5),
(62000, NULL, 'Mathematics', 6),
(52000, NULL, 'Computer Science', 3),
(48000, NULL, 'Physics', 4);


UPDATE Employees SET ManagerSupervisor = 4 WHERE EmpoyeID IN (1,2);
UPDATE Employees SET ManagerSupervisor = 2 WHERE EmpoyeID IN (3,5);
UPDATE Employees SET ManagerSupervisor = 1 WHERE EmpoyeID = 6;


UPDATE Department SET ManagerID = 1 WHERE DepartmentName = 'Biology';
UPDATE Department SET ManagerID = 2 WHERE DepartmentName = 'Chemistry';
UPDATE Department SET ManagerID = 3 WHERE DepartmentName = 'Computer Science';
UPDATE Department SET ManagerID = 4 WHERE DepartmentName = 'Mathematics';


INSERT INTO Titles (EmpoyeID, TitleDesignation) VALUES
(1, 'Lecturer'),
(2, 'Senior Lecturer'),
(3, 'Assistant Professor'),
(4, 'Associate Professor'),
(5, 'Lecturer'),
(6, 'Lab Assistant');


INSERT INTO CourseLayout (Code, Name, HP, MinStudent, MaxStudent) VALUES
('CS101', 'Intro to Programming', 7, 10, 50),
('MA201', 'Linear Algebra', 5, 15, 100),
('PH110', 'General Physics', 10, 20, 80);


INSERT INTO Instance (RegisterdStudents, Period, StudyYear, LayoutID) VALUES
(30, 'P1', '2024', 1),
(25, 'P2', '2024', 2),
(40, 'P3', '2024', 3),
(35, 'P1', '2025', 1);


INSERT INTO PlannedActivities (Type, Hours, CourseInstanceID) VALUES
('Lecture', 20, 1), ('Lecture', 18, 1),
('Lab', 10, 1), ('Lab', 12, 1),
('Tutorial', 8, 1), ('Tutorial', 9, 1),
('Seminar', 6, 1), ('Seminar', 7, 1),
('Other', 5, 1), ('Other', 4, 1),
('AdminHours', NULL, 1), ('AdminHours', NULL, 1),
('ExamHours', NULL, 1), ('ExamHours', NULL, 1),
('Lecture', 25, 2), ('Lecture', 22, 2),
('Lab', 14, 2), ('Lab', 15, 2),
('Tutorial', 10, 2), ('Tutorial', 11, 2),
('Seminar', 8, 2), ('Seminar', 9, 2),
('Other', 6, 2), ('Other', 5, 2),
('AdminHours', NULL, 2), ('AdminHours', NULL, 2),
('ExamHours', NULL, 2), ('ExamHours', NULL, 2),
('Lecture', 18, 3), ('Lecture', 20, 3),
('Lab', 12, 3), ('Lab', 11, 3),
('Tutorial', 9, 3), ('Tutorial', 8, 3),
('Seminar', 7, 3), ('Seminar', 6, 3),
('Other', 4, 3), ('Other', 5, 3),
('AdminHours', NULL, 3), ('AdminHours', NULL, 3),
('ExamHours', NULL, 3), ('ExamHours', NULL, 3),
('Lecture', 15, 4), ('Lecture', 14, 4),
('Lab', 10, 4), ('Lab', 11, 4),
('Tutorial', 7, 4), ('Tutorial', 8, 4),
('Seminar', 6, 4), ('Seminar', 5, 4),
('Other', 3, 4), ('Other', 4, 4),
('AdminHours', NULL, 4), ('AdminHours', NULL, 4),
('ExamHours', NULL, 4), ('ExamHours', NULL, 4);


INSERT INTO EmployeesPlannedActivities (EmpoyeID, ActivityID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(1, 7),
(2, 8),
(3, 9),
(4, 10),
(5, 11),
(6, 12),
(1, 13),
(2, 14),
(3, 15),
(4, 16),
(5, 17),
(6, 18),
(1, 19),
(2, 20),
(3, 21),
(4, 22),
(5, 23),
(6, 24),
(1, 25),
(2, 26),
(3, 27),
(4, 28),
(5, 29),
(6, 30),
(1, 31),
(2, 32),
(3, 33),
(4, 34),
(5, 35),
(6, 36),
(1, 37),
(2, 38),
(3, 39),
(4, 40),
(5, 41),
(6, 42),
(1, 43),
(2, 44),
(3, 45),
(4, 46),
(5, 47),
(6, 48),
(1, 49),
(2, 50),
(3, 51),
(4, 52),
(5, 53),
(6, 54),
(1, 55),
(2, 56);
