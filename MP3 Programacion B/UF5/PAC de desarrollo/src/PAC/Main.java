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


        Cuenta cuenta = new Cuenta(usuario);
        System.out.println("\nCuenta creada correctamente: " + cuenta.toString());


        /*
         *  Valores del menu
         */
        int accionSeleccionada;

        do {

            System.out.println("\nRealiza una nueva accion:");

            System.out.println("1) Introduce un nuevo gasto");
            System.out.println("2) Introduce un nuevo ingreso");
            System.out.println("3) Mostrar gastos");
            System.out.println("4) Mostrar ingresos");
            System.out.println("5) Mostrar saldo");
            System.out.println("0) Salir");

            accionSeleccionada = scanner.nextInt();

            switch (accionSeleccionada) {
                case 1:

                    break;

                case 0:
                    break;

                default:
                    System.out.println("\nNinguna accion seleccionada!");
                    break;

            }

        } while (accionSeleccionada != 0);

        System.out.println("\nFin del programa.\nGracias por utilizar la aplicación.");

    }
}

