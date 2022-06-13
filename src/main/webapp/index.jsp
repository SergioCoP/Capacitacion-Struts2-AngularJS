<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%String context = request.getContextPath();%>
<html ng-app="CourseStruts">
<head>
    <%--    <title>JSP - Hello World</title>--%>
    <%--    <script src="assets/jquery/jquery-3.5.1.js"></script>--%>
    <%--    <link rel="stylesheet" href="assets/bootstrap-4.6.1-dist/css/bootstrap.min.css">--%>
    <%--    <link rel="stylesheet" href="assets/font-Awesome-6.x/css/all.css"/>--%>
    <%--    <script src="js/angular.min.js"></script>--%>
    <%--    <script src="js/app.js"></script>--%>
    <%--    <script src="js/modules/user/user.js"></script>--%>

    <jsp:include page="views/layout/head.jsp"></jsp:include>
</head>
<body ng-controller="user">


<main>
    <jsp:include page="/views/layout/navbar.jsp"/>

    <div class="container-fluid">
        <div class="row bg-light">
            <div class="col-12">
                <h1 class="text-center text-md-left">
                    Gestión de roles
                </h1>
                <hr class="bg-primary">
            </div>
            <div class="col-12 text-center text-md-right">
                <button class="btn btn-outline-success" data-toggle="modal" data-target="#registerRolModal">Registrar
                </button>
            </div>
        </div>

        <div class="container">
            <div class="col-12 table-responsive">
                <table class="table table-bordered " ng-init="findAllRoles()">
                    <thead>
                    <tr>
                        <th >#</th>
                        <th >Nombre</th>
                        <th >Estado</th>
                        <th class="text-center" >Acciones</th>
                    </tr>
                    </thead>
                    <tbody >
                    <tr ng-repeat="rol in  arrayRoles | orderBy: 'status.name'">
                        <td ng-bind="$index + 1"></td>
                        <td ng-bind="rol.name"></td>
                        <td ng-bind="rol.status.name" ng-class="rol.status.name === 'Activo' ? 'text-succes' : 'text-danger'"></td>
                        <td class="text-center">
                            <button class="btn btn-outline-warning" ng-click="updateRolModal(rol)">Modificar</button>
                            <button class="btn btn-outline-danger" ng-click="deleteRolModal(rol)">Eliminar</button>
                            <button class="btn btn-outline-info" ng-click="detailsRolModal(rol)">Detalle</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>


    </div>
</main>

<footer>

</footer>

<%--Modales--%>
<%--Modal registro--%>


<%--Modal registro--%>


<%@include file="views/Components/Roles/Modal.jsp" %>
</body>
</html>