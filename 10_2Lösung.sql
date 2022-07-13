USE Northwind;

--ohne OrderID
SELECT MAX(Freight) AS Wert, 'Höchster Wert' AS Vermerk FROM Orders
UNION
SELECT MIN(Freight), 'Niedrigster Wert' FROM Orders;

--mit OrderID, einmal mit Subselect und einmal mit ORDER BY
SELECT TOP 1 OrderID, (SELECT MAX(Freight) FROM Orders) AS Wert, 'Höchster Wert' AS Vermerk INTO #h FROM Orders;
SELECT TOP 1 OrderID, Freight AS Wert, 'Niedrigster Wert' AS Vermerk INTO #n FROM Orders ORDER BY Freight;

SELECT * FROM #h
UNION
SELECT * FROM #n;