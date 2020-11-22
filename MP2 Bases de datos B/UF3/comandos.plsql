/* Para generar una salida, debe realizar */
SET	SERVEROUTPUT ON;

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
GRANT SELECT ON alumnos TO Miguel;

/* Parte 4 */
ALTER TABLE SYSTEM.alumnos ADD (direccion VARCHAR(20));

ALTER TABLE SYSTEM.alumnos DROP COLUMN password;

TRUNCATE TABLE SYSTEM.alumnos;

/* --- Ejercicio 2 --- */

/* Parte 1 */
CREATE OR REPLACE PROCEDURE ano_actual
IS 
	variable_ano_actual VARCHAR2(10);
BEGIN
	SELECT EXTRACT(YEAR FROM SYSDATE) INTO variable_ano_actual FROM DUAL;

	DBMS_OUTPUT.PUT_LINE(variable_ano_actual);
END;
/

EXECUTE ano_actual;

/* Parte 2 */
CREATE OR REPLACE PROCEDURE sumar_uno
IS
	v_number NUMBER := 0;
BEGIN
	v_number := v_number + 1;

	DBMS_OUTPUT.PUT_LINE('Valor: ' || v_number);
END;
/ 

EXECUTE sumar_uno;

/* Parte 3 */
CREATE OR REPLACE PROCEDURE concatenar_cadenas_a_mayusculas
(cadena1 IN VARCHAR2, cadena2 IN VARCHAR2)
IS
	v_concatenacion VARCHAR2(30);
BEGIN
	v_concatenacion := CONCAT(cadena1, cadena2);

	DBMS_OUTPUT.PUT_LINE(v_concatenacion);
END;
/

EXECUTE concatenar_cadenas_a_mayusculas('hola', 'mundo');

/* Parte 4 */
DECLARE
	v_codigo_empleado NUMBER := 7369;
	v_salario_actual NUMBER;
	v_tercio_salario_actual NUMBER;

BEGIN
	SELECT SALARIO INTO v_salario_actual FROM EMP WHERE EMP_NO = v_codigo_empleado;

	v_tercio_salario_actual := v_codigo_empleado / 3;

	DBMS_OUTPUT.PUT_LINE('Salario actual: ' || v_salario_actual || chr(10) || 'Tercio de salario: ' || v_tercio_salario_actual);
END;

/* Parte 5 */
CREATE OR REPLACE FUNCTION dia_de_la_semana 
(v_dia_number IN NUMBER) 
RETURN VARCHAR2 
IS 
	v_dia_varchar VARCHAR2(10);
BEGIN
	IF (v_dia_number = 0) THEN 
		v_dia_varchar := 'LUNES';
		
	ELSIF (v_dia_number = 1) THEN 
		v_dia_varchar := 'MARTES';
		
	ELSIF (v_dia_number = 2) THEN 
		v_dia_varchar := 'MIERCOLES';
	
	ELSIF (v_dia_number = 3) THEN 
		v_dia_varchar := 'JUEVES';
	
	ELSIF (v_dia_number = 4) THEN 
		v_dia_varchar := 'VIERNES';
	
	ELSIF (v_dia_number = 5) THEN 
		v_dia_varchar := 'SABADO';
	
	ELSIF (v_dia_number = 6) THEN 
		v_dia_varchar := 'DOMINGO';
	END IF;

RETURN v_dia_varchar;
END;
/

EXECUTE dia_de_la_semana(0);