package Modelo;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class ListaDobleCircular {
    private NodoDoble cabeza;
    private NodoDoble cola;
    private String rutaArchivo;

    public ListaDobleCircular(String rutaArchivo) {
        this.cabeza = null;
        this.rutaArchivo = rutaArchivo;
    }

    public void agregar(Producto producto) {
        producto.setCodigo(generarNuevoCodigo());

        NodoDoble nuevoNodo = new NodoDoble(producto);
        if (cabeza == null) {
            cabeza = nuevoNodo;
            cabeza.setSiguiente(cabeza); // Enlazar a sí mismo
            cabeza.setAnterior(cabeza);
        } else {
            NodoDoble ultimo = cabeza.getAnterior();
            ultimo.setSiguiente(nuevoNodo);
            nuevoNodo.setAnterior(ultimo);
            nuevoNodo.setSiguiente(cabeza);
            cabeza.setAnterior(nuevoNodo);
        }
        guardarEnArchivo(); // Guardar después de agregar
    }

    public List<Producto> listarPorUsuario(String idUsuario) {
        List<Producto> productosUsuario = new ArrayList<>();
        NodoDoble temp = cabeza;
        
        if (temp != null) {
            do {
                Producto producto = temp.getProducto();
                if (producto.getIdUsuario() != null && producto.getIdUsuario().equals(idUsuario)) {
                    productosUsuario.add(producto);
                }
                temp = temp.getSiguiente();
            } while (temp != cabeza);
        }
        return productosUsuario;
    }

    private int generarNuevoCodigo() {
        int maxCodigo = 0;
        NodoDoble temp = cabeza;
        if (temp == null) return 1; // Si está vacío, el primer código es 1

        do {
            maxCodigo = Math.max(maxCodigo, temp.getProducto().getCodigo());
            temp = temp.getSiguiente();
        } while (temp != cabeza);
        
        return maxCodigo + 1; // Retornar el siguiente código
    }

    public void guardarEnArchivo() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(rutaArchivo))) {
            NodoDoble temp = cabeza;
            if (temp != null) {
                do {
                    Producto producto = temp.getProducto();
                    writer.write(producto.getCodigo() + "," + producto.getReferencia() + "," + producto.getUnidades() + "," + producto.getPrecio() + "," + producto.getIdUsuario());
                    writer.newLine();
                    temp = temp.getSiguiente();
                } while (temp != cabeza);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

   public void cargarDesdeArchivo() {
    cabeza = null;
    cola = null;
    try (BufferedReader reader = new BufferedReader(new FileReader(rutaArchivo))) {
        String linea;
        while ((linea = reader.readLine()) != null) {
            String[] datos = linea.split(",");
            if (datos.length == 5) {
                int codigo = Integer.parseInt(datos[0]);
                String referencia = datos[1];
                int unidades = Integer.parseInt(datos[2]);
                double precio = Double.parseDouble(datos[3]);
                String idUsuario = datos[4];
                Producto producto = new Producto(referencia, unidades, codigo, precio, idUsuario);
                
                // Insertar sin guardar repetidamente
                NodoDoble nuevoNodo = new NodoDoble(producto);
                if (cabeza == null) {
                    cabeza = nuevoNodo;
                    cabeza.setSiguiente(cabeza);
                    cabeza.setAnterior(cabeza);
                    cola = cabeza;
                } else {
                    NodoDoble ultimo = cabeza.getAnterior();
                    ultimo.setSiguiente(nuevoNodo);
                    nuevoNodo.setAnterior(ultimo);
                    nuevoNodo.setSiguiente(cabeza);
                    cabeza.setAnterior(nuevoNodo);
                }
            }
        }
    } catch (IOException e) {
        e.printStackTrace();
    }
}


    public void listarProductosAvanzar() {
        if (cabeza == null) return;
        NodoDoble temp = cabeza;
        do {
            Producto producto = temp.getProducto();
            System.out.println("Código: " + producto.getCodigo() + ", Referencia: " + producto.getReferencia() +
                               ", Unidades: " + producto.getUnidades() + ", Precio: " + producto.getPrecio());
            temp = temp.getSiguiente();
        } while (temp != cabeza);
    }

    public void listarProductosRetroceder() {
        if (cabeza == null) return;
        NodoDoble temp = cabeza.getAnterior();
        do {
            Producto producto = temp.getProducto();
            System.out.println("Código: " + producto.getCodigo() + ", Referencia: " + producto.getReferencia() +
                               ", Unidades: " + producto.getUnidades() + ", Precio: " + producto.getPrecio());
            temp = temp.getAnterior();
        } while (temp != cabeza.getAnterior());
    }

    // Método para editar un producto existente por su código
    public void editarPorCodigo(int codigo, int nuevasUnidades, double nuevoPrecio) {
        if (cabeza == null) return;
        NodoDoble temp = cabeza;

        do {
            if (temp.getProducto().getCodigo() == codigo) {
                // Actualizar unidades y precio
                temp.getProducto().setUnidades(nuevasUnidades);
                temp.getProducto().setPrecio(nuevoPrecio);
                break; // Salir después de encontrar y editar
            }
            temp = temp.getSiguiente();
        } while (temp != cabeza);
        
        guardarEnArchivo(); // Guardar después de editar
    }

    public boolean eliminarPorCodigo(int codigo) {
        if (cabeza == null) return false; // Verifica si la lista está vacía

        NodoDoble temp = cabeza;
        boolean encontrado = false; // Para saber si se encontró el nodo a eliminar

        do {
            if (temp.getProducto().getCodigo() == codigo) {
                encontrado = true; // Nodo encontrado

                // Caso especial: si es el único nodo en la lista
                if (temp.getSiguiente() == cabeza && temp.getAnterior() == cabeza) {
                    cabeza = null; // La lista queda vacía
                } else {
                    NodoDoble anterior = temp.getAnterior();
                    NodoDoble siguiente = temp.getSiguiente();

                    // Actualizar enlaces
                    anterior.setSiguiente(siguiente);
                    siguiente.setAnterior(anterior);

                    // Si estamos eliminando la cabeza, mover la cabeza al siguiente
                    if (temp == cabeza) {
                        cabeza = siguiente; // Actualizar cabeza
                    }
                }
                guardarEnArchivo(); // Guardar después de eliminar
                return true; // Producto eliminado
            }
            temp = temp.getSiguiente(); // Moverse al siguiente nodo
        } while (temp != cabeza);

        return false; // Código no encontrado
    }
    public void realizarRecorridoDoble(String dataFolder) throws IOException {
    String rutaRelativa = "/recorridoDobleProductos.txt"; // Cambia el nombre del archivo si es necesario
    File archivo = new File(dataFolder + rutaRelativa);

    try (FileWriter pluma = new FileWriter(archivo)) {
        pluma.write("Recorrido hacia adelante:\n");
        NodoDoble temp = cabeza;
        if (temp != null) {
            do {
                Producto producto = temp.getProducto();
                pluma.write("Usuario ID:"+"\n" + producto.getIdUsuario() + ", Código: " + producto.getCodigo() +
                            ", Referencia: " + producto.getReferencia() + ", Unidades: " + producto.getUnidades() +
                            ", Precio: " + producto.getPrecio() + "\n");
                temp = temp.getSiguiente();
            } while (temp != cabeza);
        }

        pluma.write("Recorrido hacia atrás:\n");
        if (cabeza != null) {
            temp = cabeza.getAnterior();
            do {
                Producto producto = temp.getProducto();
                pluma.write("Usuario ID: " + producto.getIdUsuario() + ", Código: " + producto.getCodigo() +
                            ", Referencia: " + producto.getReferencia() + ", Unidades: " + producto.getUnidades() +
                            ", Precio: " + producto.getPrecio() + "\n");
                temp = temp.getAnterior();
            } while (temp != cabeza.getAnterior());
        }
    }
}

}
