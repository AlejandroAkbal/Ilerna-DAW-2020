package PAC;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        Usuario usuario = new Usuario();

        System.out.println("Por favor ingrese su nombre:");
        usuario.setNombre(scanner.next());

        System.out.println("Por favor ingrese su edad:");
        usuario.setEdad(scanner.nextInt());

        do {
            System.out.println("Por favor ingrese su DNI:");
        } while (!usuario.setDNI(scanner.next()));

        System.out.println(usuario.toString());

        System.out.println("Fin del programa.\nGracias por utilizar la aplicación.");

    }
}

