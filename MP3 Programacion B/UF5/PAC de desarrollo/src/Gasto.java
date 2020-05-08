public class Gasto extends Dinero {
    private double gasto;
    private String description;

    public Gasto(double gasto, String description) {
        this.gasto = gasto;
        this.description = description;
    }

    @Override
    public String toString() {
        return "Gasto{" +
                "gasto=" + gasto +
                ", description='" + description + '\'' +
                '}';
    }
}
