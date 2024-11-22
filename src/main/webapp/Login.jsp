<%@ include file="/lib/header.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Login</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/StylesLR.css" rel="stylesheet" /> <!-- Incluyendo el archivo CSS -->
    </head>
    <body>
        <div class="container mt-2">
            <!-- Verificar si hay un mensaje de error -->
            <%
                String error = request.getParameter("error");
                if (error != null && error.equals("invalid_credentials")) {
            %>
            <div class="alert alert-danger" role="alert">
                Credenciales inválidas. Por favor, intente de nuevo.
            </div>
            <%
            } else if (error != null && error.equals("missing_credentials")) {
            %>
            <div class="alert alert-warning" role="alert">
                Complete todos los campos para iniciar sesión.
            </div>
            <%
                }
            %>
            <!-- Formulario dentro de una tabla -->
            <form action="${pageContext.request.contextPath}/ServletLogin" method="POST">
                <table class="form-table">
                    <tr>
                        <td colspan="2">
                            <label for="username">ID de Usuario</label>
                            <!-- Aquí el name debe ser "user" -->
                            <input type="text" name="user" id="username" required>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="password">Contraseña</label>
                            <!-- Aquí el name debe ser "password" -->
                            <input type="password" name="password" id="password" required>
                        </td>
                    </tr>
                    <tr class="buttons-row">
                        <td>
                            <button type="submit" class="btn btn-info">INICIAR SESIÓN</button>
                        </td>
                        <td>
                            <a href="registro.jsp" class="btn btn-secondary">REGISTRARSE</a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>

        <%@ include file="/lib/footer.jsp" %>
    </body>
</html>
