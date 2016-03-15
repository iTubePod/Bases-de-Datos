CREATE TABLE empleados
(
  code character varying(3) NOT NULL,
  nombre character varying(30) NOT NULL,
  sueldo integer NOT NULL,
  CONSTRAINT empleados_pkey PRIMARY KEY (code)
)