CREATE TABLE reparto
(
  codc character varying(3) NOT NULL,
  codb character varying(3) NOT NULL,
  code character varying(3) NOT NULL,
  fecha date NOT NULL,
  cantidad integer NOT NULL,
  CONSTRAINT reparto_pkey PRIMARY KEY (codc, codb, code),
  CONSTRAINT fk_bares FOREIGN KEY (codb)
      REFERENCES bares (codb) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_cervezas FOREIGN KEY (codc)
      REFERENCES cervezas (codc) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_empleados FOREIGN KEY (code)
      REFERENCES empleados (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT
)
