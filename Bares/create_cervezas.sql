CREATE TABLE cervezas
(
  codc character varying(3) NOT NULL,
  envase character varying(30) NOT NULL,
  capacidad numeric NOT NULL,
  stock integer NOT NULL,
  CONSTRAINT cervezas_pkey PRIMARY KEY (codc)
)