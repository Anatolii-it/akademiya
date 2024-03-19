USE Academy3
go


--Дісциплини +
INSERT INTO Subjects ([Name])
VALUES
    ('Mathematics'),
    ('Computer Science'),
    ('Physics'),
    ('Chemistry'),
    ('Biology'),
    ('History'),
    ('Literature'),
    ('Geography'),
    ('Art'),
    ('Music');

--2 Викладачі +

INSERT INTO Teachers ([Name], [Surname])
VALUES 
    ('James', 'Thompson'),
    ('Mia', 'Martinez'),
    ('Michael', 'Hernandez'),
    ('Edvard', 'Hopper'),
    ('Olivia', 'Johnson'),
    ('Noah', 'Williams'),
    ('Ava', 'Brown'),
    ('Liam', 'Jones'),
    ('Emma', 'Davis'),
    ('William', 'Miller'),
    ('Sophia', 'Wilson'),
    ('Alexander', 'Taylor'),
    ('Isabella', 'Anderson');

-- аудіторії +
	INSERT INTO LectureRooms ([Building], [Name])
VALUES 
    (1, 'A101'),
    (2, 'A102'),
    (3, 'A103'),
    (4, 'A104'),
    (5, 'A105'),
    (1, 'A106'),
    (2, 'A107'),
    (3, 'A108'),
    (4, 'A109'),
    (5, 'A110');




--Факультет +
INSERT INTO Faculties ([Building], [Name], [DeanId])
VALUES 
    (1, 'Computer Science', 1),
    (2, 'Information Technology', 2),
    (3, 'Software Engineering', 3),
    (4, 'Computer Engineering', 4),
    (5, 'Cybersecurity', 5);


--Кафедри +
INSERT INTO Departments ([Building], [Name], [FacultyId], [HeadId])
VALUES 
    (1, 'Software Development', 1, 1),
    (2, 'Network Security', 1, 2),
    (3, 'Data Science', 1, 3),
    (4, 'Artificial Intelligence', 1, 4),
    (5, 'Computer Graphics', 1, 5);

	--Групи +
INSERT INTO Groups ([Name], [Year], [DepartmentId])
VALUES 
    ('F500', 1, 1),
    ('F501', 2, 2),
    ('F502', 1, 3),
    ('F503', 1, 4),
    ('F504', 5, 5),
    ('F505', 2, 1),
    ('F506', 2, 2),
    ('F507', 2, 3),
    ('F508', 2, 4),
    ('F509', 2, 5),
    ('F510', 3, 1);

	--Асістенти +
INSERT INTO Assistants (TeacherId)
VALUES 
    (10),
    (11),
    (12),
    (13);

	--Декани +
INSERT INTO Deans (TeacherId)
VALUES 
    (1),
    (2),
    (3),
    (4);

	--куратори +
INSERT INTO Curators (TeacherId)
VALUES 
(5),
(6),
(7);

--зами +
INSERT INTO Heads(TeacherId)
VALUES 
(8),
(9);

--Лекції +
INSERT INTO Lectures (SubjectId, TeacherId)
VALUES 
    (1, 4),
    (2, 5),
    (3, 6),
    (4, 7),
    (5, 8),
    (6, 9),
    (7, 10),
    (8, 11),
    (9, 12),
    (10, 13);

	

	--групи та куратори
INSERT INTO GroupsCurators (CuratorId, GroupId)
VALUES 
    (5, 1),
    (6, 2),
    (7, 3);

	-- група лекція 
INSERT INTO GroupsLectures (GroupId, LectureId)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);
	

-- Запит для додавання розкладу з понеділка по п'ятницю на весь тиждень з 8:00 до 16:00
INSERT INTO Schedules ([Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId])
VALUES
    -- Понеділок
    (1, 1, 1, 1, 1),
    (2, 1, 1, 2, 2),
    (3, 1, 1, 3, 3),
    (4, 1, 1, 4, 4),
    (5, 1, 1, 5, 5),
    (6, 1, 1, 6, 6),
    (7, 1, 1, 7, 7),
    (8, 1, 1, 8, 8),

    -- Вівторок
    (1, 2, 1, 1, 1),
    (2, 2, 1, 2, 2),
    (3, 2, 1, 3, 3),
    (4, 2, 1, 4, 4),
    (5, 2, 1, 5, 5),
    (6, 2, 1, 6, 6),
    (7, 2, 1, 7, 7),
    (8, 2, 1, 8, 8),

    -- Середа
    (1, 3, 1, 1, 1),
    (2, 3, 1, 2, 2),
    (3, 3, 1, 3, 3),
    (4, 3, 1, 4, 4),
    (5, 3, 1, 5, 5),
    (6, 3, 1, 6, 6),
    (7, 3, 1, 7, 7),
    (8, 3, 1, 8, 8),

    -- Четвер
    (1, 4, 1, 1, 1),
    (2, 4, 1, 2, 2),
    (3, 4, 1, 3, 3),
    (4, 4, 1, 4, 4),
    (5, 4, 1, 5, 5),
    (6, 4, 1, 6, 6),
    (7, 4, 1, 7, 7),
    (8, 4, 1, 8, 8),

    -- П'ятниця
    (1, 5, 1, 1, 1),
    (2, 5, 1, 2, 2),
    (3, 5, 1, 3, 3),
    (4, 5, 1, 4, 4),
    (5, 5, 1, 5, 5),
    (6, 5, 1, 6, 6),
    (7, 5, 1, 7, 7),
    (8, 5, 1, 8, 8);