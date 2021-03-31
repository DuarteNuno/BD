
CREATE TRIGGER beforeStreamInsertion
BEFORE INSERT ON STREAM FOR EACH ROW
BEGIN
  -- 99999 designa um código de erro da aplicação
  DECLARE error CONDITION FOR SQLSTATE '99999'; 
  -- Valida ano
  IF Year(NEW.StreamDate) < 2017 THEN
    SIGNAL error SET MESSAGE_TEXT = 'Invalid year!';
  END IF;
  -- Valida preco
  IF NEW.Charge <= 0 THEN
    SIGNAL error SET MESSAGE_TEXT = 'Invalid Charge!';
  END IF;
END $
DELIMITER ; 


DELIMITER $

CREATE TRIGGER beforeStreamUpdate
BEFORE UPDATE ON STREAM FOR EACH ROW
BEGIN
  -- 99999 designa um código de erro da aplicação
  DECLARE error CONDITION FOR SQLSTATE '99999'; 
  -- Valida StreamId
  IF OLD.StreamId <> NEW.StreamId  THEN
    SIGNAL error SET MESSAGE_TEXT = 'Stream Id cannot be changed!';
  END IF;
END $
DELIMITER ; 