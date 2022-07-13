USE Northwind;

--Alle Order die teuerer als der Durchschnitt sind
SELECT * FROM Orders
WHERE Freight >= AVG(Freight) --funktioniert nicht, da Aggregatsfunktion ohne GROUP BY

--Abfrage funktioniert mit Subselect
SELECT * FROM Orders
WHERE Freight >= (SELECT AVG(Freight) FROM Orders) --Wichtig: ein Wert als Ergebnis
ORDER BY Freight;

--Subselect mit IN, Resultate von der Unterabfrage werden in das IN gefüllt
--Passt sich automatisch an bei Änderungen der Tabelle anstatt IN('Argentina', 'Austria')
SELECT * FROM Customers
WHERE Country IN(SELECT DISTINCT Country FROM Customers WHERE Country LIKE 'A%');

--Unterabfrage als neue Spalte
SELECT Freight,
(SELECT TOP 1 AVG(Freight) FROM Orders) AS Average
FROM Orders;

--Subselect im FROM mit JOIN
SELECT *
FROM
(
	SELECT
	Orders.EmployeeID,
	Orders.Freight,
	dbo.f_CreateFullName(Employees.FirstName, Employees.LastName) AS FullName --Alle Spalten müssen einen Namen haben
	FROM Orders
	INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
) AS Ergebnis --FROM muss einen Alias haben
WHERE Ergebnis.FullName LIKE 'A%'; --Inneres SELECT filtern

--EXISTS: Überprüfen ob die Unterabfrage ein Ergebnis bringt
SELECT * FROM Customers
WHERE EXISTS (SELECT Country FROM Customers WHERE Country LIKE 'X%'); --Kein Country mit X beginnend

--EXISTS gibt nur true oder false zurück, daher findet diese Abfrage alle Datensätze
SELECT * FROM Customers
WHERE EXISTS (SELECT Country FROM Customers WHERE Country LIKE 'A%');