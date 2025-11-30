
--1. Planned hours calculation


SELECT c.Code AS "Course Code", 
(CAST(i.StudyYear AS TEXT) ||'-'|| i.InstanceID) AS "Course Instance ID", 
c.HP AS "HP", 
i.Period AS "Period", 
i.RegisterdStudents AS "# Students", 

COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Lecture'),0) AS "Lecture Hours",
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Tutorial'),0) AS "Tutorial Hours",
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Lab'),0) AS "Lab Hours",
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Seminar'),0) AS "Seminar Hours",
COALESCE(SUM(ROUND(pa.Hours)) FILTER (WHERE pa.Type = 'Other'),0)  AS "Other Overhead Hours",
COALESCE(SUM(ROUND(2 * c.HP + 28 + a.HpFactor)) FILTER (WHERE pa.Type = 'AdminHours'),0)  AS "Admin",
COALESCE(SUM(ROUND(32 + a.StudentFactor * i.RegisterdStudents)) FILTER (WHERE pa.Type = 'ExamHours'),0)  AS "Exam",

COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Lecture'),0) +
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Tutorial'),0) +
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Lab'),0) +
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Seminar'),0) +
COALESCE(SUM(ROUND(pa.Hours)) FILTER (WHERE pa.Type = 'Other'),0) +
COALESCE(SUM(ROUND(2 * c.HP + 28 + a.HpFactor)) FILTER (WHERE pa.Type = 'AdminHours'),0) +
COALESCE(SUM(ROUND(32 + a.StudentFactor * i.RegisterdStudents)) FILTER (WHERE pa.Type = 'ExamHours'),0)
AS "Total Hours"

FROM CourseLayout c
    JOIN Instance  i ON c.LayoutID = i.LayoutID
    JOIN PlannedActivities pa ON pa.CourseInstanceID = i.InstanceID
    JOIN ActivityType a ON pa.Type = a.Name

WHERE i.StudyYear = '2024'

GROUP BY
c.Code,
i.StudyYear,
i.InstanceID,
c.HP,
i.RegisterdStudents,
i.Period
ORDER BY
c.Code;


--2. Calculate acual allocated hours for a cource


SELECT c.Code AS "Course Code", 
(CAST(i.StudyYear AS TEXT) ||'-'|| i.InstanceID) AS "Course Instance ID", 
c.HP AS "HP", 
p.Name AS "Teacher's Name",
t.TitleDesignation AS "Designation",

COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Lecture'),0) AS "Lecture Hours",
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Tutorial'),0) AS "Tutorial Hours",
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Lab'),0) AS "Lab Hours",
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Seminar'),0) AS "Seminar Hours",
COALESCE(SUM(ROUND(pa.Hours)) FILTER (WHERE pa.Type = 'Other'),0)  AS "Other Overhead Hours",
COALESCE(SUM(ROUND(2 * c.HP + 28 + a.HpFactor)) FILTER (WHERE pa.Type = 'AdminHours'),0)  AS "Admin",
COALESCE(SUM(ROUND(32 + a.StudentFactor * i.RegisterdStudents)) FILTER (WHERE pa.Type = 'ExamHours'),0)  AS "Exam",

COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Lecture'),0) +
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Tutorial'),0) +
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Lab'),0) +
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Seminar'),0) +
COALESCE(SUM(ROUND(pa.Hours)) FILTER (WHERE pa.Type = 'Other'),0) +
COALESCE(SUM(ROUND(2 * c.HP + 28 + a.HpFactor)) FILTER (WHERE pa.Type = 'AdminHours'),0) +
COALESCE(SUM(ROUND(32 + a.StudentFactor * i.RegisterdStudents)) FILTER (WHERE pa.Type = 'ExamHours'),0)
AS "Total Hours"

FROM CourseLayout c
    JOIN Instance  i ON c.LayoutID = i.LayoutID
    JOIN PlannedActivities pa ON pa.CourseInstanceID = i.InstanceID
    JOIN ActivityType a ON pa.Type = a.Name
    JOIN EmployeesPlannedActivities epa ON epa.ActivityID = pa.ActivityID
    JOIN Employees e ON e.EmpoyeID = epa.EmpoyeID
    JOIN Titles t ON e.EmpoyeID = t.EmpoyeID
    JOIN Person p ON e.PersonID = p.PersonID

WHERE i.InstanceID = 1 --Decides what course istance to filter for

GROUP BY
c.Code,
i.StudyYear,
i.InstanceID,
c.HP,
i.RegisterdStudents,
i.Period,
p.Name,
t.TitleDesignation
ORDER BY
i.StudyYear;

--3. Calculate total alocated hours for a teacher


SELECT c.Code AS "Course Code", 
(CAST(i.StudyYear AS TEXT) ||'-'|| i.InstanceID) AS "Course Instance ID", 
c.HP AS "HP", 
p.Name AS "Teacher's Name",

COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Lecture'),0) AS "Lecture Hours",
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Tutorial'),0) AS "Tutorial Hours",
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Lab'),0) AS "Lab Hours",
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Seminar'),0) AS "Seminar Hours",
COALESCE(SUM(ROUND(pa.Hours)) FILTER (WHERE pa.Type = 'Other'),0)  AS "Other Overhead Hours",
COALESCE(SUM(ROUND(2 * c.HP + 28 + a.HpFactor)) FILTER (WHERE pa.Type = 'AdminHours'),0)  AS "Admin",
COALESCE(SUM(ROUND(32 + a.StudentFactor * i.RegisterdStudents)) FILTER (WHERE pa.Type = 'ExamHours'),0)  AS "Exam",

COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Lecture'),0) +
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Tutorial'),0) +
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Lab'),0) +
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Seminar'),0) +
COALESCE(SUM(ROUND(pa.Hours)) FILTER (WHERE pa.Type = 'Other'),0) +
COALESCE(SUM(ROUND(2 * c.HP + 28 + a.HpFactor)) FILTER (WHERE pa.Type = 'AdminHours'),0) +
COALESCE(SUM(ROUND(32 + a.StudentFactor * i.RegisterdStudents)) FILTER (WHERE pa.Type = 'ExamHours'),0)
AS "Total Hours"

FROM CourseLayout c
    JOIN Instance  i ON c.LayoutID = i.LayoutID
    JOIN PlannedActivities pa ON pa.CourseInstanceID = i.InstanceID
    JOIN ActivityType a ON pa.Type = a.Name
    JOIN EmployeesPlannedActivities epa ON epa.ActivityID = pa.ActivityID
    JOIN Employees e ON e.EmpoyeID = epa.EmpoyeID
    JOIN Person p ON e.PersonID = p.PersonID


WHERE p.Name = 'Frank Miller' AND i.StudyYear = '2024' --Decides what teacher and year to filter for

GROUP BY
c.Code,
i.StudyYear,
i.InstanceID,
c.HP,
i.RegisterdStudents,
i.Period,
p.Name
ORDER BY
p.Name,
i.StudyYear;


--4. List employee ids and names of all teachers who are alocated in more than a specific number of instances during the current period.


SELECT e.EmpoyeID AS "Employment ID", p.Name AS "Teacher's Name", i.Period As "Period", COUNT(DISTINCT pa.CourseInstanceID) FILTER (WHERE i.StudyYear = '2024') AS "No of Courses"
FROM Employees e
JOIN Person p ON p.PersonID = e.PersonID
JOIN EmployeesPlannedActivities epa ON e.EmpoyeID = epa.EmpoyeID
JOIN PlannedActivities pa ON epa.ActivityID = pa.ActivityID
JOIN Instance i ON pa.CourseInstanceID = i.InstanceID
WHERE i.Period = 'P1' --AND i.StudyYear = '2025'
GROUP BY p.Name,e.EmpoyeID,i.Period
HAVING COUNT(DISTINCT pa.CourseInstanceID) FILTER (WHERE i.StudyYear = '2024') > 0;

