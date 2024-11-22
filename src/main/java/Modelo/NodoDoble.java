package Modelo;

public class NodoDoble {
    private Producto producto;
    private NodoDoble siguiente;
    private NodoDoble anterior;

    public NodoDoble(Producto producto) {
        this.producto = producto;
        this.siguiente = null;
        this.anterior = null;
    }

    public Producto getProducto() {
        return producto;
    }

    public NodoDoble getSiguiente() {
        return siguiente;
    }

    public void setSiguiente(NodoDoble siguiente) {
        this.siguiente = siguiente;
    }

    public NodoDoble getAnterior() {
        return anterior;
    }

    public void setAnterior(NodoDoble anterior) {
        this.anterior = anterior;
    }
}
