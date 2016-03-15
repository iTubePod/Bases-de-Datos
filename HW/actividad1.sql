SELECT 
  * 
FROM 
  public.reparto, 
  public.bares, 
  public.cervezas, 
  public.empleados
WHERE 
  bares.codb = reparto.codb AND
  cervezas.codc = reparto.codc AND
  empleados.code = reparto.code;
