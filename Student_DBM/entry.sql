-- Insert data into tables
INSERT INTO UserRoles (RoleID, RoleName)
VALUES
(1, 'Admin'),
(2, 'Faculty'),
(3, 'Student');
INSERT INTO Users (UserID, Username, Password, RoleID)
VALUES
(1, 'admin', 'admin123', 1),
(2, 'faculty1', 'faculty123', 2),
(3, 'student1', 'student123', 3);

INSERT INTO Students (StudentID, FirstName, LastName, Address, ContactInfo, AdmissionYear)
VALUES
(1, 'John', 'Doe', '123 Main St, Dallas', '123-456-7890', 2022);

-- Insert permissions for stakeholders
-- Admin user with RoleID 1
-- Student user with RoleID 2
-- Faculty member user with RoleID 3

INSERT INTO Permissions (RoleID, CanView, CanEdit, CanDelete)
VALUES (1,1,1,1),
(2,1,0,0),
(3,1,1,0);


