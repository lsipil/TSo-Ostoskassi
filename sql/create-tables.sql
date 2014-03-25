CREATE TABLE Asiakas
(
asiakasID SERIAL PRIMARY KEY,
nimi varchar(60) NOT NULL
);

CREATE TABLE Lasnaolo
(
asiakasID integer REFERENCES Asiakas(asiakasID) on DELETE cascade,
lennonnimi varchar(12) REFERENCES Lento(lennonnimi) on DELETE cascade
);

CREATE TABLE Lento
(
lennonnimi varchar(12) PRIMARY KEY,
lahtokentta char(3) NOT NULL,
maaranpaakentta char(3) NOT NULL,
lahtoaika timestamp
);

CREATE TABLE Ostoskori
(
koriID SERIAL PRIMARY KEY,
asiakasID integer REFERENCES Asiakas(asiakasID) on DELETE cascade,
lukitustila boolean
)
;

CREATE TABLE Ostos
(
koriID integer REFERENCES Ostoskori(koriID) on DELETE cascade,
tuoteID integer REFERENCES Tuote(tuoteID) on DELETE cascade,
maara integer
)