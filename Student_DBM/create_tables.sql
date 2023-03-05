-- Create the Students table
CREATE TABLE Students (
  StudentID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Address VARCHAR(100),
  ContactInfo VARCHAR(50),
  AdmissionYear INT
);

-- Create the Courses table
CREATE TABLE Courses (
  CourseCode VARCHAR(10) PRIMARY KEY,
  CourseName VARCHAR(50),
  Instructor VARCHAR(50),
  CreditHours INT
);

-- Create the Enrollments table
CREATE TABLE Enrollments (
  EnrollmentID INT PRIMARY KEY,
  StudentID INT,
  CourseCode VARCHAR(10),
  EnrollmentDate DATE,
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
  FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode)
);

-- Create the Attendance table
CREATE TABLE Attendance (
  AttendanceID INT PRIMARY KEY,
  StudentID INT,
  CourseCode VARCHAR(10),
  AttendanceDate DATE,
  AttendanceStatus VARCHAR(10),
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
  FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode)
);

-- Create the Fees table
CREATE TABLE Fees (
  FeeID INT PRIMARY KEY,
  StudentID INT,
  FeeType VARCHAR(50),
  Amount FLOAT,
  PaymentDate DATE,
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Create the Scholarships table
CREATE TABLE Scholarships (
  ScholarshipID INT PRIMARY KEY,
  StudentID INT,
  ScholarshipType VARCHAR(50),
  Amount FLOAT,
  AwardDate DATE,
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Create the Users table
CREATE TABLE Users (
  UserID INT PRIMARY KEY,
  Username VARCHAR(50),
  Password VARCHAR(50),
  RoleID INT,
  FOREIGN KEY (RoleID) REFERENCES UserRoles(RoleID)
);

-- Create the UserRoles table
CREATE TABLE UserRoles (
  RoleID INT PRIMARY KEY,
  RoleName VARCHAR(50)
);

-- Create the Permissions table
CREATE TABLE Permissions (
  PermissionID INT PRIMARY KEY,
  RoleID INT,
  TableName VARCHAR(50),
  CanView BIT,
  CanEdit BIT,
  CanDelete BIT,
  FOREIGN KEY (RoleID) REFERENCES UserRoles(RoleID)
);

SELECT*from Permissions;