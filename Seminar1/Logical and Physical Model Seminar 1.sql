CREATE TABLE ActivityType (
 Name VARCHAR(50) NOT NULL,
 Factor FLOAT(20) NOT NULL,
 HpFactor FLOAT(20),
 StudentFactor FLOAT(20)
);

ALTER TABLE ActivityType ADD CONSTRAINT PK_ActivityType PRIMARY KEY (Name);


CREATE TABLE CourseLayout (
 LayoutID INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 Code VARCHAR(10) NOT NULL,
 Name VARCHAR(50) NOT NULL,
 HP INT NOT NULL,
 MinStudent INT NOT NULL,
 MaxStudent INT NOT NULL
);

ALTER TABLE CourseLayout ADD CONSTRAINT PK_CourseLayout PRIMARY KEY (LayoutID);


CREATE TABLE Department (
 DepartmentName VARCHAR(50) NOT NULL,
 ManagerID INT
);

ALTER TABLE Department ADD CONSTRAINT PK_Department PRIMARY KEY (DepartmentName);


CREATE TABLE Employees (
 EmpoyeID INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 Salary INT NOT NULL,
 ManagerSupervisor INT,
 DepartmentName VARCHAR(50),
 PersonID INT NOT NULL
);

ALTER TABLE Employees ADD CONSTRAINT PK_Employees PRIMARY KEY (EmpoyeID);


CREATE TABLE Instance (
 InstanceID INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 RegisterdStudents INT NOT NULL,
 Period VARCHAR(10) NOT NULL,
 StudyYear VARCHAR(10) NOT NULL,
 LayoutID INT NOT NULL
);

ALTER TABLE Instance ADD CONSTRAINT PK_Instance PRIMARY KEY (InstanceID);


CREATE TABLE Person (
 PersonID INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 Name VARCHAR(50) NOT NULL,
 PhoneNumber VARCHAR(20),
 EmailAdress VARCHAR(200),
 Adress VARCHAR(200),
 PersonalNumber VARCHAR(20) NOT NULL
);

ALTER TABLE Person ADD CONSTRAINT PK_Person PRIMARY KEY (PersonID);


CREATE TABLE PlannedActivities (
 ActivityID INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 Type VARCHAR(50) NOT NULL,
 Hours INT,
 CourseInstanceID INT NOT NULL
);

ALTER TABLE PlannedActivities ADD CONSTRAINT PK_PlannedActivities PRIMARY KEY (ActivityID);


CREATE TABLE Titles (
 EmpoyeID INT NOT NULL,
 TitleDesignation VARCHAR(50) NOT NULL
);

ALTER TABLE Titles ADD CONSTRAINT PK_Titles PRIMARY KEY (EmpoyeID,TitleDesignation);


CREATE TABLE EmployeesPlannedActivities (
 EmpoyeID INT NOT NULL,
 ActivityID INT NOT NULL
);

ALTER TABLE EmployeesPlannedActivities ADD CONSTRAINT PK_EmployeesPlannedActivities PRIMARY KEY (EmpoyeID,ActivityID);


ALTER TABLE Department ADD CONSTRAINT FK_Department_0 FOREIGN KEY (ManagerID) REFERENCES Employees (EmpoyeID);


ALTER TABLE Employees ADD CONSTRAINT FK_Employees_0 FOREIGN KEY (ManagerSupervisor) REFERENCES Employees (EmpoyeID);
ALTER TABLE Employees ADD CONSTRAINT FK_Employees_1 FOREIGN KEY (DepartmentName) REFERENCES Department (DepartmentName);
ALTER TABLE Employees ADD CONSTRAINT FK_Employees_2 FOREIGN KEY (PersonID) REFERENCES Person (PersonID);


ALTER TABLE Instance ADD CONSTRAINT FK_Instance_0 FOREIGN KEY (LayoutID) REFERENCES CourseLayout (LayoutID);


ALTER TABLE PlannedActivities ADD CONSTRAINT FK_PlannedActivities_0 FOREIGN KEY (Type) REFERENCES ActivityType (Name);
ALTER TABLE PlannedActivities ADD CONSTRAINT FK_PlannedActivities_1 FOREIGN KEY (CourseInstanceID) REFERENCES Instance (InstanceID);


ALTER TABLE Titles ADD CONSTRAINT FK_Titles_0 FOREIGN KEY (EmpoyeID) REFERENCES Employees (EmpoyeID);


ALTER TABLE EmployeesPlannedActivities ADD CONSTRAINT FK_EmployeesPlannedActivities_0 FOREIGN KEY (EmpoyeID) REFERENCES Employees (EmpoyeID);
ALTER TABLE EmployeesPlannedActivities ADD CONSTRAINT FK_EmployeesPlannedActivities_1 FOREIGN KEY (ActivityID) REFERENCES PlannedActivities (ActivityID);

