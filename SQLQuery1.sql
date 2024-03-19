USE Academy3
go

--1 Дисципліни
CREATE TABLE Subjects (
    [Id] INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(100) NOT NULL UNIQUE
);

--2 Викладачі
CREATE TABLE Teachers (
    [Id] INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(MAX) NOT NULL,
    [Surname] NVARCHAR(MAX) NOT NULL
);

--3 Аудиторії
CREATE TABLE LectureRooms (
    [Id] INT PRIMARY KEY IDENTITY,
    [Building] INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
    [Name] NVARCHAR(10) NOT NULL UNIQUE
);

--4 Асистенти
CREATE TABLE Assistants (
    [Id] INT PRIMARY KEY IDENTITY,
    [TeacherId] INT NOT NULL,
    FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
);

--5 Куратори
CREATE TABLE Curators (
    [Id] INT PRIMARY KEY IDENTITY,
    [TeacherId] INT NOT NULL,
    FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
);

--6 Декани 
CREATE TABLE Deans (
    Id INT PRIMARY KEY IDENTITY,
    TeacherId INT NOT NULL,
    FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
);

--7 Факультети
CREATE TABLE Faculties (
    [Id] INT PRIMARY KEY IDENTITY,
    [Building] INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
    [Name] NVARCHAR(100) NOT NULL UNIQUE,
    [DeanId] INT NOT NULL,
    FOREIGN KEY (DeanId) REFERENCES Teachers(Id)
);

--8 Кафедри
CREATE TABLE Departments (
    [Id] INT PRIMARY KEY IDENTITY,
    [Building] INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
    [Name] NVARCHAR(100) NOT NULL UNIQUE,
    [FacultyId] INT NOT NULL,
    [HeadId] INT NOT NULL,
    FOREIGN KEY (FacultyId) REFERENCES Faculties(Id),
    FOREIGN KEY (HeadId) REFERENCES Teachers(Id)
);



--9 Групи
CREATE TABLE Groups (
    [Id] INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(10) NOT NULL,
    [Year] INT NOT NULL CHECK (Year BETWEEN 1 AND 5),
    [DepartmentId] INT NOT NULL,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

--10 Групи та куратори
CREATE TABLE GroupsCurators (
    [Id] INT PRIMARY KEY IDENTITY,
    [CuratorId] INT NOT NULL,
    [GroupId] INT NOT NULL,
    FOREIGN KEY (CuratorId) REFERENCES Teachers(Id),
    FOREIGN KEY (GroupId) REFERENCES Groups(Id)
);

--11 Завідувачі
CREATE TABLE Heads (
    Id INT PRIMARY KEY IDENTITY,
    TeacherId INT NOT NULL,
    FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
);

--12 Лекції
CREATE TABLE Lectures (
    [Id] INT PRIMARY KEY IDENTITY,
    [SubjectId] INT NOT NULL,
    [TeacherId] INT NOT NULL,
    FOREIGN KEY (SubjectId) REFERENCES Subjects(Id),
    FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
);

--13 Групи та лекції
CREATE TABLE GroupsLectures (
    [Id] INT PRIMARY KEY IDENTITY,
    [GroupId] INT NOT NULL,
    [LectureId] INT NOT NULL,
    FOREIGN KEY (GroupId) REFERENCES Groups(Id),
    FOREIGN KEY (LectureId) REFERENCES Lectures(Id)
);


--14 Розклад
CREATE TABLE Schedules (
    [Id] INT PRIMARY KEY IDENTITY,
    [Class] INT NOT NULL CHECK (Class BETWEEN 1 AND 8),
    [DayOfWeek] INT NOT NULL CHECK (DayOfWeek BETWEEN 1 AND 7),
    [Week] INT NOT NULL CHECK (Week BETWEEN 1 AND 52),
    [LectureId] INT NOT NULL,
    [LectureRoomId] INT NOT NULL,
    FOREIGN KEY (LectureId) REFERENCES Lectures(Id),
    FOREIGN KEY (LectureRoomId) REFERENCES LectureRooms(Id)
);