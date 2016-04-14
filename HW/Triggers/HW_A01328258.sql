CREATE TRIGGER update_stock
ON reparto 
AFTER INSERT 
AS
BEGIN
    UPDATE vehicles v
          SET v.enstock = 'S'
     WHERE v.idvehicles = :new.idvehicle;
END nombre_trigger;