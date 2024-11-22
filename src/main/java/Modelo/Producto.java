package Modelo;

public class Producto {

    public Producto() {
    }

    public Producto(String referencia, int unidades, int codigo, double precio, String idUsuario) {
        this.referencia = referencia;
        this.unidades = unidades;
        this.codigo = codigo;
        this.precio = precio;
        this.idUsuario = idUsuario;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public int getUnidades() {
        return unidades;
    }

    public void setUnidades(int unidades) {
        this.unidades = unidades;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }
    private String referencia;
    private int unidades;
    private int codigo;
    private double precio;
     private String idUsuario; 

}
