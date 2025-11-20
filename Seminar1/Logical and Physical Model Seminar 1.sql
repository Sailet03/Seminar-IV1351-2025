CREATE TABLE ActivityType (
 Name CHAR(50) NOT NULL,
 Factor FLOAT(20) NOT NULL
);

ALTER TABLE ActivityType ADD CONSTRAINT PK_ActivityType PRIMARY KEY (Name);


CREATE TABLE Course (
 Code CHAR(10) NOT NULL,
 Name CHAR(50) NOT NULL,
 HP INT NOT NULL,
 MinStudent INT NOT NULL,
 MaxStudent INT NOT NULL
);

ALTER TABLE Course ADD CONSTRAINT PK_Course PRIMARY KEY (Code);


CREATE TABLE Department (
 DepartmentName CHAR(50) NOT NULL,
 EmpoyeID CHAR(10) NOT NULL
);

ALTER TABLE Department ADD CONSTRAINT PK_Department PRIMARY KEY (DepartmentName);


CREATE TABLE Employees (
 EmpoyeID CHAR(10) NOT NULL,
 Salary INT NOT NULL,
 PersonalNumber CHAR(10) NOT NULL,
 ManagerSupervisor CHAR(10),
 DepartmentName CHAR(50)
);

ALTER TABLE Employees ADD CONSTRAINT PK_Employees PRIMARY KEY (EmpoyeID);


CREATE TABLE Instance (
 InstanceID INT NOT NULL,
 Code CHAR(10) NOT NULL,
 RegisterdStudents INT NOT NULL,
 Period CHAR(2) NOT NULL,
 StudyYear CHAR(10) NOT NULL
);

ALTER TABLE Instance ADD CONSTRAINT PK_Instance PRIMARY KEY (InstanceID);


CREATE TABLE Person (
 PersonalNumber CHAR(10) NOT NULL,
 Name CHAR(50) NOT NULL,
 PhoneNumber CHAR(50),
 EmailAdress CHAR(200),
 Adress CHAR(200)
);

ALTER TABLE Person ADD CONSTRAINT PK_Person PRIMARY KEY (PersonalNumber);


CREATE TABLE PlannedActivities (
 ActivityID INT NOT NULL,
 Type CHAR(50) NOT NULL,
 Hours INT NOT NULL,
 CourseInstanceID INT NOT NULL,
 EmpoyeID CHAR(10) NOT NULL
);

ALTER TABLE PlannedActivities ADD CONSTRAINT PK_PlannedActivities PRIMARY KEY (ActivityID);


CREATE TABLE Titles (
 EmpoyeID CHAR(10) NOT NULL,
 TitleDesignation CHAR(50) NOT NULL
);

ALTER TABLE Titles ADD CONSTRAINT PK_Titles PRIMARY KEY (EmpoyeID,TitleDesignation);


ALTER TABLE Department ADD CONSTRAINT FK_Department_0 FOREIGN KEY (EmpoyeID) REFERENCES Employees (EmpoyeID);


ALTER TABLE Employees ADD CONSTRAINT FK_Employees_0 FOREIGN KEY (PersonalNumber) REFERENCES Person (PersonalNumber);
ALTER TABLE Employees ADD CONSTRAINT FK_Employees_1 FOREIGN KEY (ManagerSupervisor) REFERENCES Employees (EmpoyeID);
ALTER TABLE Employees ADD CONSTRAINT FK_Employees_2 FOREIGN KEY (DepartmentName) REFERENCES Department (DepartmentName);


ALTER TABLE Instance ADD CONSTRAINT FK_Instance_0 FOREIGN KEY (Code) REFERENCES Course (Code);


ALTER TABLE PlannedActivities ADD CONSTRAINT FK_PlannedActivities_0 FOREIGN KEY (Type) REFERENCES ActivityType (Name);
ALTER TABLE PlannedActivities ADD CONSTRAINT FK_PlannedActivities_1 FOREIGN KEY (CourseInstanceID) REFERENCES Instance (InstanceID);
ALTER TABLE PlannedActivities ADD CONSTRAINT FK_PlannedActivities_2 FOREIGN KEY (EmpoyeID) REFERENCES Employees (EmpoyeID);


ALTER TABLE Titles ADD CONSTRAINT FK_Titles_0 FOREIGN KEY (EmpoyeID) REFERENCES Employees (EmpoyeID);


