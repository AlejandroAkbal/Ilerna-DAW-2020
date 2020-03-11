package Package1;

import Package2.Door;

import java.io.IOException;

public class Main {

    public static void main(String[] args) {

        Door door1 = new Door();
        Door door2 = new Door(100, 200);
        Door door3 = new Door(100, 200, "red");

        System.out.println(door1.toString());
        System.out.println(door2.toString());
        System.out.println(door3.toString());

        /* ------------- Video Tutoria 3 ------------- */

        // door1.function_privada("Es una funcion privada, no se puede acceder a ella publicamente, solo desde dentro de la clase");
        door1.function_publica("Es una funcion publica");
        door1.function_package("Es una funcion package");

    }
}
