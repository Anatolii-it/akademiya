-- відповіді на домашне завдання
--1 завдання
SELECT LectureRooms.Name AS LectureRoomName
FROM Teachers
JOIN Lectures ON Teachers.Id = Lectures.TeacherId
JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
JOIN Departments ON Groups.DepartmentId = Departments.Id
JOIN LectureRooms ON Departments.Building = LectureRooms.Building
WHERE Teachers.Name = 'Edward' AND Teachers.Surname = 'Hopper';

--2 завдання
SELECT DISTINCT Teachers.Surname AS AssistantSurname
FROM Teachers
JOIN Assistants ON Teachers.Id = Assistants.TeacherId
JOIN Lectures ON Teachers.Id = Lectures.TeacherId
JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
WHERE Groups.Name = 'F506';

--3 завдання
SELECT DISTINCT Subjects.Name AS Discipline
FROM Teachers
JOIN Lectures ON Teachers.Id = Lectures.TeacherId
JOIN Subjects ON Lectures.SubjectId = Subjects.Id
JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
WHERE Teachers.Name = 'Liam' AND Teachers.Surname = 'Jones'
AND Groups.Year = 5;

--4 завдання
SELECT DISTINCT Teachers.Surname
FROM Teachers
LEFT JOIN Lectures ON Teachers.Id = Lectures.TeacherId
LEFT JOIN Schedules ON Lectures.Id = Schedules.LectureId AND Schedules.DayOfWeek = 1
WHERE Schedules.LectureId IS NULL;

--5 завдання
SELECT LectureRooms.Name AS RoomName, LectureRooms.Building AS BuildingNumber
FROM LectureRooms
WHERE LectureRooms.Id NOT IN (
    SELECT Schedules.LectureRoomId
    FROM Schedules
    WHERE Schedules.DayOfWeek = 3 
    AND Schedules.Week = 2 
    AND Schedules.Class = 3
);
