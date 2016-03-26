--SLQ DML 2
--Hector Mauricio Gonzalez Coello
--A01328258
--ITESM CSF


--QUESTION 1
SELECT Nombre 
FROM Localidades
ORDER BY Habitantes ASC
LIMIT 1

--QUESTION 2
SELECT comunidad 
FROM provincias, localidades 
WHERE 
	localidades.codprov = provincias.codprov 
	GROUP BY comunidad 
	HAVING 
		SUM (habitantes) < (
			SELECT AVG (x) 
			FROM (
				SELECT sum (habitantes) AS x 
				FROM provincias,localidades 
				WHERE localidades.codprov = provincias.codprov 
				GROUP BY comunidad) AS y
		) 


--QUESTION 3
SELECT nombre 
FROM localidades 
WHERE 
	habitantes < (
		SELECT AVG (habitantes) 
		FROM localidades
	) 

--QUESTION 4
SELECT nombre 
FROM localidades 
WHERE codloc in (
	SELECT codloca 
	FROM tramos 
	WHERE codlocb in (
		SELECT codloc 
		FROM localidades 
		WHERE nombre = 'Cuenca'
	)
) 
UNION 
	SELECT nombre 
	FROM localidades 
	WHERE codloc in (
		SELECT codlocb 
		FROM tramos 
		WHERE codloca in (
			SELECT codloc 
			FROM localidades 
			WHERE nombre = 'Cuenca'
		)
	) 

--QUESTION 5
SELECT Nombre
FROM Localidades
WHERE CodProv in (
	SELECT CodProv
	From Provincias
	WHERE Comunidad = 'CLM'
)

--QUESTION 6
SELECT Nombre, NombreP, Habitantes
FROM Localidades, Provincias
ORDER BY Nombre, NombreP

--QUESTION  7
SELECT Comunidad
FROM Provincias
WHERE CodProv in (
	SELECT CodProv
	From Localidades
	WHERE CodLoc in (
		SELECT CodLocA
		From Tramos
		WHERE Distancia/2>30
		UNION
			SELECT CodLocB
			From Tramos
			Where Distancia/2>30
	)
)

--QUESTION 8
SELECT NombreP
FROM Provincias
WHERE CodProv in (
	SELECT CodProv
	From Localidades
	WHERE Habitantes<40000
)

--QUESTION 9
SELECT Distinct Nombre
FROM Localidades, Tramos
WHERE CodLoc not in(
	Select CodLocA
	From Tramos
	Union 
		Select CodLocB
		From Tramos
		)
	OR
	CodLoc in (
		SELECT CodLocA
		From Tramos
		Where Distancia = Null
		UNION
		SELECT CodLocB
		From Tramos
		Where Distancia = NULL
	)