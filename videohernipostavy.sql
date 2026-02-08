-- --------------------------------------------------------
-- Hostitel:                     127.0.0.1
-- Verze serveru:                12.1.2-MariaDB - MariaDB Server
-- OS serveru:                   Win64
-- HeidiSQL Verze:               12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportování struktury databáze pro
CREATE DATABASE IF NOT EXISTS `videohernipostavy` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_czech_ai_ci */;
USE `videohernipostavy`;

-- Exportování struktury pro tabulka videohernipostavy.atributy
CREATE TABLE IF NOT EXISTS `atributy` (
  `Atribut_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nazev` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Atribut_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin2 COLLATE=latin2_czech_cs;

-- Exportování dat pro tabulku videohernipostavy.atributy: ~20 rows (přibližně)
INSERT INTO `atributy` (`Atribut_ID`, `Nazev`) VALUES
	(1, 'Sila'),
	(2, 'Obratnost'),
	(3, 'Odolnost  '),
	(4, 'Inteligence'),
	(5, 'Moudrost  '),
	(6, 'Charisma '),
	(7, 'Rychlost '),
	(8, 'Vytrvalost '),
	(9, 'Obrana '),
	(10, 'Utok '),
	(11, 'Kriticky zasah'),
	(12, 'Regenerace '),
	(13, 'Magicka sila'),
	(14, 'Fyzicka sila '),
	(15, 'Stesti '),
	(16, 'Vydrz'),
	(17, 'Reflexy'),
	(18, 'Sila vule '),
	(19, 'Zrucnost '),
	(20, 'Odvaha');

-- Exportování struktury pro tabulka videohernipostavy.atributypostavy
CREATE TABLE IF NOT EXISTS `atributypostavy` (
  `Postava_ID` int(11) NOT NULL,
  `Atribut_ID` int(11) NOT NULL,
  PRIMARY KEY (`Postava_ID`,`Atribut_ID`),
  KEY `Atribut_ID` (`Atribut_ID`),
  CONSTRAINT `atributypostavy_ibfk_1` FOREIGN KEY (`Postava_ID`) REFERENCES `postavy` (`Postava_ID`),
  CONSTRAINT `atributypostavy_ibfk_2` FOREIGN KEY (`Atribut_ID`) REFERENCES `atributy` (`Atribut_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_czech_cs;

-- Exportování dat pro tabulku videohernipostavy.atributypostavy: ~22 rows (přibližně)
INSERT INTO `atributypostavy` (`Postava_ID`, `Atribut_ID`) VALUES
	(1, 1),
	(2, 4),
	(2, 13),
	(3, 2),
	(4, 11),
	(5, 14),
	(6, 13),
	(7, 10),
	(8, 2),
	(9, 5),
	(10, 7),
	(10, 12),
	(11, 6),
	(12, 20),
	(13, 3),
	(14, 17),
	(15, 18),
	(16, 18),
	(17, 8),
	(18, 7),
	(19, 19),
	(20, 15);

-- Exportování struktury pro tabulka videohernipostavy.bonusy_postav
CREATE TABLE IF NOT EXISTS `bonusy_postav` (
  `Postava_ID` int(11) NOT NULL,
  `Pocet_vybaveni` int(11) NOT NULL,
  `Bonus` int(11) NOT NULL,
  PRIMARY KEY (`Postava_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_czech_ai_ci;

-- Exportování dat pro tabulku videohernipostavy.bonusy_postav: ~20 rows (přibližně)
INSERT INTO `bonusy_postav` (`Postava_ID`, `Pocet_vybaveni`, `Bonus`) VALUES
	(1, 1, 10),
	(2, 1, 10),
	(3, 1, 10),
	(4, 1, 10),
	(5, 1, 10),
	(6, 1, 10),
	(7, 1, 10),
	(8, 1, 10),
	(9, 1, 10),
	(10, 1, 10),
	(11, 1, 10),
	(12, 1, 10),
	(13, 1, 10),
	(14, 1, 10),
	(15, 1, 10),
	(16, 1, 10),
	(17, 1, 10),
	(18, 1, 10),
	(19, 1, 10),
	(20, 1, 10);

-- Exportování struktury pro tabulka videohernipostavy.dovednosti
CREATE TABLE IF NOT EXISTS `dovednosti` (
  `Dovednost_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nazev` varchar(255) DEFAULT NULL,
  `Popisek` text DEFAULT NULL,
  PRIMARY KEY (`Dovednost_ID`),
  FULLTEXT KEY `idx_dovednosti_popisek_fulltext` (`Popisek`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin2 COLLATE=latin2_czech_cs;

-- Exportování dat pro tabulku videohernipostavy.dovednosti: ~20 rows (přibližně)
INSERT INTO `dovednosti` (`Dovednost_ID`, `Nazev`, `Popisek`) VALUES
	(1, 'Mecove umeni', 'Mistr v pouzivani mece'),
	(2, 'Lukostrelba', 'Schopnost presneho strileni z luku'),
	(3, 'Alchymie', 'Priprava lektvaru a elixiru'),
	(4, 'Leceni', 'Schopnost leceni zraneni a nemoci'),
	(5, 'Schovavani se', 'Schopnost skryt se a zustat neodhalen'),
	(6, 'Ohniva magie', 'Pouzivani kouzel spojench s ohnem'),
	(7, 'Ledova magie', 'Pouzivani kouzel spojench s ledem'),
	(8, 'Telekineze', 'Pohyb predmetu pomoci mysli'),
	(9, 'Sermirstvi', 'Umeni boje s mecem a stitem'),
	(10, 'Dvojite zbrane', 'Boj s dvema zbranemi soucasne'),
	(11, 'Pastickarstvi', 'Staveni a deaktivace pasti'),
	(12, 'Plizeni', 'Tise se pohybovat a vyhybat se odhaleni'),
	(13, 'Diplomacie', 'Umeni vyjednavat a presvedcovat'),
	(14, 'Kovarstvi ', 'Vytvareni a oprava zbrani a zbroje'),
	(15, 'Zlodejina', 'Schopnost krast a vykradat'),
	(16, 'Lov', 'Schopnost stopovat a lovit zver'),
	(17, 'Kouzleni', 'Znalost a pouzivani ruznych kouzel'),
	(18, 'Runova magie', 'Pouzivani run pro magicke ucely'),
	(19, 'Taktika', 'Schopnost planovat a realizovat bojove strategie'),
	(20, 'Jezdectvi', 'Umeni jezdit na koni a dalsich zviratech');

-- Exportování struktury pro tabulka videohernipostavy.dovednostipostavy
CREATE TABLE IF NOT EXISTS `dovednostipostavy` (
  `Postava_ID` int(11) NOT NULL,
  `Dovednost_ID` int(11) NOT NULL,
  PRIMARY KEY (`Postava_ID`,`Dovednost_ID`),
  KEY `Dovednost_ID` (`Dovednost_ID`),
  CONSTRAINT `dovednostipostavy_ibfk_1` FOREIGN KEY (`Postava_ID`) REFERENCES `postavy` (`Postava_ID`),
  CONSTRAINT `dovednostipostavy_ibfk_2` FOREIGN KEY (`Dovednost_ID`) REFERENCES `dovednosti` (`Dovednost_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_czech_cs;

-- Exportování dat pro tabulku videohernipostavy.dovednostipostavy: ~20 rows (přibližně)
INSERT INTO `dovednostipostavy` (`Postava_ID`, `Dovednost_ID`) VALUES
	(1, 19),
	(2, 17),
	(3, 11),
	(4, 2),
	(5, 1),
	(6, 18),
	(7, 1),
	(8, 4),
	(9, 8),
	(10, 12),
	(11, 13),
	(12, 13),
	(13, 9),
	(14, 20),
	(15, 7),
	(16, 5),
	(17, 19),
	(18, 14),
	(19, 6),
	(20, 16);

-- Exportování struktury pro procedura videohernipostavy.generuj_bonusy_postav
DELIMITER //

CREATE PROCEDURE generuj_bonusy_postav_transakce()
BEGIN
    DECLARE v_postava_id INT;
    DECLARE hotovo INT DEFAULT 0;

    -- kurzor pro všechny postavy
    DECLARE cur_postavy CURSOR FOR
        SELECT Postava_ID FROM postavy;

    -- handler pro konec kurzoru
    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET hotovo = 1;

    -- handler pro SQL chybu
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Došlo k chybě – transakce byla vrácena zpět.' AS stav;
    END;

    START TRANSACTION;

    OPEN cur_postavy;

    cteni: LOOP
        FETCH cur_postavy INTO v_postava_id;

        IF hotovo = 1 THEN
            LEAVE cteni;
        END IF;

        -- vložení / aktualizace bonusu pro jednu postavu
        INSERT INTO bonusy_postav (Postava_ID, Pocet_vybaveni, Bonus)
        SELECT
            p.Postava_ID,
            COUNT(vp.Vybaveni_ID),
            COUNT(vp.Vybaveni_ID) * 10
        FROM postavy p
        LEFT JOIN vybavenipostavy vp
            ON vp.Postava_ID = p.Postava_ID
        WHERE p.Postava_ID = v_postava_id
        GROUP BY p.Postava_ID
        ON DUPLICATE KEY UPDATE
            Pocet_vybaveni = VALUES(Pocet_vybaveni),
            Bonus = VALUES(Bonus);
    END LOOP;

    CLOSE cur_postavy;

    COMMIT;
    SELECT 'Transakce byla úspěšně dokončena.' AS stav;
END//

DELIMITER ;

-- Exportování struktury pro tabulka videohernipostavy.log_upravy_postav
CREATE TABLE IF NOT EXISTS `log_upravy_postav` (
  `Log_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Postava_ID` int(11) NOT NULL,
  `Stare_jmeno` varchar(255) DEFAULT NULL,
  `Nove_jmeno` varchar(255) DEFAULT NULL,
  `Stara_trida_ID` int(11) DEFAULT NULL,
  `Nova_trida_ID` int(11) DEFAULT NULL,
  `Datum_cas` datetime NOT NULL,
  `Uzivatel` varchar(255) NOT NULL,
  PRIMARY KEY (`Log_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_czech_ai_ci;

-- Exportování dat pro tabulku videohernipostavy.log_upravy_postav: ~0 rows (přibližně)

-- Exportování struktury pro funkce videohernipostavy.pocet_dovednosti
DELIMITER //
CREATE FUNCTION `pocet_dovednosti`(postavaID INT) RETURNS int(11)
    DETERMINISTIC
BEGIN
    DECLARE pocet INT;

    SELECT COUNT(*)
    INTO pocet
    FROM dovednostipostavy
    WHERE Postava_ID = postavaID;

    RETURN pocet;
END//
DELIMITER ;

-- Exportování struktury pro funkce videohernipostavy.pocet_vybaveni
DELIMITER //
CREATE FUNCTION `pocet_vybaveni`(postavaID INT) RETURNS int(11)
    DETERMINISTIC
BEGIN
    DECLARE pocet INT;

    SELECT COUNT(*)
    INTO pocet
    FROM vybavenipostavy
    WHERE Postava_ID = postavaID;

    RETURN pocet;
END//
DELIMITER ;

-- Exportování struktury pro tabulka videohernipostavy.postavy
CREATE TABLE IF NOT EXISTS `postavy` (
  `Postava_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Jmeno` varchar(255) DEFAULT NULL,
  `Trida_ID` int(11) DEFAULT NULL,
  `Nadrizena_postava_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Postava_ID`),
  UNIQUE KEY `idx_postavy_jmeno_unique` (`Jmeno`),
  KEY `Trida_ID` (`Trida_ID`),
  KEY `fk_postava_nadrizena` (`Nadrizena_postava_ID`),
  CONSTRAINT `fk_postava_nadrizena` FOREIGN KEY (`Nadrizena_postava_ID`) REFERENCES `postavy` (`Postava_ID`),
  CONSTRAINT `postavy_ibfk_1` FOREIGN KEY (`Trida_ID`) REFERENCES `tridy` (`Trida_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin2 COLLATE=latin2_czech_cs;

-- Exportování dat pro tabulku videohernipostavy.postavy: ~20 rows (přibližně)
INSERT INTO `postavy` (`Postava_ID`, `Jmeno`, `Trida_ID`, `Nadrizena_postava_ID`) VALUES
	(1, 'Reinhardt\'s Wrath', 1, NULL),
	(2, 'Mog Master', 2, NULL),
	(3, 'The Fox', 3, NULL),
	(4, 'Hanzo Shimada', 4, NULL),
	(5, 'Gimli', 1, NULL),
	(6, 'Doctor Strange ', 2, NULL),
	(7, 'Dancing Death ', 1, 3),
	(8, 'Lucio', 5, NULL),
	(9, 'Light God', 17, NULL),
	(10, 'Sombra', 3, NULL),
	(11, 'Pippin', 18, NULL),
	(12, 'Merry', 18, NULL),
	(13, 'Théoden', 19, NULL),
	(14, 'Arthas the Lich King', 1, NULL),
	(15, 'Anduin Wrynn', 17, NULL),
	(16, 'Mother Teresa', 17, NULL),
	(17, 'Haldir', 16, NULL),
	(18, 'Genji Swiftblade', 19, 4),
	(19, 'Ashe', 4, 4),
	(20, 'Thranduil', 14, NULL);

-- Exportování struktury pro tabulka videohernipostavy.tridy
CREATE TABLE IF NOT EXISTS `tridy` (
  `Trida_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nazev` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Trida_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin2 COLLATE=latin2_czech_cs;

-- Exportování dat pro tabulku videohernipostavy.tridy: ~20 rows (přibližně)
INSERT INTO `tridy` (`Trida_ID`, `Nazev`) VALUES
	(1, 'Valecnik'),
	(2, 'Mag'),
	(3, 'Zlodej'),
	(4, 'Lukostrelec'),
	(5, 'Klerik'),
	(6, 'Necromancer'),
	(7, 'Paladin'),
	(8, 'Berserk'),
	(9, 'Saman'),
	(10, 'Druid'),
	(11, 'Monk'),
	(12, 'Assassin'),
	(13, 'Warlock'),
	(14, 'Hunter'),
	(15, 'Sorcerer'),
	(16, 'Ranger'),
	(17, 'Priest'),
	(18, 'Bard'),
	(19, 'Knight'),
	(20, 'Rogue');

-- Exportování struktury pro tabulka videohernipostavy.vybaveni
CREATE TABLE IF NOT EXISTS `vybaveni` (
  `Vybaveni_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nazev` varchar(255) DEFAULT NULL,
  `Tridy_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Vybaveni_ID`),
  KEY `Tridy_ID` (`Tridy_ID`),
  CONSTRAINT `vybaveni_ibfk_1` FOREIGN KEY (`Tridy_ID`) REFERENCES `tridy` (`Trida_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin2 COLLATE=latin2_czech_cs;

-- Exportování dat pro tabulku videohernipostavy.vybaveni: ~20 rows (přibližně)
INSERT INTO `vybaveni` (`Vybaveni_ID`, `Nazev`, `Tridy_ID`) VALUES
	(1, 'Mec', 1),
	(2, 'Hul', 2),
	(3, 'Dyka', 3),
	(4, 'Luk', 4),
	(5, 'Roucho', 5),
	(6, 'Sekera', 8),
	(7, 'Kopi', 9),
	(8, 'Stit', 7),
	(9, 'Prsten', 2),
	(10, 'Helma', 1),
	(11, 'Dynamit', 16),
	(12, 'Plast', 2),
	(13, 'Boty', 3),
	(14, 'Naramek', 6),
	(15, 'Amulety', 17),
	(16, 'Kniha kouzel', 2),
	(17, 'Kotlik', 10),
	(18, 'Trubka', 18),
	(19, 'Sipy', 4),
	(20, 'Palcat', 19);

-- Exportování struktury pro tabulka videohernipostavy.vybavenipostavy
CREATE TABLE IF NOT EXISTS `vybavenipostavy` (
  `Postava_ID` int(11) NOT NULL,
  `Vybaveni_ID` int(11) NOT NULL,
  PRIMARY KEY (`Postava_ID`,`Vybaveni_ID`),
  KEY `Vybaveni_ID` (`Vybaveni_ID`),
  CONSTRAINT `vybavenipostavy_ibfk_1` FOREIGN KEY (`Postava_ID`) REFERENCES `postavy` (`Postava_ID`),
  CONSTRAINT `vybavenipostavy_ibfk_2` FOREIGN KEY (`Vybaveni_ID`) REFERENCES `vybaveni` (`Vybaveni_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_czech_cs;

-- Exportování dat pro tabulku videohernipostavy.vybavenipostavy: ~20 rows (přibližně)
INSERT INTO `vybavenipostavy` (`Postava_ID`, `Vybaveni_ID`) VALUES
	(1, 1),
	(2, 2),
	(3, 13),
	(4, 4),
	(5, 10),
	(6, 12),
	(7, 1),
	(8, 5),
	(9, 15),
	(10, 3),
	(11, 18),
	(12, 18),
	(13, 20),
	(14, 1),
	(15, 15),
	(16, 15),
	(17, 11),
	(18, 20),
	(19, 19),
	(20, 19);

-- Exportování struktury pro pohled videohernipostavy.v_postavy_prehled
-- Vytváření dočasné tabulky Pohledu pro omezení dopadu chyb
CREATE TABLE `v_postavy_prehled` (
	`Postava` VARCHAR(1) NULL COLLATE 'latin2_czech_cs',
	`Trida` VARCHAR(1) NULL COLLATE 'latin2_czech_cs',
	`Dovednosti` MEDIUMTEXT NULL COLLATE 'latin2_czech_cs',
	`Vybaveni` MEDIUMTEXT NULL COLLATE 'latin2_czech_cs'
);

-- Exportování struktury pro trigger videohernipostavy.trg_log_update_postavy
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER trg_log_update_postavy
AFTER UPDATE ON postavy
FOR EACH ROW
BEGIN
    INSERT INTO log_upravy_postav (
        Postava_ID,
        Stare_jmeno,
        Nove_jmeno,
        Stara_trida_ID,
        Nova_trida_ID,
        Datum_cas,
        Uzivatel
    ) VALUES (
        OLD.Postava_ID,
        OLD.Jmeno,
        NEW.Jmeno,
        OLD.Trida_ID,
        NEW.Trida_ID,
        NOW(),
        CURRENT_USER()
    );
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Odebírání dočasné tabulky a vytváření struktury Pohledu
DROP TABLE IF EXISTS `v_postavy_prehled`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_postavy_prehled` AS SELECT
    p.Jmeno                         AS Postava,
    t.Nazev                         AS Trida,
    GROUP_CONCAT(DISTINCT d.Nazev ORDER BY d.Nazev SEPARATOR ', ') AS Dovednosti,
    GROUP_CONCAT(DISTINCT v.Nazev ORDER BY v.Nazev SEPARATOR ', ') AS Vybaveni
FROM postavy p
    
    INNER JOIN tridy t 
        ON p.Trida_ID = t.Trida_ID

    
    LEFT JOIN dovednostipostavy dp
        ON dp.Postava_ID = p.Postava_ID
    LEFT JOIN dovednosti d
        ON d.Dovednost_ID = dp.Dovednost_ID

    
    LEFT JOIN vybavenipostavy vp
        ON vp.Postava_ID = p.Postava_ID
    LEFT JOIN vybaveni v
        ON v.Vybaveni_ID = vp.Vybaveni_ID

GROUP BY
    p.Jmeno,
    t.Nazev 
;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
