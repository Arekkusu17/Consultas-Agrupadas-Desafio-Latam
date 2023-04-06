-- CREATE DB
CREATE DATABASE desafio_alex_fernandez_179;

-- CONNECT TO DB
\c desafio_alex_fernandez_179

-- CREATE TABLE

CREATE TABLE IF NOT EXISTS inscribed(
  id SERIAL PRIMARY KEY, 
  quantity INT, date DATE, 
  source VARCHAR);

-- INSERT DAYA
INSERT INTO inscribed(quantity, date, source)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO inscribed(quantity, date, source)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO inscribed(quantity, date, source)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO inscribed(quantity, date, source)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO inscribed(quantity, date, source)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO inscribed(quantity, date, source)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO inscribed(quantity, date, source)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO inscribed(quantity, date, source)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO inscribed(quantity, date, source)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO inscribed(quantity, date, source)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO inscribed(quantity, date, source)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO inscribed(quantity, date, source)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO inscribed(quantity, date, source)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO inscribed(quantity, date, source)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO inscribed(quantity, date, source)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO inscribed(quantity, date, source)
VALUES ( 99, '01/08/2021', 'Página' );


-- REQUERIMENTS

-- 1 ¿Cuántos registros hay?

SELECT COUNT(*) AS total_registros FROM inscribed;

-- 2 ¿Cuántos inscritos hay en total?

SELECT SUM(quantity) AS total_enrolled FROM inscribed;

-- 3 ¿Cuál o cuáles son los registros de mayor antigüedad?

SELECT * FROM inscribed WHERE date = (
  SELECT MIN(date)
  FROM inscribed
);

-- 4 ¿Cuántos inscritos hay por día? (entendiendo un día como una date distinta de ahora en adelante)

SELECT date, SUM(quantity) AS registered_per_day FROM inscribed 
GROUP BY date
ORDER BY date ASC;


-- 5 ¿Cuántos inscritos hay por source?

SELECT source, SUM(quantity) AS registered_per_source FROM inscribed
GROUP BY source
ORDER BY registered_per_source DESC;

-- 6 ¿Qué día se inscribieron la mayor quantity de personas y cuántas personas se inscribieron en ese día?

SELECT date, SUM(quantity) AS registered_per_day FROM inscribed
GROUP BY date
ORDER BY registered_per_day DESC
LIMIT 1;

-- ¿Qué días se inscribieron la mayor quantity de personas utilizando el blog y cuántas personas fueron?

SELECT date, source,quantity FROM inscribed
WHERE quantity=(
  SELECT MAX(quantity) FROM inscribed 
  WHERE source='Blog'
)
LIMIT 1;

-- ¿Cuántas personas en promedio se inscriben en un día?

SELECT AVG(result.registered_per_day) FROM (
  SELECT date, SUM(quantity) AS registered_per_day FROM inscribed GROUP BY date ORDER BY date
  ) AS result;

-- ¿Qué días se inscribieron más de 50 personas?
SELECT date, SUM(quantity) AS inscritos_diarios FROM inscribed GROUP BY date HAVING (SUM(quantity)>50) ;

-- ¿Cuántas personas se registraron en promedio cada día a partir del tercer día?

SELECT AVG(result.registered_per_day) FROM (
  SELECT date, SUM(quantity) AS registered_per_day FROM inscribed
  WHERE date>='2021-03-01' GROUP BY date
  ) AS result;

