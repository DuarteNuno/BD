
DROP TRIGGER IF EXISTS validateMovieInsertion;

DELIMITER $

CREATE TRIGGER validateMovieInsertion
BEFORE INSERT ON MOVIE FOR EACH ROW
BEGIN
  -- 99999 designa um código de erro da aplicação
  DECLARE error CONDITION FOR SQLSTATE '99999'; 
  -- Valida ano
  IF NEW.Year < 1900 THEN
    SIGNAL error SET MESSAGE_TEXT = 'Invalid year!';
  END IF;
  -- Valida duração
  IF NEW.Duration <= 0 THEN
    SIGNAL error SET MESSAGE_TEXT = 'Invalid duration!';
  END IF;
END $
DELIMITER ; 

DROP TABLE IF EXISTS OPERATION_LOG;
CREATE TABLE OPERATION_LOG
(
  OpLogId INT NOT NULL AUTO_INCREMENT, 
  Time DATETIME NOT NULL,
  Event ENUM ('INSERT', 'UPDATE', 'DELETE') NOT NULL,
  TableName VARCHAR(128) NOT NULL,
  EntryId INT NOT NULL,
  PRIMARY KEY(OpLogId)
);

DROP TRIGGER IF EXISTS logMovieIns;
DELIMITER $

CREATE TRIGGER logMovieIns
AFTER INSERT
ON MOVIE
FOR EACH ROW
BEGIN
   INSERT INTO OPERATION_LOG(Time, Event, TableName, EntryId)
   VALUES(NOW(), 'INSERT', 'MOVIE', NEW.MovieId);
END $

DELIMITER ;


DROP PROCEDURE IF EXISTS ensureNotDepartmentManager;
DELIMITER $

CREATE PROCEDURE
ensureNotDepartmentManager(IN staff_id INT)
BEGIN 
  DECLARE is_manager BOOL;
  DECLARE error CONDITION FOR SQLSTATE '99999'; 
  SET is_manager = FALSE;
  SELECT TRUE INTO is_manager 
  FROM DEPARTMENT WHERE Manager = staff_id;
  IF is_manager THEN
    SIGNAL error 
    SET MESSAGE_TEXT = 'No staff member can supervise more than one department!';
  END IF;
END $

DELIMITER ;  

DROP TRIGGER IF EXISTS beforeDepartmentUpdate;
DROP TRIGGER IF EXISTS beforeDepartmentInsert;
DELIMITER $

CREATE TRIGGER beforeDepartmentUpdate 
BEFORE UPDATE ON DEPARTMENT FOR EACH ROW
BEGIN
  IF NEW.Manager <> OLD.Manager THEN
    CALL ensureNotDepartmentManager(NEW.Manager);
  END IF;
END $

CREATE TRIGGER beforeDepartmentInsert 
BEFORE INSERT ON DEPARTMENT FOR EACH ROW
BEGIN
  CALL ensureNotDepartmentManager(NEW.Manager);
END $

DELIMITER ;
