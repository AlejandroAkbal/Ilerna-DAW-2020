package PAC;

public class Usuario {

    private String nombre;
    private int edad;
    private String DNI;

    public Usuario() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getDNI() {
        return DNI;
    }

    public Boolean setDNI(String DNI) {

        // Comprobar que no sea menor a nueve (DNI sin guion) o mayor a 10 (DNI con guion)
        if (DNI.length() < 9 || DNI.length() > 10) {
            System.out.println("El DNI no tiene la longitud esperada");
            return false;
        }

        // Comprobar que los 8 primeros caracteres son digitos
        for (int i = 0; i < 8; i++) {
            if (!Character.isDigit(DNI.charAt(i))) {
                System.out.println("El caracter '" + DNI.charAt(i) + "' no es un numero");
                return false;
            }
        }

        // Comprobar que el ultimo caracter es una letra
        if (!Character.isLetter(DNI.charAt(DNI.length() - 1))) {
            System.out.println("El ultimo caracter '" + DNI.charAt(DNI.length() - 1) + "' no es una letra");
            return false;
        }

        // Comprobar que hay un guion o no
        // TODO


        this.DNI = DNI;

        return true;
    }

    @Override
    public String toString() {
        return "Usuario{" +
                "nombre='" + nombre + '\'' +
                ", edad=" + edad +
                ", DNI='" + DNI + '\'' +
                '}';
    }
}
