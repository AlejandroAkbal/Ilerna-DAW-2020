public class Gasto extends Dinero {
    private double gasto;

    public Gasto(double gasto) {
        this.gasto = gasto;
    }

    @Override
    public String toString() {
        return "Gasto{" +
                "gasto=" + gasto +
                '}';
    }
}
