
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
        <title>Punto de venta</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="WEB-INF/menu.jsp">
            <jsp:param name="opcion" value="usuarios"/>
        </jsp:include>
        <div class="container">
            <h1>Formulario de Usuarios</h1>

            <br>
            <form action="UsuarioControlador" method="post">
                <input type="hidden" name="id" value="${usuario.id}"/>
                <div class="form-group">
                    <label for="" class="form-label">Nombres</label>
                    <input type="text" class="form-control" name="nombres" value="${usuario.nombres}" placeholder="Escriba su nombre completo">
                </div>
                <div class="form-group">
                    <label for="" class="form-label">Apellidos</label>
                    <input type="text" class="form-control" name="apellidos" value="${usuario.apellidos}" placeholder="Escriba su apellido completo">
                </div>
                <div class="form-group">
                    <label for="" class="form-label">Correo Electronico</label>
                    <input type="email" class="form-control" name="correo" value="${usuario.correo}" placeholder="Escriba su correo electronico">
                </div>
                <div class="form-group">
                    <label for="" class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" value="${usuario.password}" placeholder="Escriba su Password">
                </div>
                
                <br> 
                <button type="submit" class="btn btn-primary">Enviar</button>

            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>



