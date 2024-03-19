USE Academy3
go

--1 ���������
CREATE TABLE Subjects (
    [Id] INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(100) NOT NULL UNIQUE
);

--2 ���������
CREATE TABLE Teachers (
    [Id] INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(MAX) NOT NULL,
    [Surname] NVARCHAR(MAX) NOT NULL
);

--3 �������
CREATE TABLE LectureRooms (
    [Id] INT PRIMARY KEY IDENTITY,
    [Building] INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
    [Name] NVARCHAR(10) NOT NULL UNIQUE
);

--4 ���������
CREATE TABLE Assistants (
    [Id] INT PRIMARY KEY IDENTITY,
    [TeacherId] INT NOT NULL,
    FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
);

--5 ��������
CREATE TABLE Curators (
    [Id] INT PRIMARY KEY IDENTITY,
    [TeacherId] INT NOT NULL,
    FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
);

--6 ������ 
CREATE TABLE Deans (
    Id INT PRIMARY KEY IDENTITY,
    TeacherId INT NOT NULL,
    FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
);

--7 ����������
CREATE TABLE Faculties (
    [Id] INT PRIMARY KEY IDENTITY,
    [Building] INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
    [Name] NVARCHAR(100) NOT NULL UNIQUE,
    [DeanId] INT NOT NULL,
    FOREIGN KEY (DeanId) REFERENCES Teachers(Id)
);

--8 �������
CREATE TABLE Departments (
    [Id] INT PRIMARY KEY IDENTITY,
    [Building] INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
    [Name] NVARCHAR(100) NOT NULL UNIQUE,
    [FacultyId] INT NOT NULL,
    [HeadId] INT NOT NULL,
    FOREIGN KEY (FacultyId) REFERENCES Faculties(Id),
    FOREIGN KEY (HeadId) REFERENCES Teachers(Id)
);



--9 �����
CREATE TABLE Groups (
    [Id] INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(10) NOT NULL,
    [Year] INT NOT NULL CHECK (Year BETWEEN 1 AND 5),
    [DepartmentId] INT NOT NULL,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

--10 ����� �� ��������
CREATE TABLE GroupsCurators (
    [Id] INT PRIMARY KEY IDENTITY,
    [CuratorId] INT NOT NULL,
    [GroupId] INT NOT NULL,
    FOREIGN KEY (CuratorId) REFERENCES Teachers(Id),
    FOREIGN KEY (GroupId) REFERENCES Groups(Id)
);

--11 ���������
CREATE TABLE Heads (
    Id INT PRIMARY KEY IDENTITY,
    TeacherId INT NOT NULL,
    FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
);

--12 ������
CREATE TABLE Lectures (
    [Id] INT PRIMARY KEY IDENTITY,
    [SubjectId] INT NOT NULL,
    [TeacherId] INT NOT NULL,
    FOREIGN KEY (SubjectId) REFERENCES Subjects(Id),
    FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
);

--13 ����� �� ������
CREATE TABLE GroupsLectures (
    [Id] INT PRIMARY KEY IDENTITY,
    [GroupId] INT NOT NULL,
    [LectureId] INT NOT NULL,
    FOREIGN KEY (GroupId) REFERENCES Groups(Id),
    FOREIGN KEY (LectureId) REFERENCES Lectures(Id)
);


--14 �������
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