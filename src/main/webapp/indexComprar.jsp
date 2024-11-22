<%-- 
    Document   : indexComprar.jsp
    Created on : 23/08/2024, 1:58:40 p.m.
    Author     : DANNA LAGOS
--%>
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
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
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
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <form class="d-flex" action="carritoCompras.jsp" method="GET">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                    <button class="btn btn-outline-dark ms-3" type="button" data-bs-toggle="modal" data-bs-target="#userInfoModal">
                        <i class="fas fa-user"></i> Usuario
                    </button>
                    <!-- Botón para mostrar la información del empleado -->
                    <button class="btn btn-outline-dark ms-3" type="button" data-bs-toggle="modal" data-bs-target="#employeeInfoModal">
                        <i class="fas fa-user-tie"></i> Empleado
                    </button>
                </div>
            </div>
        </nav>

        <!-- Modal -->
        <div class="modal fade" id="userInfoModal" tabindex="-1" aria-labelledby="userInfoModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="userInfoModalLabel">Información del Usuario</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Validamos que los atributos de sesión existan -->
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


        <!-- Modal para mostrar la información del empleado -->
        <div class="modal fade" id="employeeInfoModal" tabindex="-1" aria-labelledby="employeeInfoModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="employeeInfoModalLabel">Información del Empleado</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="text-center">
                            <!-- Espacio para la imagen del empleado -->
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

        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Almacen De Compras</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Agrega tu compra</p>
                </div>
            </div>
        </header>

        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <!-- Product 1 -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img src="images/bolso1.jpg" alt="Bolsos de mano">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Mouawad</h5>
                                    De mano
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                    </div>
                                    $250.000
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" data-bs-toggle="modal" data-bs-target="#purchaseModa10">Comprar</a>

                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="purchaseModa10" tabindex="-1" aria-labelledby="purchaseModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="purchaseModalLabel">Comprar Baguette</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="text-center">
                                        <!-- Imagen del bolso -->
                                        <img src="images/bolso5.jpg" alt="Baguette" class="img-fluid mb-3" style="max-width: 200px;">
                                        <!-- Formulario para la compra -->
                                        <form action="gestionarProductos" method="POST">
                                            <!-- Input de referencia (no editable) -->
                                            <div class="mb-3">
                                                <label for="referenciaInput" class="form-label">Referencia:</label>
                                                <input type="text" id="referenciaInput" name="referencia" class="form-control" value="0001" readonly required>
                                            </div>

                                            <!-- Input de unidades (editable) -->
                                            <div class="mb-3">
                                                <label for="unidadesInput" class="form-label">Unidades:</label>
                                                <input type="number" id="unidadesInput" name="unidades" class="form-control" value="1" min="1" required>
                                            </div>

                                            <!-- Input de precio (no editable) -->
                                            <div class="mb-3">
                                                <label for="precioInput" class="form-label">Precio por unidad:</label>
                                                <input type="number" id="precioInput" name="precio" class="form-control" value="250000" readonly step="0.01" required>
                                            </div>

                                            <!-- Input oculto para la acción -->
                                            <input type="hidden" name="accion" value="agregar">

                                            <!-- Botón de compra -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                <button type="submit" class="btn btn-primary">Comprar</button>
                                            </div>
                                        </form>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Product 2 -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <img src="images/bolso2.jpg" alt="Carteras">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Ginza Tanaka</h5>
                                    Cartera
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                    </div>
                                    <span class="text-muted text-decoration-line-through">$250.000</span>
                                    $230.000
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" data-bs-toggle="modal" data-bs-target="#purchaseModa11">Comprar</a>

                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal con campo oculto para la acción -->
                    <div class="modal fade" id="purchaseModa11" tabindex="-1" aria-labelledby="purchaseModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="purchaseModalLabel">Comprar Baguette</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="text-center">
                                        <!-- Imagen del bolso -->
                                        <img src="images/bolso5.jpg" alt="Baguette" class="img-fluid mb-3" style="max-width: 200px;">

                                        <!-- Formulario para la compra -->
                                        <form action="gestionarProductos" method="POST">
                                            <!-- Input de referencia (no editable) -->
                                            <div class="mb-3">
                                                <label for="referenciaInput" class="form-label">Referencia:</label>
                                                <input type="text" id="referenciaInput" name="referencia" class="form-control" value="0002" readonly required>
                                            </div>

                                            <!-- Input de unidades (editable) -->
                                            <div class="mb-3">
                                                <label for="unidadesInput" class="form-label">Unidades:</label>
                                                <input type="number" id="unidadesInput" name="unidades" class="form-control" value="1" min="1" required>
                                            </div>

                                            <!-- Input de precio (no editable) -->
                                            <div class="mb-3">
                                                <label for="precioInput" class="form-label">Precio por unidad:</label>
                                                <input type="number" id="precioInput" name="precio" class="form-control" value="230000" readonly step="0.01" required>
                                            </div>

                                            <!-- Input oculto para la acción -->
                                            <input type="hidden" name="accion" value="agregar">

                                            <!-- Botón de compra -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                <button type="submit" class="btn btn-primary">Comprar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product 3 -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <img src="images/bolso3.jpg" alt="Bolsos en oferta">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Hermès Kelly</h5>
                                    De mano
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                    </div>
                                    <span class="text-muted text-decoration-line-through">$350.000</span>
                                    $320.000
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" data-bs-toggle="modal" data-bs-target="#purchaseModa12">Comprar</a>

                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="purchaseModa12" tabindex="-1" aria-labelledby="purchaseModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="purchaseModalLabel">Comprar Baguette</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="text-center">
                                        <!-- Imagen del bolso -->
                                        <img src="images/bolso3.jpg" alt="Baguette" class="img-fluid mb-3" style="max-width: 200px;">

                                        <!-- Formulario para la compra -->
                                        <form action="gestionarProductos" method="POST">
                                            <!-- Input de referencia (no editable) -->
                                            <div class="mb-3">
                                                <label for="referenciaInput" class="form-label">Referencia:</label>
                                                <input type="text" id="referenciaInput" name="referencia" class="form-control" value="0003" readonly required>
                                            </div>

                                            <!-- Input de unidades (editable) -->
                                            <div class="mb-3">
                                                <label for="unidadesInput" class="form-label">Unidades:</label>
                                                <input type="number" id="unidadesInput" name="unidades" class="form-control" value="1" min="1" required>
                                            </div>

                                            <!-- Input de precio (no editable) -->
                                            <div class="mb-3">
                                                <label for="precioInput" class="form-label">Precio por unidad:</label>
                                                <input type="number" id="precioInput" name="precio" class="form-control" value="320000" readonly step="0.01" required>
                                            </div>

                                            <!-- Input oculto para la acción -->
                                            <input type="hidden" name="accion" value="agregar">

                                            <!-- Botón de compra -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                <button type="submit" class="btn btn-primary">Comprar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Product 4 -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img src="images/bolso4.jpg" alt="Baguette">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Louis Vuitton</h5>
                                    Cartera
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                    </div>
                                    $650.000
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" data-bs-toggle="modal" data-bs-target="#purchaseModal13">Comprar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Repeat similar blocks for other products -->

                    <!-- Modal -->
                    <div class="modal fade" id="purchaseModal13" tabindex="-1" aria-labelledby="purchaseModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="purchaseModalLabel">Comprar Baguette</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="text-center">
                                        <!-- Imagen del bolso -->
                                        <img src="images/bolso6.jpg" alt="Baguette" class="img-fluid mb-3" style="max-width: 200px;">
                                        
                                        <form action="gestionarProductos" method="POST">
                                            <!-- Input de referencia (no editable) -->
                                            <div class="mb-3">
                                                <label for="referenciaInput" class="form-label">Referencia:</label>
                                                <input type="text" id="referenciaInput" name="referencia" class="form-control" value="0004" readonly required>
                                            </div>

                                            <!-- Input de unidades (editable) -->
                                            <div class="mb-3">
                                                <label for="unidadesInput" class="form-label">Unidades:</label>
                                                <input type="number" id="unidadesInput" name="unidades" class="form-control" value="1" min="1" required>
                                            </div>

                                            <!-- Input de precio (no editable) -->
                                            <div class="mb-3">
                                                <label for="precioInput" class="form-label">Precio por unidad:</label>
                                                <input type="number" id="precioInput" name="precio" class="form-control" value="650000" readonly step="0.01" required>
                                            </div>

                                            <!-- Input oculto para la acción -->
                                            <input type="hidden" name="accion" value="agregar">

                                            <!-- Botón de compra -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                <button type="submit" class="btn btn-primary">Comprar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    
                    <!-- Product 5 -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img src="images/bolso5.jpg" alt="Baguette">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Baguette</h5>
                                    Cartera
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                    </div>
                                    $950.000
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" data-bs-toggle="modal" data-bs-target="#purchaseModal14">Comprar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Repeat similar blocks for other products -->

                    <!-- Modal -->
                    <div class="modal fade" id="purchaseModal14" tabindex="-1" aria-labelledby="purchaseModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="purchaseModalLabel">Comprar Baguette</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="text-center">
                                        <!-- Imagen del bolso -->
                                        <img src="images/bolso6.jpg" alt="Baguette" class="img-fluid mb-3" style="max-width: 200px;">
                                        
                                        <form action="gestionarProductos" method="POST">
                                            <!-- Input de referencia (no editable) -->
                                            <div class="mb-3">
                                                <label for="referenciaInput" class="form-label">Referencia:</label>
                                                <input type="text" id="referenciaInput" name="referencia" class="form-control" value="0005" readonly required>
                                            </div>

                                            <!-- Input de unidades (editable) -->
                                            <div class="mb-3">
                                                <label for="unidadesInput" class="form-label">Unidades:</label>
                                                <input type="number" id="unidadesInput" name="unidades" class="form-control" value="1" min="1" required>
                                            </div>

                                            <!-- Input de precio (no editable) -->
                                            <div class="mb-3">
                                                <label for="precioInput" class="form-label">Precio por unidad:</label>
                                                <input type="number" id="precioInput" name="precio" class="form-control" value="950000" readonly step="0.01" required>
                                            </div>

                                            <!-- Input oculto para la acción -->
                                            <input type="hidden" name="accion" value="agregar">

                                            <!-- Botón de compra -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                <button type="submit" class="btn btn-primary">Comprar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <!-- Product 6 -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img src="images/bolso6.jpg" alt="Baguette">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Michael Kors</h5>
                                    Coleccion bolsos
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                    </div>
                                    $850.000
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" data-bs-toggle="modal" data-bs-target="#purchaseModal15">Comprar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Repeat similar blocks for other products -->

                    <!-- Modal -->
                    <div class="modal fade" id="purchaseModal15" tabindex="-1" aria-labelledby="purchaseModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="purchaseModalLabel">Comprar Baguette</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="text-center">
                                        <!-- Imagen del bolso -->
                                        <img src="images/bolso6.jpg" alt="Baguette" class="img-fluid mb-3" style="max-width: 200px;">
                                        
                                        <form action="gestionarProductos" method="POST">
                                            <!-- Input de referencia (no editable) -->
                                            <div class="mb-3">
                                                <label for="referenciaInput" class="form-label">Referencia:</label>
                                                <input type="text" id="referenciaInput" name="referencia" class="form-control" value="0006" readonly required>
                                            </div>

                                            <!-- Input de unidades (editable) -->
                                            <div class="mb-3">
                                                <label for="unidadesInput" class="form-label">Unidades:</label>
                                                <input type="number" id="unidadesInput" name="unidades" class="form-control" value="1" min="1" required>
                                            </div>

                                            <!-- Input de precio (no editable) -->
                                            <div class="mb-3">
                                                <label for="precioInput" class="form-label">Precio por unidad:</label>
                                                <input type="number" id="precioInput" name="precio" class="form-control" value="850000" readonly step="0.01" required>
                                            </div>

                                            <!-- Input oculto para la acción -->
                                            <input type="hidden" name="accion" value="agregar">

                                            <!-- Botón de compra -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                <button type="submit" class="btn btn-primary">Comprar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <!-- Product 7 -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img src="images/bolso7.jpg" alt="Baguette">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Mouawad 1001</h5>
                                    Bolso de mano
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                    </div>
                                    $1.050.000
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" data-bs-toggle="modal" data-bs-target="#purchaseModal16">Comprar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Repeat similar blocks for other products -->

                    <!-- Modal -->
                    <div class="modal fade" id="purchaseModal16" tabindex="-1" aria-labelledby="purchaseModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="purchaseModalLabel">Comprar Baguette</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="text-center">
                                        <!-- Imagen del bolso -->
                                        <img src="images/bolso7.jpg" alt="Baguette" class="img-fluid mb-3" style="max-width: 200px;">
                                        
                                        <form action="gestionarProductos" method="POST">
                                            <!-- Input de referencia (no editable) -->
                                            <div class="mb-3">
                                                <label for="referenciaInput" class="form-label">Referencia:</label>
                                                <input type="text" id="referenciaInput" name="referencia" class="form-control" value="0007" readonly required>
                                            </div>

                                            <!-- Input de unidades (editable) -->
                                            <div class="mb-3">
                                                <label for="unidadesInput" class="form-label">Unidades:</label>
                                                <input type="number" id="unidadesInput" name="unidades" class="form-control" value="1" min="1" required>
                                            </div>

                                            <!-- Input de precio (no editable) -->
                                            <div class="mb-3">
                                                <label for="precioInput" class="form-label">Precio por unidad:</label>
                                                <input type="number" id="precioInput" name="precio" class="form-control" value="1050000" readonly step="0.01" required>
                                            </div>

                                            <!-- Input oculto para la acción -->
                                            <input type="hidden" name="accion" value="agregar">

                                            <!-- Botón de compra -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                <button type="submit" class="btn btn-primary">Comprar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <!-- Product 8 -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img src="images/bolso8.jpg" alt="Baguette">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Givenchy</h5>
                                    Cartera
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                        <i class="bi-star-fill"></i>
                                    </div>
                                    $550.000
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" data-bs-toggle="modal" data-bs-target="#purchaseModal17">Comprar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Repeat similar blocks for other products -->

                    <!-- Modal -->
                    <div class="modal fade" id="purchaseModal17" tabindex="-1" aria-labelledby="purchaseModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="purchaseModalLabel">Comprar Baguette</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="text-center">
                                        <!-- Imagen del bolso -->
                                        <img src="images/bolso8.jpg" alt="Baguette" class="img-fluid mb-3" style="max-width: 200px;">
                                        
                                        <form action="gestionarProductos" method="POST">
                                            <!-- Input de referencia (no editable) -->
                                            <div class="mb-3">
                                                <label for="referenciaInput" class="form-label">Referencia:</label>
                                                <input type="text" id="referenciaInput" name="referencia" class="form-control" value="0008" readonly required>
                                            </div>

                                            <!-- Input de unidades (editable) -->
                                            <div class="mb-3">
                                                <label for="unidadesInput" class="form-label">Unidades:</label>
                                                <input type="number" id="unidadesInput" name="unidades" class="form-control" value="1" min="1" required>
                                            </div>

                                            <!-- Input de precio (no editable) -->
                                            <div class="mb-3">
                                                <label for="precioInput" class="form-label">Precio por unidad:</label>
                                                <input type="number" id="precioInput" name="precio" class="form-control" value="550000" readonly step="0.01" required>
                                            </div>

                                            <!-- Input oculto para la acción -->
                                            <input type="hidden" name="accion" value="agregar">

                                            <!-- Botón de compra -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                <button type="submit" class="btn btn-primary">Comprar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
            </div>



            <!-- Footer-->
            <footer class="py-5 bg-dark">
                <div class="container">
                    <p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p>
                </div>
            </footer>

            <!-- Bootstrap core JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <script src="js/scripts.js"></script>
    </body>
</html>
<%@ include file="/lib/footer.jsp" %>
