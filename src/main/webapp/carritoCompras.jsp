<%@page import="java.util.List"%>
<%@page import="Modelo.Producto"%>
<%@page import="Modelo.ListaDobleCircular"%>
<%@ include file="/lib/header.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="DANNA LAGOS" />
        <title>Almacen de Compras</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/StylesLR.css" rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#">Almacen de Compras</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" 
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Formulario para el carrito -->
                    <form class="d-flex" action="indexComprar.jsp" method="GET">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>

                    <button class="btn btn-outline-dark ms-3" type="button" data-bs-toggle="modal" data-bs-target="#userInfoModal">
                        <i class="fas fa-user"></i> Usuario
                    </button>
                    <button class="btn btn-outline-dark ms-3" type="button" data-bs-toggle="modal" data-bs-target="#employeeInfoModal">
                        <i class="fas fa-user-tie"></i> Empleado
                    </button>
                </div>
            </div>
        </nav>

        <!-- Modal de Información del Usuario -->
        <div class="modal fade" id="userInfoModal" tabindex="-1" aria-labelledby="userInfoModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="userInfoModalLabel">Información del Usuario</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p><strong>Nombre:</strong> <%= session.getAttribute("nombre") != null ? session.getAttribute("nombre") : "No disponible"%></p>
                        <p><strong>ID Usuario:</strong> <%= session.getAttribute("idUsuario") != null ? session.getAttribute("idUsuario") : "No disponible"%></p>
                        <p><strong>Dirección:</strong> <%= session.getAttribute("direccion") != null ? session.getAttribute("direccion") : "No disponible"%></p>
                        <p><strong>Teléfono:</strong> <%= session.getAttribute("telefono") != null ? session.getAttribute("telefono") : "No disponible"%></p>
                        <p><strong>Saldo:</strong> $<%= session.getAttribute("saldo") != null ? session.getAttribute("saldo") : "0.00"%></p>
                        <p><strong>Membresía:</strong> <%= session.getAttribute("membresia") != null ? session.getAttribute("membresia") : "No disponible"%></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <a href="index.jsp" class="btn btn-danger">
                            <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal para la Información del Empleado -->
        <div class="modal fade" id="employeeInfoModal" tabindex="-1" aria-labelledby="employeeInfoModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="employeeInfoModalLabel">Información del Empleado</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="text-center">
                            <img src="images/empleado.jpeg" alt="Foto de Nancy Urbano" class="rounded-circle mb-3" width="150" height="150">
                        </div>
                        <p><strong>Nombre:</strong> Nancy Urbano</p>
                        <p><strong>Cargo:</strong> Gerente General</p>
                        <p><strong>Teléfono:</strong> 1086532983</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal para mostrar la Factura -->
        <div class="modal fade" id="invoiceModal" tabindex="-1" aria-labelledby="invoiceModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="invoiceModalLabel">Factura</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h5><strong>Productos Seleccionados:</strong></h5>
                        <div id="productosFactura">
                            <%
                                // Recuperamos los productos del usuario para mostrar en la factura
                                String idUsuario = (String) session.getAttribute("idUsuario");
                                double totalFactura = 0.0;

                                if (idUsuario != null) {
                                    String rutaArchivo = application.getRealPath("/data/productos.txt");
                                    ListaDobleCircular listaProductos = new ListaDobleCircular(rutaArchivo);
                                    listaProductos.cargarDesdeArchivo();

                                    List<Producto> productos = listaProductos.listarPorUsuario(idUsuario);

                                    if (productos != null && !productos.isEmpty()) {
                                        // Recorremos los productos y los mostramos
                                        for (Producto producto : productos) {
                                            double totalProducto = producto.getPrecio() * producto.getUnidades();
                                            totalFactura += totalProducto;
                            %>
                            <div>
                                <strong><%= producto.getReferencia()%></strong><br>
                                Unidades: <%= producto.getUnidades()%><br>
                                Precio Unitario: $<%= producto.getPrecio()%><br>
                                Total Producto: $<%= totalProducto%><br>
                                <hr>
                            </div>
                            <%
                                }
                            } else {
                            %>
                            <p>No hay productos en el carrito.</p>
                            <%
                                    }
                                }
                            %>
                        </div>
                        <hr>
                        <h5><strong>Total a Pagar: $<span id="totalFactura"><%= totalFactura%></span></strong></h5>
                        <!-- Formulario para Confirmar la Compra y eliminar los productos -->
                        <form action="FinalCompra.jsp" method="POST">
                            <input type="hidden" name="accion" value="confirmarCompra">
                            <button type="submit" class="btn btn-primary">Confirmar Compra</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Almacen De Compras</h1>
                    <button class="btn btn-outline-light" type="button" data-bs-toggle="modal" data-bs-target="#invoiceModal">
                        <i class="fas fa-file-invoice-dollar"></i> Factura
                    </button>
                </div>

            </div>
        </header>




        <!-- Sección para mostrar los productos -->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <%

                        if (idUsuario != null) {
                            String rutaArchivo = application.getRealPath("/data/productos.txt");
                            ListaDobleCircular listaProductos = new ListaDobleCircular(rutaArchivo);
                            listaProductos.cargarDesdeArchivo();

                            List<Producto> productos = listaProductos.listarPorUsuario(idUsuario);

                            for (Producto producto : productos) {
                    %>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder"><%= producto.getReferencia()%></h5>
                                    <p>Unidades: <%= producto.getUnidades()%></p>
                                    <p>Precio: $<%= producto.getPrecio()%></p>
                                    <p>Código: <%= producto.getCodigo()%></p>
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <button type="button" class="btn btn-primary" onclick="editarProducto('<%= producto.getReferencia()%>', <%= producto.getUnidades()%>, <%= producto.getCodigo()%>, <%= producto.getPrecio()%>)">
                                        <i class="fas fa-edit"></i> Editar
                                    </button>
                                    <form action="gestionarProductos" method="POST" style="display:inline;">
                                        <input type="hidden" name="codigo" value="<%= producto.getCodigo()%>">
                                        <input type="hidden" name="accion" value="eliminar">
                                        <button type="submit" class="btn btn-danger">
                                            <i class="fas fa-trash"></i> Eliminar
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </section>

        <!-- Modal para editar información de la compra -->
        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Editar Información de la Compra</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="gestionarProductos" method="POST">
                            <div class="mb-3">
                                <label for="referenciaInput" class="form-label">Referencia:</label>
                                <input type="text" id="referenciaInput" name="referencia" class="form-control" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="unidadesInput" class="form-label">Unidades:</label>
                                <input type="number" id="unidadesInput" name="unidades" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="codigoInput" class="form-label">Código:</label>
                                <input type="number" id="codigoInput" name="codigo" class="form-control" readonly required>
                            </div>
                            <div class="mb-3">
                                <label for="precioInput" class="form-label">Precio:</label>
                                <input type="number" id="precioInput" name="precio" class="form-control" step="0.01" readonly required>
                            </div>
                            <input type="hidden" name="accion" value="editar">
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                <button type="submit" class="btn btn-primary">Guardar cambios</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- JavaScript para cargar datos en el modal -->
        <script>
            function editarProducto(referencia, unidades, codigo, precio) {
                document.getElementById('referenciaInput').value = referencia;
                document.getElementById('unidadesInput').value = unidades;
                document.getElementById('codigoInput').value = codigo;
                document.getElementById('precioInput').value = precio;

                var editModal = new bootstrap.Modal(document.getElementById('editModal'));
                editModal.show();
            }
        </script>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>