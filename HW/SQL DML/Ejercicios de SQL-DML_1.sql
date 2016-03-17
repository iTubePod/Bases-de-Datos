--Hector Mauricio Gonzalez Coello
--A01328258
--Pregunta 1
SELECT nombre FROM empleados WHERE code In(
	SELECT code FROM reparto WHERE fecha between '10/17/05' AND '10/23/05'
	AND codb IN (
		SELECT codb FROM bares WHERE nombre='Stop' ))
--Pregunta 2
SELECT CIF, nombre
From Bares 
Where CodB in (
	Select CodB 
	From Reparto
	Where CodC in(
		Select CodC 
		from Cervezas 
		Where Envase ='Botella' AND Capacidad < 1
	)
)
Order by Localidad
--Pregunta 3
SELECT b.nombre, c.envase, c.capacidad, r.fecha, r.cantidad
From bares b, cervezas c, reparto r, empleados e
Where 
	e.nombre = 'Prudencio Caminero' AND
	e.code = r.code AND
	c.codc = r.codc AND
	b.codb = r.codb
--Pregunta 4
SELECT *
From Bares
Where CodB in(
	Select CodB
	From Reparto
	Where CodC in(
		Select CodC
		From Cervezas
		Where Envase = 'Botella' AND (Capacidad = 0.2 OR Capacidad = 0.33) 
	)
)
--Pregunta 5
SELECT Nombre
From Empleados
Where Code in (
	Select CodE 
	From Reparto
	Where CodC in (
		Select CodC
		From Cervezas
		Where Envase = 'Botella'
	)
	AND CodB in (

		Select CodB
		From Bares
		Where nombre = 'Stop'
	)
	AND CodB in (

		Select CodB
		From Bares
		Where nombre = 'Las Vegas'
	)
)
--Pregunta 6
SELECT e.nombre, COUNT (r.code)
From reparto r, empleados e, bares b
Where
	e.code=r.code AND
	b.codb=r.codb AND
	b.localidad != 'Villa Botijo'
Group by (e.nombre)
--Pregunta 7
SELECT bares.nombre
FROM bares,reparto,cervezas
WHERE bares.codb = reparto.codb AND cervezas.codc = reparto.codc
ORDER BY reparto.cantidad * cervezas.capacidad
LIMIT 1

--Pregunta 8
SELECT Nombre, Localidad
From Bares
Where CodB in (
	Select CodB 
	From Reparto
	Where CodC in (
		Select CodC
		From Cervezas
		Where Envase = 'Botella'
	)
	AND CodC in (
		SELECT CodC
		From Cervezas
		WHERE Capacidad < 1 
	)
)
--Pregunta 9

--Pregunta 10
INSERT INTO reparto (codc, codb, code, fecha, cantidad)
VALUES (3, 1, 2, '10/26/05', 48);
