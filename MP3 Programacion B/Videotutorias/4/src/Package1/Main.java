package Package1;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner keyboard = new Scanner(System.in);
        int number = 0;

        do {

        System.out.println("Introduce un numero del 1 al 3.");
        System.out.println("Para salir introduce 0.");

        // Asigna el numero a una variable
        number = keyboard.nextInt();

        // Lee la variable
        switch (number) {
            case 0:
                System.out.println("Fin del programa.");
                break;

                case 2:
                System.out.println("Escribe una palabra.");

                // keyboard.next();
                String word = keyboard.nextLine();

                System.out.println("You wrote " + word);
                break;

            default:
                System.err.println("El numero introducido es incorrecto.");
        }

        } while (number != 0);

    }
}
