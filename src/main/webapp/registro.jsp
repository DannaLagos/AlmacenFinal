<%@ include file="/lib/header.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Registro de Usuario</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/StylesLR.css?v=1.0" rel="stylesheet" />
    </head>
    <body>
        <div class="form-wrapper">
            <div class="form-container">
                <%
                    String error = request.getParameter("error");
                    if ("id_taken".equals(error)) {
                %>
                <div class="error-box">
                    El ID ingresado ya está en uso. Por favor, ingresa otro ID.
                </div>
                <% } %>

                <!-- Formulario que envía los datos a svRegistroCliente -->
                <form action="svRegistroCliente" method="POST">
                    <table class="form-table">
                        <tr>
                            <td class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" name="nombre" class="form-control" id="nombre" required>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <label for="idUsuario">ID</label>
                                <input type="text" name="idUsuario" class="form-control" id="idUsuario" required>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <label for="direccion">Dirección</label>
                                <input type="text" name="direccion" class="form-control" id="direccion" required>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <label for="password">Contraseña</label>
                                <input type="password" name="password" class="form-control" id="password" required>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <label for="telefono">Teléfono</label>
                                <input type="text" name="telefono" class="form-control" id="telefono" required>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <label for="saldo">Saldo</label>
                                <input type="number" name="saldo" class="form-control" id="saldo" required>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <label for="membresia">Membresía</label>
                                <select name="membresia" class="form-control" id="membresia" required>
                                    <option value="Estandar">Estandar</option>
                                    <option value="Premium">Premium</option>
                                    <option value="VIP">VIP</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <!-- Botón para enviar el formulario -->
                                <button type="submit" class="btn btn-info">REGISTRARSE</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <%@ include file="/lib/footer.jsp" %>
    </body>
</html>
