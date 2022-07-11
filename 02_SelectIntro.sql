--Kommentar, wird nicht ausgef�hrt

/*
Mehrzeiliger
Kommentar
*/

USE Northwind; --Datenbank ausw�hlen

SELECT 100;

SELECT 'Test'; --Strg + E: Markierten Code ausf�hren

SELECT 100*3; --Berechnung

SELECT '100*3'; --Strg + R: Ergebnisansicht schlie�en

SELECT 'Test' AS Name; --AS: Text als Spaltenname verwenden

SELECT 100, 'Test' AS Test, 'weiterer Test'; --Mehrere Werte selektieren

SELECT 10.50; --Kommazahlen mit Punkt statt mit Beistrich

--Strg + K, C: Ausgew�hlte Zeilen auskommentieren
--Strg + K, U: Ausgew�hlte Zeilen einkommentieren

--Alt + Pfeiltaste (Up, Down): Ausgew�hlte Zeilen verschieben

SELECT * FROM Customers; --*: Alles

SELECT CompanyName FROM Customers; --Einzelne Spalten selektieren

SELECT Freight, Freight % 5 AS Mod5 FROM Orders; --Modulo Operator: Rest einer Division

SELECT CompanyName, Address + City + PostalCode + Country AS Addresse FROM Customers; --Strings verbinden (unsch�n)

SELECT CompanyName, Address + ' ' + City + ', ' + PostalCode + ' ' + Country AS Addresse FROM Customers; --Strings verbinden mit extra Abst�nden

SELECT Country FROM Customers; --Alle L�nder finden in denen Customers existieren

SELECT DISTINCT Country FROM Customers; --Alle L�nder einzigartig

SELECT cust.CompanyName FROM Customers cust; --Tabellenalias

SELECT * FROM Customers ORDER BY Country DESC; --ORDER BY: Nach Tabellenspalte sortieren, ASC/DESC um Richtung zu bestimmen