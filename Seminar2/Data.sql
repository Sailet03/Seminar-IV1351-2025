INSERT INTO ActivityType (Name, Factor, HpFactor, StudentFactor) VALUES
('Lecture', 3.6, 1.0, 1.0),
('Seminar', 1.8, 1.0, 1.0),
('Lab', 2.4, 1.0, 1.0),
('Tutorial', 2.0, 1.0, 1.0),
('ExamHours', 1.0, 1.0, 0.7),
('AdminHours', 1.0, 2.0, 0.2);


INSERT INTO Department (DepartmentName) VALUES
('Computer Science'),
('Mathematics'),
('Physics'),
('Management');



INSERT INTO Person (Name, PhoneNumber, EmailAdress, Adress, PersonalNumber) VALUES
('Alice Johnson', '555-1001', 'alice.johnson@example.com', 'Main Street 12', '9001011234'),
('Bob Smith', '555-1002', 'bob.smith@example.com', 'Oak Road 22', '8805055678'),
('Carol White', '555-1003', 'carol.white@example.com', 'Sunset Ave 3', '9202023456'),
('David Brown', '555-1004', 'david.brown@example.com', 'Pine Street 5', '8707079876'),
('Eva Green', '555-1005', 'eva.green@example.com', 'Maple Drive 18', '9303032222');



INSERT INTO Employees (Salary, ManagerSupervisor, DepartmentName, PersonID) VALUES
(52000, NULL, 'Computer Science', 1),
(60000, NULL, 'Mathematics', 2),
(48000, NULL, 'Physics', 3),
(75000, NULL, 'Management', 4),
(55000, NULL, 'Computer Science', 5);


UPDATE Department SET ManagerID = 4 WHERE DepartmentName = 'Management';
UPDATE Department SET ManagerID = 1 WHERE DepartmentName = 'Computer Science';
UPDATE Department SET ManagerID = 2 WHERE DepartmentName = 'Mathematics';
UPDATE Department SET ManagerID = 3 WHERE DepartmentName = 'Physics';


UPDATE Employees SET ManagerSupervisor = 4 WHERE EmpoyeID IN (1,2,3);
UPDATE Employees SET ManagerSupervisor = 1 WHERE EmpoyeID = 5;



INSERT INTO Titles (EmpoyeID, TitleDesignation) VALUES
(1, 'Senior Lecturer'),
(1, 'Course Coordinator'),
(2, 'Associate Professor'),
(3, 'Lab Assistant'),
(4, 'Department Head'),
(5, 'Lecturer');



INSERT INTO CourseLayout (Code, Name, HP, MinStudent, MaxStudent) VALUES
('CS101', 'Intro to Programming', 7, 10, 50),
('MA201', 'Linear Algebra', 5, 15, 100),
('PH110', 'General Physics', 10, 20, 80);



INSERT INTO Instance (RegisterdStudents, Period, StudyYear, LayoutID) VALUES
(45, 'P1', '2024', 1),
(80, 'P2', '2024', 2),
(60, 'P3', '2024', 3);



INSERT INTO PlannedActivities (Type, Hours, CourseInstanceID) VALUES
('Lecture', 20, 1),
('Lab', 10, 1),
('Seminar', 8, 2),
('Lecture', 25, 2),
('Tutorial', 15, 3),
('ExamHours', 5, 3);



INSERT INTO EmployeesPlannedActivities (EmpoyeID, ActivityID) VALUES
(1, 1),
(5, 2),
(2, 3),
(1, 4),
(3, 5),
(4, 6);
