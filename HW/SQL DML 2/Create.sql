CREATE TABLE Provincias (
	CodProv varchar (2) primary key,
	NombreP text not null,
	Comunidad text not null
);
Create TABLE Localidades (
	CodLoc varchar(3) primary key,
	Nombre text not null,
	Censo numeric not null,
	Habitantes numeric not null,
	CodProv varchar (2),
	CONSTRAINT fk_Provincias FOREIGN KEY (CodProv)
		REFERENCES Provincias (CodProv) MATCH SIMPLE
		ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE TABLE Tramos(
	CodLocA varchar(3),
	CodLocB varchar (3),
	Distancia float not null,
	CONSTRAINT fk_LocalidadesA FOREIGN KEY (CodLocA)
		REFERENCES Localidades (CodLoc) MATCH SIMPLE
		ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_LocalidadesB FOREIGN KEY (CodLocB)
		REFERENCES Localidades (CodLoc) MATCH SIMPLE
		ON UPDATE CASCADE ON DELETE RESTRICT		
);