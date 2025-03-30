
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Paseos Naturales CR</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>

        <div class="p-5 bg-primary text-white text-center">
            <h1>Paseos Naturales CR ☼</h1>
            <p>Encuentra tu evento ideal!</p> 
        </div>

        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <div class="container-fluid">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Eventos.jsp">Paseos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="PublicarEvento.jsp">Publicar paseos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="MisReservas.jsp">Mis reservas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Historial.jsp">Mis publicaciones</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Logout.jsp">Cerrar sesion</a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container mt-5">
            <div class="row">
                <div class="col-sm-4">
                    <h2>Sobre nosotros</h2>
                    <h5>Objetivo:</h5>
                    <div class="fakeimg">Campo para imagen</div>
                    <p>Nuestro objetivo es mostar eventos para el proyecto.</p>
                    <h3 class="mt-4">Algunos links</h3>
                    <p>Si necesitas ayuda:</p>
                    <ul class="nav nav-pills flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Eventos disponibles</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Preguntas frecuentes</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">Manual usuario</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#">Disabled</a>
                        </li>
                    </ul>
                    <hr class="d-sm-none">
                </div>
                <div class="col-sm-8">
                    <h2>VERANO 2025</h2>
                    <h5>Destinos paradisiacos.</h5>
                    <div class="fakeimg">Campo para imagen</div>
                    <p>Playas del coco..</p>
                    <p>No dejes pasar los increibles eventos de este verano 2025.</p>

                    <h2 class="mt-5">JUNIO Y JULIO</h2>
                    <h5>Aprovecha las vacaciones escolares.</h5>
                    <div class="fakeimg">Campo para imagen</div>
                    <p>Baldi..</p>
                    <p>El equipo de Vacaciones CR tiene una amplia variedad de eventos para ti..</p>
                </div>
            </div>
        </div>

        <div class="mt-5 p-4 bg-dark text-white text-center">
            <p>vacacionescr@gmail.com</p>
            <p>WhatsApp: +506 0102 0304</p>
            <p>@Derechos reservados</p>
        </div>
    </body>
</html>
