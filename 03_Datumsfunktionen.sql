USE Northwind;

SELECT GETDATE(); --Jetztiges Datum, Millisekundengenau

SELECT SYSDATETIME(); --Jetztiges Datum, Nanosekundengenau

/*
Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, n = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

SELECT DATEADD(YEAR, 2, GETDATE()); --DATEADD: Intervall zu einem Datum hinzufügen

SELECT DATEADD(DAY, 25, GETDATE()); --Überschlag möglich

SELECT DATEADD(HOUR, 30, GETDATE()); --Auch bei Stunden Überschlag

SELECT DATEADD(HOUR, -15, GETDATE()); --Zurückspringen mit negativer Zahl

SELECT DATEADD(QUARTER, 1, GETDATE()); --Ein Quartal hinzufügen

SELECT YEAR(GETDATE()); --Nur das Jahr vom Datum holen
SELECT MONTH(GETDATE()); --Das gleiche nur mit Monat
SELECT DAY(GETDATE());

SELECT DATEPART(YEAR, GETDATE()); --Teil eines Datums ausgeben, kann verwendet werden statt YEAR, MONTH, ...

SELECT DATEPART(QQ, GETDATE()); --Quartal vom heutigen Datum ausgeben (3)

SELECT DATEPART(DAYOFYEAR, GETDATE()); --Tag dieses Jahres zurückgeben (192)

SELECT DATEPART(WEEKDAY, GETDATE()); --Derzeitigen Wochentag als Nummer ausgeben (1-7)

SELECT DATEDIFF(YEAR, '2000', GETDATE()); --Differenz zwischen zwei Datumswerten, auf jeden Fall String benutzen
SELECT DATEADD(DAY, 2000, '1900-01-01'); --DATEDIFF(YEAR, 2000, GETDATE()) -> Konvertierungsfehler

SELECT DATEDIFF(DAY, '2000-01-01', GETDATE()); --Tage seit 01.01.2000

--yyyy-mm-dd: Standardisiertes ISO-Datum
--dd.mm.yyyy: Standard Deutsches Datum
--Aufpassen wegen Sprache des Computers/Servers, Datum könnte nicht funktionieren

SELECT DATENAME(WEEKDAY, GETDATE()); --Heutiger Tag schön ausgegeben

SELECT DATENAME(DW, GETDATE()); --DW statt WEEKDAY

SELECT DATEFROMPARTS('2022', '07', '11'); --Datum aus einzelnen string bauen

SELECT HireDate, DATENAME(WEEKDAY, HireDate) FROM Employees; --DATENAME benutzen mit Spalte

SELECT HireDate, DATEDIFF(MONTH, HireDate, GETDATE()) FROM Employees; --Wie lange sind unsere Mitarbeiter bereits in dem Unternehmen?

SELECT YEAR(HireDate) FROM Employees; --Welches Jahr jeweils

SELECT DATEPART(YEAR, HireDate) FROM Employees; --Selbiges wie oben nur mit DATEPART