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
            </div>
        </nav>

        <!-- Header -->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Almacén De Compras</h1>
                    <p class="mt-3">
                        Gracias por elegirnos como su tienda de confianza. Nos enorgullece ofrecer productos de calidad que cumplen con sus expectativas. Su preferencia nos inspira a seguir mejorando y brindándole una experiencia excepcional en cada compra. Valoramos profundamente su confianza y estamos comprometidos a atender sus necesidades con la máxima dedicación.
                    </p>
                    <p class="mb-4">
                        A continuación, encontrará la factura con los detalles de los productos adquiridos. Por favor, revise cuidadosamente y guarde este comprobante como referencia de su compra.
                    </p>
                    <button class="btn btn-outline-light mb-2" type="button" data-bs-toggle="modal" data-bs-target="#invoiceModal">
                        <i class="fas fa-file-invoice-dollar"></i> Factura
                    </button>
                    <br>
                    <a href="index.jsp" class="btn btn-danger">
                        <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
                    </a>
                </div>
            </div>
        </header>



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
                        <h5><strong>Total pagado: $<span id="totalFactura"><%= totalFactura%></span></strong></h5>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>