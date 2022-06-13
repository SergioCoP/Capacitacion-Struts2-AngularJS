<%--
  Created by IntelliJ IDEA.
  User: CDS
  Date: 10/06/2022
  Time: 01:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="CourseStruts" lang="es">
<head>
  <jsp:include page="/views/layout/head.jsp"/>
</head>
<body ng-controller="user">
<jsp:include page="/views/layout/navbar.jsp"/>
<div class="container-fluid">
  <div class="row">
      <div class="col-12">
        <h1 class="text-center text-md-left">Gestión de Usuarios</h1>
        <hr class="bg-primary">
      </div>
  </div>
        <div class="col-12 text-center text-md-right">
            <button class="btn btn-outline-success" data-toggle="modal" data-target="#registerUserModal">Registrar
            </button>
        </div>
</div>

<div class="container">
    <div class="col-12 table-responsive">
        <table class="table table-bordered " ng-init="findAllUsers()">
            <thead>
            <tr>
                <th >#</th>
                <th >Nombre</th>
                <th >Apellido Paterno</th>
                <th >Apellido Materno</th>
                <th >Correo</th>
                <th >Telefono</th>
                <th >Rol</th>
                <th >Estado</th>
                <th class="text-center" >Acciones</th>
            </tr>
            </thead>
            <tbody >
            <tr ng-repeat="user in arrayUsers | orderBy: 'idUser'">
                <td ng-bind="$index + 1"></td>
                <td ng-bind="user.pname"></td>
                <td ng-bind="user.psurname"></td>
                <td ng-bind="user.plastname"></td>
                <td ng-bind="user.uemail"></td>
                <td ng-bind="user.pphone"></td>
                <td ng-bind="user.rol.name"></td>
                <td ng-bind="user.user_status_id.id" ng-if="user.user_status_id.id === 1 ? 'Activo' : 'Inactivo'" ng.class="user.user_status_id.id === 1 ? 'text-success': 'text-danger'"></td>
                <td class="text-center">
                    <button class="btn btn-outline-warning" ng-click="updateUserModal(user)">Modificar</button>
                    <button class="btn btn-outline-danger" ng-click="deleteUserModal(user)">Eliminar</button>
                    <button class="btn btn-outline-info" ng-click="detailsUserModal(user)">Detalle</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="/views/Components/User/Modal.jsp"/>
</body>
</html>
