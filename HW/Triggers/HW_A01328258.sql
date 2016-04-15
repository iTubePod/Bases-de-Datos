--Héctor Mauricio González Coello
--A01328258
--4/14/2016
--ITESM CSF


--1
----a)
CREATE OR REPLACE FUNCTION update() RETURNS TRIGGER AS $update$
DECLARE stockchk integer;
BEGIN
	SELECT stock into stockchk
	FROM cervezas;
	IF (stockchk >= new."cantidad")
	THEN
		UPDATE public."cervezas" 
		SET "stock" = "stock" - new."cantidad"
		WHERE "codc" = new."codc";
		RETURN new;
	ELSE
		RETURN NULL;
		RAISE NOTICE 'Insufficient stock';
	END IF;

END;
$update$ LANGUAGE PLPGSQL;

CREATE TRIGGER new_reparto
	AFTER INSERT ON public.reparto
	FOR EACH ROW
	EXECUTE PROCEDURE update();

----b)
CREATE OR REPLACE FUNCTION update_delete() RETURNS TRIGGER AS $update_delete$
BEGIN
	UPDATE public."cervezas" SET "stock" = "stock" + old."cantidad"
	WHERE "codc" = OLD."codc";
	RETURN NULL;
END;
$update_delete$ LANGUAGE PLPGSQL;

CREATE TRIGGER delete_reparto
	AFTER DELETE ON public.reparto
	FOR EACH ROW
	EXECUTE PROCEDURE update_delete();

----c)
CREATE OR REPLACE FUNCTION update_ureparto() RETURNS TRIGGER AS $update_ureparto$
DECLARE stockchk integer;
BEGIN
	SELECT stock into stockchk
	FROM cervezas;
	UPDATE public."cervezas" 
	SET "stock" = "stock" + old."cantidad"
	WHERE "codc" = old."codc";
	IF (stockchk >= new."cantidad")
	THEN
		UPDATE public."cervezas" 
		SET "stock" = "stock" - new."cantidad"
		WHERE "codc" = new."codc";
		RETURN new;
	ELSE
		RETURN NULL;
		RAISE NOTICE 'Insufficient stock';
	END IF;

END;
$update_ureparto$ LANGUAGE PLPGSQL;

CREATE TRIGGER update_reparto
	AFTER UPDATE ON public.reparto
	FOR EACH ROW
	EXECUTE PROCEDURE update_ureparto();

--2
------------------------------------------
CREATE OR REPLACE FUNCTION update_empleado() RETURNS TRIGGER AS $update_empleado$
BEGIN
	DELETE
	FROM reparto
	WHERE "code" = old."code";
END;
$update_empleado$ LANGUAGE PLPGSQL;

CREATE TRIGGER delete_empleado
	AFTER DELETE ON public.empleados
	FOR EACH ROW
	EXECUTE PROCEDURE update_empleado();

CREATE OR REPLACE FUNCTION update_bares() RETURNS TRIGGER AS $update_bares$
BEGIN
	DELETE
	FROM reparto
	WHERE "codb" = old."codb";
END;
$update_bares$ LANGUAGE PLPGSQL;

CREATE TRIGGER delete_bares
	AFTER DELETE ON public.bares
	FOR EACH ROW
	EXECUTE PROCEDURE update_bares();

CREATE OR REPLACE FUNCTION update_cervezas() RETURNS TRIGGER AS $update_cervezas$
BEGIN
	DELETE
	FROM reparto
	WHERE "codc" = old."codc";
END;
$update_cervezas$ LANGUAGE PLPGSQL;

CREATE TRIGGER delete_cervezas
	AFTER DELETE ON public.cervezas
	FOR EACH ROW
	EXECUTE PROCEDURE update_cervezas();