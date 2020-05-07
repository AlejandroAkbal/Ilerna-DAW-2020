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

