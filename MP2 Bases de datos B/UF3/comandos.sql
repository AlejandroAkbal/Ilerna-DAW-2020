/* Para generar una salida, debe realizar */
SET
	SERVEROUTPUT ON;

/* --- Ejercicio 1 --- */
/* Parte 1 */
CREATE USER Miguel IDENTIFIED BY "1234";

GRANT CREATE SESSION TO Miguel;

/* Parte 2 */
CREATE USER Marta;

GRANT CREATE SESSION TO Marta;

GRANT ALTER ANY TABLE TO Marta;

GRANT DROP ANY TABLE TO Marta;

/* Parte 3 */
GRANT
SELECT
	ON alumnos TO Miguel;

/* Parte 4 */
ALTER TABLE
	SYSTEM.alumnos
ADD
	(direccion VARCHAR(20));

ALTER TABLE
	SYSTEM.alumnos DROP COLUMN password;

TRUNCATE TABLE SYSTEM.alumnos;

/* --- Ejercicio 2 --- */
/* Parte 1 */
CREATE
OR REPLACE PROCEDURE A ño_actual IS variable_año_actual VARCHAR2(10);

BEGIN
	SELECT
		EXTRACT(
			YEAR
			FROM
				SYSDATE
		) INTO variable_año_actual
	FROM
		DUAL;

DBMS_OUTPUT.PUT_LINE(variable_año_actual);

END;

/ EXECUTE A ño_actual;

/* Parte 2 */
CREATE
OR REPLACE PROCEDURE sumar_uno IS v_number NUMBER := 0;

BEGIN
	v_number := v_number + 1;

DBMS_OUTPUT.PUT_LINE('Valor: ' || v_number);

END sumar_uno;

/ EXECUTE sumar_uno;

/* Parte 3 TODO: this */
CREATE
OR REPLACE PROCEDURE concatenar_cadenas_a_mayusculas (cadena1 IN VARCHAR2, cadena2 IN VARCHAR2) IS v_concatenacion VARCHAR2(30);

BEGIN
	v_concatenacion := cadena1 + cadena2;

DBMS_OUTPUT.PUT_LINE(v_concatenacion);

END;

/ EXECUTE concatenar_cadenas_a_mayusculas('hola', 'mundo');

/* Parte 4 */
DECLARE
	v_codigo_empleado NUMBER := 7369;

v_salario_actual NUMBER;

v_tercio_salario_actual NUMBER;

BEGIN
	SELECT
		SALARIO INTO v_salario_actual
	FROM
		EMP
	WHERE
		EMP_NO = v_codigo_empleado;

v_tercio_salario_actual := v_codigo_empleado / 3;

DBMS_OUTPUT.PUT_LINE(
	'Salario actual: ' || v_salario_actual || chr(10) || 'Tercio de salario: ' || v_tercio_salario_actual
);

END;

/* Parte 5 */
CREATE
OR REPLACE FUNCTION dia_de_la_semana (v_dia_number IN NUMBER) RETURN NUMBER IS v_dia_varchar VARCHAR2(10);

BEGINIF (dia = 0) THENEND IF;

RETURN
END;

/ EXECUTE concatenar_cadenas_a_mayusculas('hola', 'mundo');