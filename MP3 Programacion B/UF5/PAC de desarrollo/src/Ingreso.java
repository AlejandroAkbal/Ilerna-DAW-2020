public class Ingreso extends Dinero {
    private double ingreso;
    private String description;

    public Ingreso(double ingreso, String description) {
        this.ingreso = ingreso;
        this.description = description;
    }

    @Override
    public String toString() {
        return "Ingreso{" +
                "ingreso=" + ingreso +
                ", description='" + description + '\'' +
                '}';
    }
}
