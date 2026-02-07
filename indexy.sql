-- =========================================
-- INDEXY – unikatni + fulltextovy index
-- Databaze: videohernipostavy
-- =========================================

USE videohernipostavy;

-- ---------------------------------------------------------
-- 1) Unikatni index nad sloupcem Jmeno v tabulce postavy
--    (zajisti, ze kazda postava ma jedinecne jmeno)
-- Pozn.: v projektu uz muze existovat, proto delame kontrolu.
-- ---------------------------------------------------------
SET @exist_unique :=
(
  SELECT COUNT(*)
  FROM information_schema.STATISTICS
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'postavy'
    AND INDEX_NAME = 'idx_postavy_jmeno_unique'
);

SET @sql_unique :=
IF(@exist_unique = 0,
   'CREATE UNIQUE INDEX idx_postavy_jmeno_unique ON postavy (Jmeno);',
   'SELECT ''Index idx_postavy_jmeno_unique uz existuje.'' AS info;'
);

PREPARE stmt FROM @sql_unique;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ---------------------------------------------------------
-- 2) Fulltextovy index nad sloupcem Popisek v tabulce dovednosti
--    (rychle vyhledavani v textu popisku)
-- Pozn.: taky muze uz existovat -> kontrola.
-- ---------------------------------------------------------
SET @exist_ft :=
(
  SELECT COUNT(*)
  FROM information_schema.STATISTICS
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'dovednosti'
    AND INDEX_NAME = 'idx_dovednosti_popisek_fulltext'
);

SET @sql_ft :=
IF(@exist_ft = 0,
   'ALTER TABLE dovednosti ADD FULLTEXT INDEX idx_dovednosti_popisek_fulltext (Popisek);',
   'SELECT ''Index idx_dovednosti_popisek_fulltext uz existuje.'' AS info;'
);

PREPARE stmt2 FROM @sql_ft;
EXECUTE stmt2;
DEALLOCATE PREPARE stmt2;

-- ---------------------------------------------------------
-- UKAZKA POUZITI
-- ---------------------------------------------------------

-- (A) Unikatni index: tenhle INSERT projde jen kdyz jmeno jeste neexistuje
--     (Lucio uz v DB typicky je, tak davam Lucio_test)
-- INSERT INTO postavy (Jmeno, Trida_ID) VALUES ('Lucio_test', 5);

-- (B) Vyhledavani v popiscich (jednoduche, bez fulltextu)
SELECT *
FROM dovednosti
WHERE Popisek LIKE '%kouzel%';

-- (C) Vyhledavani pres FULLTEXT (rychlejsi pri vetsich datech)
-- Pozn.: fulltext vyhledava slova, ne presne podretezce jako LIKE.
-- SELECT *
-- FROM dovednosti
-- WHERE MATCH(Popisek) AGAINST ('kouzel' IN NATURAL LANGUAGE MODE);
