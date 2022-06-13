<%--
  Created by IntelliJ IDEA.
  User: CDS
  Date: 10/06/2022
  Time: 01:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>

<div class="modal fade" id="registerUserModal" tabindex="-1" aria-labelledby="staticBackdropLabel"
     aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #388e3c;">
                <h5 class="modal-title" style="color: white;" >Registrar un nuevo usuario</h5>
                <button type="button" class="close text-white" data-dismiss="modal"
                        aria-label="Close" >X</button>
            </div>
            <div class="modal-body" >
                <form>
                    <div class="row">
                        <div class="col-12">
                            <h4>Datos personales</h4>
                            <hr class="bg-primary" />
                            <div class="form-group">
                                <label>Nombre: <span class="text-danger">*</span></label>
                                <input class="form-control" type="text" placeholder="erick" ng-model="user.person.name" name="name" required min="2" maxlength="45" />
                            </div>

                            <div class="form-group">
                                <label>Primer apellido: <span class="text-danger">*</span></label>
                                <input class="form-control" type="text" placeholder="Mireles" ng-model="user.person.surname" name="surname" required min="2" maxlength="45" />
                            </div>

                            <div class="form-group">
                                <label>Segundo apellido: <span class="text-danger">*</span></label>
                                <input class="form-control" type="text" placeholder="Merchant" ng-model="user.person.lastname" name="lastname" min="2" maxlength="45" />
                            </div>

                            <div class="form-group">
                                <label>Teléfono: <span class="text-danger">*</span></label>
                                <input class="form-control" type="phone" placeholder="7773799346" ng-model="user.person.phone" name="phone" min="2" maxlength="11" />
                            </div>

                            <div class="form-group">
                                <label>Fecha de nacimiento: <span class="text-danger">*</span></label>
                                <input class="form-control" type="date" ng-model="user.person.birthday" name="birthday"/>
                            </div>
                            <h4>Datos del usuario</h4>
                            <hr class="bg-primary" />

                            <div class="form-group">
                                <label>Correo electrónico: <span class="text-danger">*</span></label>
                                <input class="form-control" type="email" placeholder="erickmireles@utez.edu.mx" ng-model="user.email" name="email" required />
                            </div>

                            <div class="form-group">
                                <label>Contraseña: <span class="text-danger">*</span></label>
                                <input class="form-control" type="password" placeholder="*******" ng-model="user.password" name="password" required />
                            </div>

                            <div class="form-group" ng-init="findAllStatus()">
                                <label>Estado: <span class="text-danger">*</span></label>
                                <select class="form-control" name="status" ng-model="user.status" ng-options="status.name for status in arrayStatus track by status.id" required>
                                    <option value="">Seleccione</option>
                                </select>
                            </div>

                            <h4>Asignación de roles</h4>
                            <hr class="bg-primary" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-md-6 table-responsive">
                            <table class="table table-hover" ng-init="findAllRoles()">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nombre</th>
                                    <th class="text-center">Asignar</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr ng-repeat="rol in arrayRoles | orderBy:'name'">
                                    <td ng-bind="$index + 1"></td>
                                    <td ng-bind="rol.name"></td>
                                    <td class="text-center">
                                        <button class="btn btn-outline-success" ng-click="selectRol(rol)"> > </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>


                        <div class="col-12 col-md-6 table-responsive">
                            <table class="table table-hover" ng-init="findAllRoles()">
                                <thead>
                                <tr>
                                    <th>Acciones</th>
                                    <th>Nombre</th>
                                    <th class="text-center">#</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr ng-repeat="rol in arrayRolesSelected | orderBy:'name'">
                                    <td class="text-center">
                                        <button class="btn btn-outline-danger" ng-click="deleteRol(rol)"> < </button>
                                    </td>
                                    <td ng-bind="rol.name"></td>
                                    <td ng-bind="$index + 1"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar
                    </button>
                    <button type="button" class="btn" style="background-color: #003049;color: white;"
                            ng-click="createUser()">Registrar
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="detailUserModal" tabindex="-1" aria-labelledby="staticBackdropLabel"
     aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #388e3c;">
                <h5 class="modal-title" style="color: white;" >Modificar usuario</h5>
                <button type="button" class="close text-white" data-dismiss="modal"
                        aria-label="Close" >X</button>
            </div>
            <div class="modal-body" >
                <form>
                    <div class="row">
                        <div class="col-12">
                            <h4>Datos personales</h4>
                            <hr class="bg-primary" />
                            <div class="form-group">
                                <label>Nombre: <span class="text-danger">*</span></label>
                                <input class="form-control" type="text" placeholder="erick" ng-model="detailUser.pname" name="name" required min="2" maxlength="45" disabled/>
                            </div>

                            <div class="form-group">
                                <label>Primer apellido: <span class="text-danger">*</span></label>
                                <input class="form-control" type="text" placeholder="Mireles" ng-model="detailUser.psurname" name="surname" required min="2" maxlength="45" disabled/>
                            </div>

                            <div class="form-group">
                                <label>Segundo apellido: <span class="text-danger">*</span></label>
                                <input class="form-control" type="text" placeholder="Merchant" ng-model="detailUser.plastname" name="lastname" min="2" maxlength="45" disabled/>
                            </div>

                            <div class="form-group">
                                <label>Teléfono: <span class="text-danger">*</span></label>
                                <input class="form-control" type="phone" placeholder="7773799346" ng-model="detailUser.pphone" name="phone" min="2" maxlength="11" disabled/>
                            </div>

                            <div class="form-group">
                                <label>Fecha de nacimiento: <span class="text-danger">*</span></label>
                                <input class="form-control" type="text" ng-model="detailUser.pbirthday" name="birthday" disabled/>
                            </div>
                            <h4>Datos del usuario</h4>
                            <hr class="bg-primary" />

                            <div class="form-group">
                                <label>Correo electrónico: <span class="text-danger">*</span></label>
                                <input class="form-control" type="email" placeholder="erickmireles@utez.edu.mx" ng-model="detailUser.uemail" name="email" required disabled/>
                            </div>

                            <div class="form-group">
                                <label>Contraseña: <span class="text-danger">*</span></label>
                                <input class="form-control" type="password" placeholder="*******" ng-model="detailUser.upassword" name="password" required disabled/>
                            </div>

                            <div class="form-group" ng-init="findAllStatus()">
                                <label>Estado: <span class="text-danger">*</span></label>
                                <select class="form-control" name="status" ng-model="detailUser.user_status_id" ng-options="status.name for status in arrayStatus track by status.id" required disabled>
                                    <option value="">Seleccione</option>
                                </select>
                            </div>

                            <h4>Asignación de roles</h4>
                            <hr class="bg-primary" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-md-6 table-responsive">
                            <table class="table table-hover" ng-init="findAllRoles()" disabled>
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nombre</th>
                                    <th class="text-center">Asignar</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr ng-repeat="rol in arrayRoles | orderBy:'name'">
                                    <td ng-bind="$index + 1"></td>
                                    <td ng-bind="rol.name"></td>
                                    <td class="text-center">
                                        <button class="btn btn-outline-success" ng-click="selectRol(rol)" disabled>  </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>


                        <div class="col-12 col-md-6 table-responsive">
                            <table class="table table-hover" ng-init="findAllRoles()" disabled>
                                <thead>
                                <tr>
                                    <th>Acciones</th>
                                    <th>Nombre</th>
                                    <th class="text-center">#</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr ng-repeat="rol in arrayRolesSelected | orderBy:'name'">
                                    <td class="text-center">
                                        <button class="btn btn-outline-danger" ng-click="deleteRol(rol)" disabled>  </button>
                                    </td>
                                    <td ng-bind="rol.name"></td>
                                    <td ng-bind="$index + 1"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="updateUserModal" tabindex="-1" aria-labelledby="staticBackdropLabel"
     aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #388e3c;">
                <h5 class="modal-title" style="color: white;" >Modificar usuario</h5>
                <button type="button" class="close text-white" data-dismiss="modal"
                        aria-label="Close" >X</button>
            </div>
            <div class="modal-body" >
                <form>
                    <div class="row">
                        <div class="col-12">
                            <h4>Datos personales</h4>
                            <hr class="bg-primary" />
                            <div class="form-group">
                                <label>Nombre: <span class="text-danger">*</span></label>
                                <input class="form-control" type="text" placeholder="erick" ng-model="updateuser.pname" name="name" required min="2" maxlength="45" />
                            </div>

                            <div class="form-group">
                                <label>Primer apellido: <span class="text-danger">*</span></label>
                                <input class="form-control" type="text" placeholder="Mireles" ng-model="updateuser.psurname" name="surname" required min="2" maxlength="45" />
                            </div>

                            <div class="form-group">
                                <label>Segundo apellido: <span class="text-danger">*</span></label>
                                <input class="form-control" type="text" placeholder="Merchant" ng-model="updateuser.plastname" name="lastname" min="2" maxlength="45" />
                            </div>

                            <div class="form-group">
                                <label>Teléfono: <span class="text-danger">*</span></label>
                                <input class="form-control" type="phone" placeholder="7773799346" ng-model="updateuser.pphone" name="phone" min="2" maxlength="11" />
                            </div>

                            <div class="form-group">
                                <label>Fecha de nacimiento: <span class="text-danger">*</span></label>
                                <input class="form-control" type="text" ng-model="updateuser.pbirthday" name="birthday" disabled/>
                            </div>
                            <h4>Datos del usuario</h4>
                            <hr class="bg-primary" />

                            <div class="form-group">
                                <label>Correo electrónico: <span class="text-danger">*</span></label>
                                <input class="form-control" type="email" placeholder="erickmireles@utez.edu.mx" ng-model="updateuser.uemail" name="email" required />
                            </div>

                            <div class="form-group">
                                <label>Contraseña: <span class="text-danger">*</span></label>
                                <input class="form-control" type="password" placeholder="*******" ng-model="updateuser.upassword" name="password" required />
                            </div>

                            <div class="form-group" ng-init="findAllStatus()">
                                <label>Estado: <span class="text-danger">*</span></label>
                                <select class="form-control" name="status" ng-model="updateuser.user_status_id" ng-options="status.name for status in arrayStatus track by status.id" required>
                                    <option value="">Seleccione</option>
                                </select>
                            </div>

                            <h4>Asignación de roles</h4>
                            <hr class="bg-primary" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-md-6 table-responsive">
                            <table class="table table-hover" ng-init="findAllRoles()">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nombre</th>
                                    <th class="text-center">Asignar</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr ng-repeat="rol in arrayRoles | orderBy:'name'">
                                    <td ng-bind="$index + 1"></td>
                                    <td ng-bind="rol.name"></td>
                                    <td class="text-center">
                                        <button class="btn btn-outline-success" ng-click="selectRol(rol)"> > </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>


                        <div class="col-12 col-md-6 table-responsive">
                            <table class="table table-hover" ng-init="findAllRoles()">
                                <thead>
                                <tr>
                                    <th>Acciones</th>
                                    <th>Nombre</th>
                                    <th class="text-center">#</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr ng-repeat="rol in arrayRolesSelected | orderBy:'name'">
                                    <td class="text-center">
                                        <button class="btn btn-outline-danger" ng-click="deleteRol(rol)"> < </button>
                                    </td>
                                    <td ng-bind="rol.name"></td>
                                    <td ng-bind="$index + 1"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar
                    </button>
                    <button type="button" class="btn" style="background-color: #003049;color: white;"
                            ng-click="updateUser()">Registrar
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="deleteUserModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #1565c0;">
                <h5 class="modal-title" style="color: white;">Eliminar Usuario</h5>
                <button type="button" class="close text-white" data-dismiss="modal"
                        aria-label="Close">X
                </button>
            </div>
            <div class="modal-body">

                <div class="form-group">
                    <h3>¿Seguro de eliminarlo?</h3>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No
                    </button>
                    <button type="button" class="btn btn-danger"
                            ng-click="deleteUser()">Si
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
