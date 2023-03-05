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

-- Create the Students table
CREATE TABLE Students (
  StudentID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Address VARCHAR(100),
  ContactInfo VARCHAR(50),
  AdmissionYear INT
);

drop TABLE Permissions;

-- Create the Permissions table
CREATE TABLE Permissions (
  PermissionID INT IDENTITY(1,1) PRIMARY KEY,
  RoleID INT,
  TableName VARCHAR(50),
  CanView BIT,
  CanEdit BIT,
  CanDelete BIT,
  FOREIGN KEY (RoleID) REFERENCES UserRoles(RoleID)
);

-- Create a stored procedure for student registration
CREATE PROCEDURE RegisterStudent (
  @FirstName VARCHAR(50),
  @LastName VARCHAR(50),
  @Address VARCHAR(100),
  @ContactInfo VARCHAR(50),
  @AdmissionYear INT,
  @Username VARCHAR(50),
  @Password VARCHAR(50)
)
AS
BEGIN
  -- Insert the student information into the Students table
  INSERT INTO Students (FirstName, LastName, Address, ContactInfo, AdmissionYear)
  VALUES (@FirstName, @LastName, @Address, @ContactInfo, @AdmissionYear);

  -- Get the student ID of the newly inserted student
  DECLARE @StudentID INT;
  SET @StudentID = SCOPE_IDENTITY();

  -- Insert the user information into the Users table
  INSERT INTO Users (Username, Password, RoleID)
  VALUES (@Username, @Password, 2); -- Assuming student role has RoleID 2

  -- Get the user ID of the newly inserted user
  DECLARE @UserID INT;
  SET @UserID = SCOPE_IDENTITY();

  -- Insert the student permissions into the Permissions table
  INSERT INTO Permissions (RoleID, TableName, CanView, CanEdit, CanDelete)
  VALUES (2, 'Students', 1, 1, 0); -- Assuming student role has RoleID 2

  -- Return the student ID and user ID to the calling application
  SELECT @StudentID AS StudentID, @UserID AS UserID;
END;