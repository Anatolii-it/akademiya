--6 завданн€

SELECT DISTINCT Teachers.Name, Teachers.Surname
FROM Teachers
JOIN Faculties ON Teachers.Id = Faculties.DeanId
JOIN Departments ON Faculties.Id = Departments.FacultyId
WHERE Faculties.Name = 'Computer Science'
AND Departments.Name <> 'Software Development';

--7 завданн€ (в ц≥њ баз≥ беглузде питанн€ корпуса повтор€ютс€ в р≥зних таблиц€х)
SELECT DISTINCT Building
FROM (
    SELECT Building FROM Faculties
    UNION
    SELECT Building FROM Departments
    UNION
    SELECT Building FROM LectureRooms
) AS CampusBuildings;

--8 завданн€ (теж коварне питанн€)

SELECT Teachers.Name, Teachers.Surname, 'Dean' AS Position, 1 AS SortOrder
FROM Teachers
JOIN Deans ON Teachers.Id = Deans.TeacherId
UNION
SELECT Teachers.Name, Teachers.Surname, 'Head of Department' AS Position, 2 AS SortOrder
FROM Teachers
JOIN Heads ON Teachers.Id = Heads.TeacherId
UNION
SELECT Teachers.Name, Teachers.Surname, 'Lecturer' AS Position, 3 AS SortOrder
FROM Teachers
LEFT JOIN Deans ON Teachers.Id = Deans.TeacherId
LEFT JOIN Heads ON Teachers.Id = Heads.TeacherId
WHERE Deans.Id IS NULL AND Heads.Id IS NULL
UNION
SELECT Teachers.Name, Teachers.Surname, 'Curator' AS Position, 4 AS SortOrder
FROM Teachers
JOIN Curators ON Teachers.Id = Curators.TeacherId
UNION
SELECT Teachers.Name, Teachers.Surname, 'Assistant' AS Position, 5 AS SortOrder
FROM Teachers
JOIN Assistants ON Teachers.Id = Assistants.TeacherId
ORDER BY SortOrder;

--9 завданн€ (теж коварне питанн€)
SELECT DISTINCT DayOfWeek
FROM Schedules
JOIN LectureRooms ON Schedules.LectureRoomId = LectureRooms.Id
WHERE LectureRooms.Name IN ('A311', 'A104');

