-- vytvoreni uzivatelu
CREATE USER IF NOT EXISTS 'hrac'@'localhost' IDENTIFIED BY 'mojeheslo123'; 

-- smazani uzivatelu
DROP USER 'hrac'@'localhost';

--  prava
GRANT SELECT, INSERT, UPDATE, DELETE ON videohernipostavy.* TO 'hrac'@'localhost';

-- smazat prava
REVOKE SELECT, INSERT, UPDATE, DELETE ON videohernipostavy.* FROM 'hrac'@'localhost';

-- ukazat prava
SHOW GRANTS FOR 'hrac'@'localhost';

-- seznam uživatelu 
SELECT user, host FROM mysql.user;



-- vytvoreni role
CREATE ROLE IF NOT EXISTS 'role_hrac';

-- pridelani prav role
GRANT SELECT, INSERT, UPDATE, DELETE
ON videohernipostavy.*
TO 'role_hrac';

-- prirazeni role uzivateli
GRANT 'role_hrac' TO 'hrac'@'localhost';

-- nastaveni role jako vychozi
SET DEFAULT ROLE 'role_hrac' TO 'hrac'@'localhost';

-- odebrani role uzivateli
REVOKE 'role_hrac' FROM 'hrac'@'localhost';

-- odebrani prav role
REVOKE SELECT, INSERT, UPDATE, DELETE
ON videohernipostavy.*
FROM 'role_hrac';

-- zobrazeni prav role
SHOW GRANTS FOR 'role_hrac';

-- smazani role
DROP ROLE IF EXISTS 'role_hrac';


