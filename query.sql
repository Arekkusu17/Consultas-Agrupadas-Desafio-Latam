-- CREATE DB
CREATE DATABASE desafio_alex_fernandez_179;

-- CONNECT TO DB
\c desafio_alex_fernandez_179

-- DATASET
CREATE TABLE IF NOT EXISTS INSCRITOS(id SERIAL PRIMARY KEY, cantidad INT, fecha DATE, fuente
VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );


-- REQUERIMENTS

-- ¿Cuántos registros hay?

SELECT COUNT(*) AS total_inscritos FROM INSCRITOS;

-- ¿Cuántos inscritos hay en total?

SELECT SUM(cantidad) AS sum_inscritos FROM INSCRITOS;

-- ¿Cuál o cuáles son los registros de mayor antigüedad?

SELECT * FROM INSCRITOS WHERE fecha = (
  SELECT MIN(fecha)
  FROM INSCRITOS
);

-- ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)

  SELECT fecha, SUM(cantidad) FROM INSCRITOS 
  WHERE fecha < CURRENT_DATE
  GROUP BY fecha
  ORDER BY fecha ASC;


-- ¿Cuántos inscritos hay por fuente?

SELECT fuente, SUM(cantidad) AS inscritos_por_fuente FROM INSCRITOS
GROUP BY fuente;

-- ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?

SELECT fecha, cantidad FROM INSCRITOS
WHERE cantidad=(
  SELECT MAX(cantidad) FROM INSCRITOS
);

-- ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron?

SELECT fecha, fuente,cantidad FROM INSCRITOS
WHERE cantidad=(
  SELECT MAX(cantidad) FROM INSCRITOS 
  WHERE fuente='Blog'
);

-- ¿Cuántas personas en promedio se inscriben en un día?

SELECT ROUND(AVG(cantidad),3) AS promedio_diario_inscritos  FROM INSCRITOS;

-- ¿Qué días se inscribieron más de 50 personas?
SELECT fecha, fuente, cantidad FROM INSCRITOS WHERE cantidad>50;

-- ¿Cuántas personas se registraron en promedio cada día a partir del tercer día?

SELECT AVG(cantidad) as promedio
FROM inscritos
WHERE fecha >= '2021-02-01';

