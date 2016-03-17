--Hector Mauricio Gonzalez Coello
--A01328258
--
--Question 1
SELECT nombre FROM empleados WHERE code In(
	SELECT code FROM reparto WHERE fecha between '10/17/05' AND '10/23/05'
	AND codb IN (
		SELECT codb FROM bares WHERE nombre='Stop' ))

--Question 2
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

--Question 3
SELECT b.nombre, c.envase, c.capacidad, r.fecha, r.cantidad
From bares b, cervezas c, reparto r, empleados e
Where 
	e.nombre = 'Prudencio Caminero' AND
	e.code = r.code AND
	c.codc = r.codc AND
	b.codb = r.codb

--Question 4
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

--Question 5
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

--Question 6
SELECT e.nombre, COUNT (r.code)
From reparto r, empleados e, bares b
Where
	e.code=r.code AND
	b.codb=r.codb AND
	b.localidad != 'Villa Botijo'
Group by (e.nombre)

--Question 7
SELECT Nombre, Localidad
From Bares, reparto, cervezas
Where 
	Bares.CodB = reparto.CodB AND
	cervezas.CodC = reparto.CodC
Group By Nombre, Localidad, cervezas.capacidad*reparto.cantidad
Order By cervezas.capacidad * reparto.cantidad DESC
LIMIT 1

--Question 8
SELECT Nombre
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
--Question 9
UPDATE EMPLEADOS SET sueldo=sueldo*1.05
WHERE CodE in (
SELECT CodE
FROM (SELECT COUNT(DISTINCT fecha) AS x, CodE 
FROM reparto 
GROUP BY CodE) as y
Group by CodE
Order by Max(x) DESC
LIMIT 1
)

--Question 10
INSERT INTO reparto (codc, codb, code, fecha, cantidad)
VALUES (3, 1, 2, '10/26/05', 48);
