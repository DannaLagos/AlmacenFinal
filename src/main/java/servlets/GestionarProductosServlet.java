package servlets;

import Modelo.ListaDobleCircular;
import Modelo.Producto;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/gestionarProductos")
public class GestionarProductosServlet extends HttpServlet {

    private ListaDobleCircular listaProductos;

    @Override
    public void init() throws ServletException {
        // Cargar productos desde el archivo al inicializar el servlet
        String rutaArchivo = getServletContext().getRealPath("/data/productos.txt");
        listaProductos = new ListaDobleCircular(rutaArchivo);
        listaProductos.cargarDesdeArchivo();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String idUsuario = (String) request.getSession().getAttribute("idUsuario");

        if (idUsuario == null) {
            // Redirigir al login si no hay un usuario en sesión
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            if ("agregar".equals(accion)) {
                agregarProducto(request, idUsuario);
                listaProductos.realizarRecorridoDoble(getServletContext().getRealPath("/data"));
                generarHistorialUsuario(idUsuario);
                response.sendRedirect("carritoCompras.jsp?success=true");

            } else if ("eliminar".equals(accion)) {
                eliminarProducto(request);
                listaProductos.realizarRecorridoDoble(getServletContext().getRealPath("/data"));
                generarHistorialUsuario(idUsuario);
                response.sendRedirect("carritoCompras.jsp?deleted=true");

            } else if ("editar".equals(accion)) {
                editarProducto(request);
                listaProductos.realizarRecorridoDoble(getServletContext().getRealPath("/data"));
                generarHistorialUsuario(idUsuario);
                response.sendRedirect("carritoCompras.jsp?updated=true");

            } else {
                // Acción no encontrada
                response.sendRedirect("carritoCompras.jsp?error=actionNotFound");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("carritoCompras.jsp?error=invalidNumber");
        } catch (Exception e) {
            response.sendRedirect("carritoCompras.jsp?error=unexpected");
        }
    }

    private void agregarProducto(HttpServletRequest request, String idUsuario) throws NumberFormatException {
        String referencia = request.getParameter("referencia");
        int unidades = Integer.parseInt(request.getParameter("unidades"));
        double precio = Double.parseDouble(request.getParameter("precio"));

        Producto nuevoProducto = new Producto(referencia, unidades, 0, precio, idUsuario);
        listaProductos.agregar(nuevoProducto);
        listaProductos.guardarEnArchivo(); // Guardar cambios en el archivo
    }

    private void eliminarProducto(HttpServletRequest request) throws NumberFormatException {
        String codigoStr = request.getParameter("codigo");

        if (codigoStr != null && !codigoStr.isEmpty()) {
            int codigo = Integer.parseInt(codigoStr);
            listaProductos.eliminarPorCodigo(codigo);
            listaProductos.guardarEnArchivo(); // Guardar cambios en el archivo
        }
    }

    private void editarProducto(HttpServletRequest request) throws NumberFormatException {
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        int unidades = Integer.parseInt(request.getParameter("unidades"));
        double precio = Double.parseDouble(request.getParameter("precio"));

        listaProductos.editarPorCodigo(codigo, unidades, precio);
        listaProductos.guardarEnArchivo(); // Guardar cambios en el archivo
    }

    private void generarHistorialUsuario(String idUsuario) throws IOException {
        // Generar el archivo de historial para el usuario
        String rutaHistorial = getServletContext().getRealPath("/data/historial_" + idUsuario + ".txt");

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(rutaHistorial))) {
            writer.write("Usuario ID: " + idUsuario + "\nProductos:\n");
            for (Producto producto : listaProductos.listarPorUsuario(idUsuario)) {
                writer.write("Referencia: " + producto.getReferencia() + ", Unidades: " + producto.getUnidades()
                        + ", Precio: $" + producto.getPrecio() + "\n");
            }
        }
    }
}
