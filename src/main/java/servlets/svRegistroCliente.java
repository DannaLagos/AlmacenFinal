package servlets;

import Modelo.Cliente;
import Modelo.GestionarClientes;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "svRegistroCliente", urlPatterns = {"/svRegistroCliente"})
public class svRegistroCliente extends HttpServlet {

    private final GestionarClientes gestionarClientes = new GestionarClientes();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Captura de parámetros del formulario
            String nombre = request.getParameter("nombre");
            String idUsuario = request.getParameter("idUsuario");
            String direccion = request.getParameter("direccion");
            String password = request.getParameter("password");
            String telefono = request.getParameter("telefono");
            String saldoStr = request.getParameter("saldo");
            String membresia = request.getParameter("membresia");

            // Conversión del saldo de String a double
            double saldo;
            try {
                saldo = Double.parseDouble(saldoStr);
            } catch (NumberFormatException e) {
                response.sendRedirect("registro.jsp?error=invalid_saldo");
                return;
            }

            // Crear o verificar el directorio "data"
            String dataFolder = getServletContext().getRealPath("/data");
            File directorioData = new File(dataFolder);
            if (!directorioData.exists() && !directorioData.mkdirs()) {
                throw new IOException("No se pudo crear el directorio 'data'.");
            }

            // Archivos de texto y datos
            File fileTexto = new File(dataFolder + "/clientes.txt");
            File fileData = new File(dataFolder + "/clientes.data");

            // Verificar si el ID del cliente ya existe
            if (gestionarClientes.isIdUsuarioTaken(fileTexto, idUsuario)) {
                response.sendRedirect("registro.jsp?error=id_taken");
                return;
            }

            // Crear un nuevo cliente
            Cliente nuevoCliente = new Cliente();
            nuevoCliente.setSaldo(saldo);
            nuevoCliente.setMembresia(membresia);
            nuevoCliente.setNombre(nombre);
            nuevoCliente.setDireccion(direccion);
            nuevoCliente.setTelefono(telefono);
            nuevoCliente.setPassword(password);
            nuevoCliente.setIdUsuario(idUsuario);

            // Agregar el cliente al archivo de texto y luego al archivo de datos (serializado)
            gestionarClientes.agregarCliente(fileTexto, fileData, nuevoCliente);

            // Crear el archivo de recorrido doble (hacia adelante y hacia atrás)
            File recorridoFile = new File(dataFolder + "/recorridoDobleClientes.txt");
            gestionarClientes.realizarRecorridoDoble(fileTexto, recorridoFile);

            // Guardar los datos del cliente en la sesión
            HttpSession session = request.getSession();
            session.setAttribute("nombre", nuevoCliente.getNombre());
            session.setAttribute("idUsuario", nuevoCliente.getIdUsuario());
            session.setAttribute("direccion", nuevoCliente.getDireccion());
            session.setAttribute("telefono", nuevoCliente.getTelefono());
            session.setAttribute("saldo", nuevoCliente.getSaldo());
            session.setAttribute("membresia", nuevoCliente.getMembresia());

            // Redirigir a la página de compra
            response.sendRedirect("indexComprar.jsp?registro=exito");

        } catch (Exception e) {
            Logger.getLogger(svRegistroCliente.class.getName()).log(Level.SEVERE, null, e);
            response.sendRedirect("registro.jsp?error=internal_error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para registrar clientes";
    }
}
