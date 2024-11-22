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
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/StylesLR.css" rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="#">Start Bootstrap</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Botón de carrito -->
                <form class="d-flex">
                    <button class="btn btn-outline-dark" type="submit">
                        <i class="bi-cart-fill me-1"></i>
                        Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                    </button>
                </form>

                <!-- Menú desplegable de usuario -->
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item dropdown ms-3">
                        <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <!-- Icono de usuario -->
                            <i class="fas fa-user"></i>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="userDropdown">                           
                            <li><a class="dropdown-item" href="Login.jsp">Iniciar Sesión</a></li>
                            <li><a class="dropdown-item" href="registro.jsp">Registrarse</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Header-->
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">Almacen De Bolsos</h1>
                <p class="lead fw-normal text-white-50 mb-0">Bodega Distribuidora</p>
            </div>
        </div>
    </header>

    <div class="container mt-4">
        <!-- Mostrar el mensaje de éxito si el producto fue agregado -->
        <% if (request.getParameter("success") != null && request.getParameter("success").equals("true")) { %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>¡Éxito!</strong> El producto fue agregado exitosamente.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <% } %>

        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                    <!-- Bolso 1 -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img src="images/bolso1.jpg" alt="Bolso 1">
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
                                    <a class="btn btn-outline-dark mt-auto" href="Login.jsp">Comprar</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Bolso 2 -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <img src="images/bolso2.jpg" alt="Bolso 2">
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
                                    <a class="btn btn-outline-dark mt-auto" href="Login.jsp">Comprar</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Bolso 3 -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <img src="images/bolso3.jpg" alt="Bolso 3">
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
                                    $350.000
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="Login.jsp">Comprar</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Bolso 4 -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img src="images/bolso4.jpg" alt="Bolso 4">
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
                                    <a class="btn btn-outline-dark mt-auto" href="Login.jsp">Comprar</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Bolso 5 -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img src="images/bolso5.jpg" alt="Bolso 5">
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
                                    <a class="btn btn-outline-dark mt-auto" href="Login.jsp">Comprar</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Bolso 6 -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img src="images/bolso6.jpg" alt="Bolso 6">
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
                                    <a class="btn btn-outline-dark mt-auto" href="Login.jsp">Comprar</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Bolso 7 -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img src="images/bolso7.jpg" alt="Bolso 7">
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
                                    <a class="btn btn-outline-dark mt-auto" href="Login.jsp">Comprar</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Bolso 8 -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img src="images/bolso8.jpg" alt="Bolso 8">
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
                                    <a class="btn btn-outline-dark mt-auto" href="Login.jsp">Comprar</a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </div>

</html>

<%@ include file="/lib/footer.jsp" %>