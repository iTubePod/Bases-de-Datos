CREATE TABLE ColorI
(
  color_int varchar(3) PRIMARY KEY,
  price real NULL NULL,
  des text NOT NULL
);
CREATE TABLE ColorE
(
  color_ext varchar(3) PRIMARY KEY,
  price real NULL NULL,
  des text NOT NULL
);
CREATE TABLE Wheels
(
  wheels_n varchar(3) PRIMARY KEY,
  price real NULL NULL,
  des text NOT NULL
);
CREATE TABLE Seats
(
  seats_n varchar(3) PRIMARY KEY,
  price real NULL NULL,
  des text NOT NULL
);
CREATE TABLE Model
(
  m_num varchar(5) PRIMARY KEY,
  year integer NOT NULL
);
CREATE TABLE Options
(
  options_n varchar(7) PRIMARY KEY,
  seats_n varchar (3),
  wheels_n varchar(3),
  color_ext varchar(3),
  color_int varchar(3),
  Auto_pilot bool NOT NULL,
  CONSTRAINT Options_pkey FOREIGN KEY (seats_n, wheels_n, color_ext, color_int),
  CONSTRAINT fk_seats FOREIGN KEY (seats_n)
      REFERENCES Seats (seats_n) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_wheels FOREIGN KEY (wheels_n)
      REFERENCES Wheels (wheels_n) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT
  CONSTRAINT fk_colorE FOREIGN KEY (color_ext)
      REFERENCES ColorE (color_ext) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT
  CONSTRAINT fk_ColorI FOREIGN KEY (color_int)
      REFERENCES ColorI (color_int) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE TABLE Tesla
(
  m_num character varying(5),
  VIN character varying(17) PRIMARY KEY,
  owner text,
  options character varying(7),
  price real NOT NULL,
  CONSTRAINT Tesla_pkey FOREIGN KEY (Model, options),
  CONSTRAINT fk_models FOREIGN KEY (m_num)
      REFERENCES Models (m_num) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_options FOREIGN KEY (options_n)
      REFERENCES Options (options_n) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT
;)
