USE Northwind;

--Filtern Deutschland/Nicht-DE
SELECT *,
CASE --Weitere Spalte
	WHEN Country = 'Germany' THEN 'Ist DE'
	WHEN Country != 'Germany' THEN 'Nicht DE'
END
FROM Customers;

--Welche Bestellungen sind rechtzeitig angekommen und welche nicht?
SELECT *,
CASE
	WHEN ShippedDate < RequiredDate THEN 'Vorzeitig angekommen'
	WHEN ShippedDate = RequiredDate THEN 'Genau rechtzeitig'
	WHEN ShippedDate > RequiredDate THEN 'Zu spät'
	ELSE 'Nicht angekommen' --ELSE: falls keines der Cases auftritt
END
FROM Orders;

--AS um CASE Name zu geben (nach AS), ORDER BY mit Spaltenalias
SELECT *,
CASE
	WHEN ShippedDate < RequiredDate THEN 'Vorzeitig angekommen'
	WHEN ShippedDate = RequiredDate THEN 'Genau rechtzeitig'
	WHEN ShippedDate > RequiredDate THEN 'Zu spät'
	ELSE 'Nicht angekommen' --ELSE: falls keines der Cases auftritt
END AS IstRechtzeitig
FROM Orders
ORDER BY IstRechtzeitig;

--CASE mit einzelnen Spalten und <, > auf eine Dezimalzahl
SELECT OrderID, CustomerID, Freight, 
CASE
	WHEN Freight < 50 THEN 'Günstig'
	WHEN Freight > 50 AND Freight < 500 THEN 'Mittelmäßig'
	WHEN Freight > 500 THEN 'Teuer' --Alle Zahlen fallen in die 3 Bedingungen außer NULL
	ELSE 'Unbekannt' --Wenn Freight NULL ist
END
FROM Orders;

--CASE mit NULL
SELECT *,
CASE
	WHEN Region IS NULL THEN 'Keine Region'
	WHEN Region IS NOT NULL THEN Region --Spalte hinschreiben
END
FROM Customers;

--Wenn der Gesamtpreis für unsere Bestellung > 500$ ist -> 5% Rabatt, 2000$ -> 10%, 5000$ -> 20%
SELECT * FROM [Order Details]
WHERE Quantity * UnitPrice >=
CASE 
	WHEN Discount > 0.2 THEN 5000 --Hier Reihenfolge beachten
	WHEN Discount > 0.1 THEN 2000 --Wenn ein Discount in beide Bedingungen passt, wird die erste passende akzeptiert und der Rest wird ignoriert
	WHEN Discount > 0.05 THEN 500 
END