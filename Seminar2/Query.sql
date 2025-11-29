
--Planned hours calculation

SELECT c.Code AS "Course Code", 
(CAST(i.StudyYear AS TEXT) ||'-'|| i.InstanceID) AS "Course Instance ID", 
c.HP AS "HP", 
i.Period AS "Period", 
i.RegisterdStudents AS "# Students", 

SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Lecture') AS "Lecture Hours",
SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Tutorial') AS "Tutorial Hours",
SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Lab') AS "Lab Hours",
SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Seminar') AS "Seminar Hours",
SUM(ROUND(pa.Hours)) FILTER (WHERE pa.Type = 'Other')  AS "Other Overhead Hours",
SUM(ROUND(2 * c.HP + 28 + a.HpFactor)) FILTER (WHERE pa.Type = 'AdminHours')  AS "Admin",
SUM(ROUND(32 + a.StudentFactor * i.RegisterdStudents)) FILTER (WHERE pa.Type = 'ExamHours')  AS "Exam",

COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Lecture'),0) +
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Tutorial'),0) +
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Lab'),0) +
COALESCE(SUM(ROUND(pa.Hours * a.Factor)) FILTER (WHERE pa.Type = 'Seminar'),0) +
COALESCE(SUM(ROUND(pa.Hours)) FILTER (WHERE pa.Type = 'Other'),0) +
COALESCE(SUM(ROUND(2 * c.HP + 28 + a.HpFactor)) FILTER (WHERE pa.Type = 'AdminHours'),0) +
COALESCE(SUM(ROUND(32 + a.StudentFactor * i.RegisterdStudents)) FILTER (WHERE pa.Type = 'ExamHours'))
AS "Total Hours"

FROM CourseLayout c
    JOIN Instance  i ON c.LayoutID = i.LayoutID
    JOIN PlannedActivities pa on pa.CourseInstanceID = i.InstanceID
    JOIN ActivityType a on pa.Type = a.Name

GROUP BY
c.Code,
i.StudyYear,
i.InstanceID,
c.HP,
i.RegisterdStudents,
i.Period
ORDER BY
c.Code;