USE Northwind;
GO;

DROP PROC p_EmployeesSameYearAs;
GO;

CREATE PROC p_EmployeesSameYearAs(@empID int)
AS
SELECT *
FROM Employees
WHERE YEAR(HireDate) =
(
	SELECT YEAR(HireDate)
	FROM Employees
	WHERE EmployeeID = @empID
)
AND EmployeeID != @empID; --Employee selbst ausschlie�en

EXEC p_EmployeesSameYearAs @empID = 2;