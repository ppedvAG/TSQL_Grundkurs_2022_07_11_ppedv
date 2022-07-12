USE Northwind;

SELECT * FROM Orders; --EmployeeID
SELECT * FROM Employees; --Datensätze kombinieren mit JOIN

SELECT * FROM Orders
INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID; --Tabellen kombiniert über EmployeeID

SELECT
Orders.OrderID,
Employees.EmployeeID,
--EmployeeID, Ambiguous column name (gleicher Spaltenname in beiden Tabellen)
Employees.FirstName + ' ' + Employees.LastName AS [Voller Name],
Orders.ShippedDate
FROM Orders
INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID; --Sinnvolle Spalten ausgeben statt *

SELECT
o.OrderID,
c.CustomerID,
c.CompanyName,
o.ShippedDate
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID; --Aliases um Code zu kürzen (o = Orders, c = Customers)

SELECT
o.OrderID,
c.CustomerID,
c.CompanyName,
o.ShippedDate,
o.ShipCountry
FROM Orders o
JOIN Customers c
ON o.CustomerID = c.CustomerID
WHERE o.ShipCountry = 'UK'
ORDER BY c.CustomerID; --WHERE und ORDER BY hier möglich mit Alias

SELECT * --JOIN mit mehreren Tabellen
FROM Orders
INNER JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID

SELECT --Sinnvolle Felder gewählt und Aliases dazu
o.OrderID,
c.CustomerID,
c.CompanyName,
e.FirstName + ' ' + e.LastName AS FullName
FROM Orders o
INNER JOIN Employees e ON e.EmployeeID = o.EmployeeID
INNER JOIN Customers c ON c.CustomerID = o.CustomerID

SELECT * FROM Orders
RIGHT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID; --832 Zeilen statt 830 weil Customer ohne Order auch gelistet werden

SELECT * FROM Orders
RIGHT JOIN Customers
ON ORders.CustomerID = Customers.CustomerID
WHERE OrderID IS NULL; --Alle Customer finden die keine Order getätigt haben

SELECT * FROM Customers
LEFT JOIN Orders
ON Orders.CustomerID = Customers.CustomerID
WHERE OrderID IS NULL; --Alle Customer finden die keine Order getätigt haben mit LEFT JOIN (hier Tabelle vertauschen in FROM und JOIN)
--Tabellen müssen vertauscht werden um von den Customers auszugehen (finde auch alle Customer die bisher keine Order getätigt haben)

SELECT * FROM Orders CROSS JOIN Customers; --Gibt alle Kombinationen zurück (kein ON)

--SELF JOIN: JOIN mit der selben Tabelle (JOIN auf selbst)
SELECT * FROM Employees e
INNER JOIN Employees chef
ON e.ReportsTo = chef.EmployeeID; --Chefs von jedem Mitarbeiter finden

SELECT
e.EmployeeID,
e.FirstName + ' ' + e.LastName AS FullName,
chef.EmployeeID AS ChefID,
chef.FirstName + ' ' + chef.LastName AS ChefName
FROM Employees e
INNER JOIN Employees chef
ON e.ReportsTo = chef.EmployeeID; --Sinnvolle Spalten auswählen

SELECT
e.EmployeeID,
e.FirstName + ' ' + e.LastName AS FullName,
chef.EmployeeID AS ChefID,
chef.FirstName + ' ' + chef.LastName AS ChefName
FROM Employees e
LEFT JOIN Employees chef
ON e.ReportsTo = chef.EmployeeID; --LEFT JOIN statt INNER JOIN um Chef auch zu finden