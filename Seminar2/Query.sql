SELECT CourseLayout.LayoutID, CourseLayout.Code, CourseLayout.HP, Instance.RegisterdStudents, Instance.Period, Instance.LayoutID, Instance.InstanceID, Instance.StudyYear
FROM CourseLayout 
JOIN Instance 
ON CourseLayout.LayoutID = Instance.LayoutID;
