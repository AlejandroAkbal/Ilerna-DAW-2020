package PAC;

import java.util.ArrayList;
import java.util.List;

public class Cuenta {

    private Usuario usuario;
    private double saldo;

    private List<Gasto> gastos = new ArrayList<Gasto>();
    private List<Ingreso> ingresos = new ArrayList<Ingreso>();

    public Cuenta(Usuario usuario) {
        this.usuario = usuario;
        saldo = 0;
    }

    /* SALDO */
    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    /* USUARIO */
    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    /* ADD GASTOS & INGRESOS */
    public double addGastos(String description, double cantidad) throws GastoException {

        if (cantidad > saldo) {
            throw new GastoException("No tienes saldo suficiente.");
        }

        gastos.add(new Gasto(cantidad, description));

        saldo -= cantidad;

        return saldo;
    }

    public double addIngresos(String description, double cantidad) {

        ingresos.add(new Ingreso(cantidad, description));

        saldo += cantidad;

        return saldo;
    }

    /* GET GASTOS & INGRESOS */
    public List<Gasto> getGastos() {
        return gastos;
    }

    public List<Ingreso> getIngresos() {
        return ingresos;
    }

    /* TO STRING */
    @Override
    public String toString() {
        return "Cuenta{" +
                "usuario=" + usuario +
                ", saldo=" + saldo +
                ", gastos=" + gastos +
                ", ingresos=" + ingresos +
                '}';
    }
}