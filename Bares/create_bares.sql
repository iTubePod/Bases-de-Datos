CREATE TABLE bares
(
  codb character varying(3) NOT NULL,
  nombre character varying(30) NOT NULL,
  cif character varying NOT NULL,
  localidad text NOT NULL,
  CONSTRAINT bares_pkey PRIMARY KEY (codb)
);