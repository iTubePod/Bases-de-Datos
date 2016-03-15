CREATE TABLE cervezas(
	codc varchar(3) primary key,
	envase varchar(30) not null,
	capacidad decimal not null,
	stock integer not null
);
CREATE TABLE bares(
	codb varchar(3) primary key,
	nombre varchar(30) not null,
	cif varchar not null,
	localidad text not null
);
CREATE TABLE empleados(
	code varchar(3) primary key,
	nombre varchar(30) not null,
	sueldo integer not null
);
CREATE TABLE Reparto(
	codc varchar(3),
	codb varchar(3),
	code varchar(3),
	CONSTRAINT reparto_pkey PRIMARY KEY(codc,codb,code),
	CONSTRAINT fk_cervezas FOREIGN KEY (codc)
	      REFERENCES cervezas (codc) MATCH SIMPLE
	      ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_bares FOREIGN KEY (codb)
	      REFERENCES bares (codb) MATCH SIMPLE
	      ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_empleados FOREIGN KEY (code)
	      REFERENCES empleados (code) MATCH SIMPLE
	      ON UPDATE CASCADE ON DELETE RESTRICT
);
ALTER TABLE Reparto
	ADD fecha date not null
ALTER TABLE Reparto
	ADD cantidad integer not null 