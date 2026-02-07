-- =========================================
-- 3 INDEXY – Unikatni a fulltextovy index
-- =========================================

USE videohernipostavy;

-- Unikatni index nad jmenem postavy
CREATE UNIQUE INDEX idx_postavy_jmeno_unique
ON postavy (Jmeno);

-- Fulltextovy index nad popisem dovednosti
CREATE FULLTEXT INDEX IF NOT EXISTS idx_dovednosti_popisek_fulltext
ON dovednosti (Popisek);

-- pouziti

INSERT INTO postavy (Jmeno)
VALUES ('lucio');

SELECT *
FROM dovednosti
WHERE Popisek LIKE '%kouzel%';
