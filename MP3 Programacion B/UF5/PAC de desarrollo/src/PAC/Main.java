package PAC;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        Usuario usuario = new Usuario();

        System.out.println("\nPor favor ingrese su nombre:");
        usuario.setNombre(scanner.next());

        System.out.println("\nPor favor ingrese su edad:");
        usuario.setEdad(scanner.nextInt());

        do {
            System.out.println("\nPor favor ingrese su DNI:");
        } while (!usuario.setDNI(scanner.next()));

        System.out.println("\nUsuario creado correctamente: " + usuario.toString());

        System.out.println("\nFin del programa.\nGracias por utilizar la aplicación.");

    }
}

