/* Para generar una salida, debe realizar */
SET	SERVEROUTPUT ON;

/* --- Ejercicio 1 --- */
/* 1.1 */
CREATE USER Miguel IDENTIFIED BY "1234";

GRANT CREATE SESSION TO Miguel;

/* 1.2 */
CREATE USER Marta;

GRANT CREATE SESSION TO Marta;

GRANT ALTER ANY TABLE TO Marta;

GRANT DROP ANY TABLE TO Marta;

/* 1.3 */
GRANT SELECT ON alumnos TO Miguel;

/* 1.4 */
ALTER TABLE SYSTEM.alumnos ADD (direccion VARCHAR(20));

ALTER TABLE SYSTEM.alumnos DROP COLUMN password;

TRUNCATE TABLE SYSTEM.alumnos;

/* --- Ejercicio 2 --- */

/* 2.1 */
CREATE OR REPLACE PROCEDURE ano_actual
IS 
	variable_ano_actual VARCHAR2(10);
BEGIN
	SELECT EXTRACT(YEAR FROM SYSDATE) INTO variable_ano_actual FROM DUAL;

	DBMS_OUTPUT.PUT_LINE(variable_ano_actual);
END;
/

EXECUTE ano_actual;

/* 2.2 */
CREATE OR REPLACE PROCEDURE sumar_uno
IS
	v_number NUMBER := 0;
BEGIN
	v_number := v_number + 1;

	DBMS_OUTPUT.PUT_LINE('Valor: ' || v_number);
END;
/ 

EXECUTE sumar_uno;

/* 2.3 */
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

/* 2.4 */
DECLARE
	v_codigo_empleado NUMBER := 7369;
	v_salario_actual NUMBER;
	v_tercio_salario_actual NUMBER;

BEGIN
	SELECT SALARIO INTO v_salario_actual FROM EMP WHERE EMP_NO = v_codigo_empleado;

	v_tercio_salario_actual := v_codigo_empleado / 3;

	DBMS_OUTPUT.PUT_LINE('Salario actual: ' || v_salario_actual || chr(10) || 'Tercio de salario: ' || v_tercio_salario_actual);
END;

/* 2.5 */
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

BEGIN
	DBMS_OUTPUT.PUT_LINE(dia_de_la_semana(0));
END;

/* 2.6 */
CREATE OR REPLACE FUNCTION dia_de_la_semana 
(v_dia_number IN NUMBER) 
RETURN VARCHAR2 
IS 
	v_dia_varchar VARCHAR2(10);
BEGIN
	CASE v_dia_number
		WHEN 0 THEN 
			v_dia_varchar := 'LUNES';
				
		WHEN 1 THEN 
			v_dia_varchar := 'MARTES';
				
		WHEN 2 THEN 
			v_dia_varchar := 'MIERCOLES';
		
		WHEN 3 THEN 
			v_dia_varchar := 'JUEVES';
		
		WHEN 4 THEN 
			v_dia_varchar := 'VIERNES';
		
		WHEN 5 THEN 
			v_dia_varchar := 'SABADO';
		
		WHEN 6 THEN 
			v_dia_varchar := 'DOMINGO';
	END CASE;

RETURN v_dia_varchar;
END;
/

BEGIN
	DBMS_OUTPUT.PUT_LINE(dia_de_la_semana(2));
END;

/* 2.7 */
CREATE OR REPLACE FUNCTION numero_mas_grande 
(v_numero_1 IN NUMBER, v_numero_2 IN NUMBER, v_numero_3 IN NUMBER)
RETURN NUMBER 
IS
	v_numero_mas_grande NUMBER;
BEGIN
	v_numero_mas_grande := GREATEST(v_numero_1, v_numero_2, v_numero_3);

	RETURN v_numero_mas_grande;
END;
/

BEGIN
	DBMS_OUTPUT.PUT_LINE(numero_mas_grande(1,2,3));
END;

/* 2.8 */
CREATE OR REPLACE PROCEDURE suma_numeros_enteros_por_repeticion 
(v_numero_de_repeticiones IN NUMBER)
IS
	v_suma NUMBER := 0;
BEGIN
	FOR l_numero IN 0 .. v_numero_de_repeticiones
	LOOP
		v_suma := v_suma + l_numero;
	END LOOP;

	DBMS_OUTPUT.PUT_LINE(v_suma);
END;
/

EXECUTE suma_numeros_enteros_por_repeticion(5);

/* 2.9 */
CREATE OR REPLACE FUNCTION es_numero_primo 
(v_numero IN NUMBER)
RETURN NUMBER 
IS
	v_numero_es_primo NUMBER;
	v_contador NUMBER := 0;
BEGIN
	FOR l_numero IN 1 .. v_numero
	LOOP
		IF ((MOD(v_numero,l_numero)) = 0) THEN
			v_contador := v_contador + 1;
		END IF;
	END LOOP;

	IF (v_contador > 2) THEN
		v_numero_es_primo := 0;
	ELSE
		v_numero_es_primo := 1;
	END IF;

	RETURN v_numero_es_primo;
END;
/

BEGIN
	DBMS_OUTPUT.PUT_LINE(es_numero_primo(29));
END;

/* 2.10 */
CREATE OR REPLACE FUNCTION primeros_numeros_primos 
(v_numero IN NUMBER)
RETURN NUMBER 
IS
	l_numero NUMBER := 1;
	contador_numeros_primos NUMBER := 0;
	v_suma NUMBER := 0;
BEGIN
	LOOP			
		l_numero := l_numero + 1;	

		IF (es_numero_primo(l_numero) = 1) THEN
			contador_numeros_primos := contador_numeros_primos + 1;
			v_suma := v_suma + l_numero;

			-- DBMS_OUTPUT.PUT_LINE('Numero primo: '||l_numero);
		END IF;		

		IF (v_numero = contador_numeros_primos) THEN
			EXIT;
		END IF;	
	END LOOP;

	-- DBMS_OUTPUT.PUT_LINE(l_numero||' + '||contador_numeros_primos||' + '||v_suma);

	RETURN v_suma;
END;
/

BEGIN
	DBMS_OUTPUT.PUT_LINE(primeros_numeros_primos(4));
END;

/* --- Ejercicio 3 --- */

/* 3.1 */
DECLARE
	v_dept DEPT%ROWTYPE;
	CURSOR c_dept IS SELECT * FROM DEPT;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Nombre | Localidad' || chr(10));

	OPEN c_dept;

	LOOP
		FETCH c_dept INTO v_dept;

		DBMS_OUTPUT.PUT_LINE(v_dept.DNOMBREBRE || ' | ' || v_dept.LUGAR);

		EXIT WHEN c_dept%NOTFOUND;
	END LOOP;

	CLOSE c_dept;
END;

/* 3.2 */
DECLARE
	v_apellido_emp EMP.APELLIDO%TYPE;

	l_contador NUMBER := 0;

	CURSOR c_emp IS SELECT APELLIDO FROM EMP 
		INNER JOIN DEPT ON DEPT.DEPT_NO = EMP.DEPT_NO
		WHERE DEPT.DNOMBREBRE = 'VENTAS';
BEGIN
	DBMS_OUTPUT.PUT_LINE('Linea | Apellido' || chr(10));

	OPEN c_emp;

	LOOP
		FETCH c_emp INTO v_apellido_emp;

		DBMS_OUTPUT.PUT_LINE(l_contador || ' | ' || v_apellido_emp);

		l_contador := l_contador + 1;

		EXIT WHEN c_emp%NOTFOUND;
	END LOOP;

	CLOSE c_emp;
END;

/* 3.3 */

-- Con For
CREATE OR REPLACE PROCEDURE apellidos_de_departamento 
(v_nombre_dept IN DEPT.DNOMBREBRE%TYPE)
IS
	v_departamento_existe BOOLEAN := FALSE;

	CURSOR c_emp IS
		SELECT EMP.APELLIDO FROM EMP
		RIGHT JOIN
			DEPT ON DEPT.DEPT_NO = EMP.DEPT_NO
			WHERE DEPT.DNOMBREBRE = v_nombre_dept;
BEGIN
	FOR v_apellido_emp IN c_emp
	LOOP
		IF (v_apellido_emp.APELLIDO IS NULL) THEN
			v_departamento_existe := FALSE;
		ELSE
			v_departamento_existe := TRUE;

			DBMS_OUTPUT.PUT_LINE(v_apellido_emp.APELLIDO);
		END IF;
	END LOOP;

	IF (v_departamento_existe = FALSE) THEN
		DBMS_OUTPUT.PUT_LINE('El departamento no existe o no tiene empleados.');
	END IF;
END;
/

EXECUTE apellidos_de_departamento('VENTAS');
EXECUTE apellidos_de_departamento('NOEXISTE');

-- Sin FOR
CREATE OR REPLACE PROCEDURE apellidos_de_departamento 
(v_nombre_dept IN DEPT.DNOMBREBRE%TYPE)
IS
	v_departamento_existe BOOLEAN := FALSE;

	v_apellido_emp EMP.APELLIDO%TYPE;

	CURSOR c_emp IS
		SELECT EMP.APELLIDO FROM EMP
		RIGHT JOIN
			DEPT ON DEPT.DEPT_NO = EMP.DEPT_NO
			WHERE DEPT.DNOMBREBRE = v_nombre_dept;
BEGIN
	OPEN c_emp;

	LOOP
		FETCH c_emp INTO v_apellido_emp;

		IF (v_apellido_emp IS NULL) THEN
			v_departamento_existe := FALSE;
		ELSE
			v_departamento_existe := TRUE;

			DBMS_OUTPUT.PUT_LINE(v_apellido_emp);
		END IF;
		
		EXIT WHEN c_emp%NOTFOUND;
	END LOOP;

	IF (v_departamento_existe = FALSE) THEN
		DBMS_OUTPUT.PUT_LINE('El departamento no existe o no tiene empleados.');
	END IF;
	
	CLOSE c_emp;
END;
/

EXECUTE apellidos_de_departamento('VENTAS');
EXECUTE apellidos_de_departamento('NOEXISTE');