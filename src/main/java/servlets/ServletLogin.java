package servlets;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet para manejar el inicio de sesión de usuarios
 */
@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario de login
        String idUsuario = request.getParameter("user");
        String password = request.getParameter("password");

        // Validar si los parámetros son nulos o vacíos
        if (idUsuario == null || password == null || idUsuario.trim().isEmpty() || password.trim().isEmpty()) {
            response.sendRedirect("Login.jsp?error=missing_credentials");
            return;
        }

        idUsuario = idUsuario.trim();  // Eliminar espacios en blanco
        password = password.trim();

        // Definir la ruta del archivo donde están los usuarios
        String filePath = getServletContext().getRealPath("/data/clientes.txt");

        // Leer el archivo para verificar las credenciales
        boolean usuarioValido = false;
        String nombreUsuario = null;
        String direccion = null;
        String telefono = null;
        double saldo = 0.0;
        String membresia = null;

        try (BufferedReader reader = new BufferedReader(new FileReader(new File(filePath)))) {
            String linea;
            while ((linea = reader.readLine()) != null) {
                String[] datos = linea.split(",");
                if (datos.length < 7) {
                    continue;  // Si la línea no tiene suficientes datos, pasar a la siguiente
                }

                String idRegistrado = datos[0].trim(); // idUsuario guardado
                String passwordRegistrada = datos[6].trim(); // Contraseña guardada

                if (idUsuario.equals(idRegistrado) && password.equals(passwordRegistrada)) {
                    usuarioValido = true;
                    nombreUsuario = datos[1].trim(); // Guardar el nombre del usuario
                    direccion = datos[2].trim();
                    telefono = datos[3].trim();
                    saldo = Double.parseDouble(datos[4].trim());
                    membresia = datos[5].trim();
                    break;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            response.sendRedirect("Login.jsp?error=reading_failed");
            return;
        }

        if (usuarioValido) {
            // Iniciar sesión: guardar los datos del usuario en la sesión
            HttpSession session = request.getSession();
            session.setAttribute("nombre", nombreUsuario);
            session.setAttribute("idUsuario", idUsuario);
            session.setAttribute("direccion", direccion);
            session.setAttribute("telefono", telefono);
            session.setAttribute("saldo", saldo);
            session.setAttribute("membresia", membresia);

            // Redirigir a indexComprar.jsp
            response.sendRedirect("indexComprar.jsp");
        } else {
            // Redirigir de nuevo a login.jsp con un mensaje de error
            response.sendRedirect("Login.jsp?error=invalid_credentials");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para el inicio de sesión de usuarios";
    }
}
