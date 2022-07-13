DECLARE @year int = 1998; --Variable für eventuelle Prozedur

SELECT
c.CustomerID AS Kundennummer,
c.CompanyName AS Firmenname,
YEAR(o.OrderDate) AS Bestelljahr,
CONVERT(decimal(7, 2), SUM(od.Quantity * od.UnitPrice * (1 - Discount))) AS Einkaufssumme, --Zwei Kommastellen mit Convert
CASE
	WHEN SUM(od.Quantity * od.UnitPrice * (1 - Discount)) >= 500 THEN 'Premium'
	WHEN SUM(od.Quantity * od.UnitPrice * (1 - Discount)) < 500 THEN 'Standard'
	ELSE 'Unbekannt' --NULL filtern
END AS Kundenstatus
FROM Orders o
RIGHT JOIN Customers c ON o.CustomerID = c.CustomerID --Orders -> Customers JOIN: Right Join um Kunden zu finden die keine Order getätigt haben
LEFT JOIN [Order Details] od on o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = @year --Zweite Teilaufgabe
GROUP BY c.CustomerID, c.CompanyName, YEAR(o.OrderDate)
ORDER BY Einkaufssumme