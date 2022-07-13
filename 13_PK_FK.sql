CREATE TABLE FKTest
(
	TestID int primary key identity,
	Name varchar(20)
);

CREATE TABLE PKTest
(
	ID int identity,
	Vorname varchar(20),
	Nachname varchar(20),
	FKID int,
	Geburtsdatum date,

	--CONSTRAINT <Name> PRIMARY KEY(<Spaltenname>)
	CONSTRAINT PK_ID PRIMARY KEY(ID),
	--CONSTRAINT <Name> FOREIGN KEY(<Spalte hier>) REFERENCES <Andere Tabelle>(<Andere Spalte>)
	CONSTRAINT FK_FKID FOREIGN KEY(FKID) REFERENCES FKTest(TestID),
	--CONSTRAINT <Name> CHECK <Bedingung>
	CONSTRAINT CHK_GebDatMin CHECK (YEAR(Geburtsdatum) >= 1900)
);

--Funktioniert nicht da kein Datensatz mit ID 1 in FKTest
INSERT INTO PKTest VALUES
('Test', 'Test', 1);

INSERT INTO FKTest VALUES ('Test'); --Datensatz mit ID 1 hinzugefügt
INSERT INTO PKTest VALUES
('Test', 'Test', 1, '18000101'); --Jetzt möglich da Datensatz mit ID 1 in anderer Tabelle