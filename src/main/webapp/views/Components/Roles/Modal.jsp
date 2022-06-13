<%--
  Created by IntelliJ IDEA.
  User: CDS
  Date: 09/06/2022
  Time: 12:31 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
</head>
<body>

<div class="modal fade" id="registerRolModal" tabindex="-1" aria-labelledby="staticBackdropLabel"
     aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #388e3c;">
                <h5 class="modal-title" style="color: white;">Registrar Rol</h5>
                <button type="button" class="close text-white" data-dismiss="modal"
                        aria-label="Close">X
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class=" col-form-label">Nombre: <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" name="name"
                           ng-model="rol.name" required min="2" maxlength="45">
                </div>
                <div class="form-group" ng-init="findAllStatus()">
                    <label class="form-label">Estado: <span class="text-danger">*</span></label>
                    <select class="form-control" ng-options="status.name for status in arrayStatus track by status.id"
                            ng-model="rol.status" name="status" required>
                        <option value="">Seleccione:</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar
                    </button>
                    <button type="button" class="btn" style="background-color: #003049;color: white;"
                            ng-click="createRol()">Registrar
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="modifyRolModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #1565c0;">
                <h5 class="modal-title" style="color: white;">Modificar Rol</h5>
                <button type="button" class="close text-white" data-dismiss="modal"
                        aria-label="Close">X
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="col-form-label">Name</label>
                    <input type="text" class="form-control" name="name"
                           ng-model="updateRolData.name" aria-describedby="nameHelp" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Estado</label>
                    <select class="form-control" ng-model="updateRolData.status"
                            ng-options="status.name for status in arrayStatus track by status.id" name="detailsStatus" required>
                        <option value="">Seleccione:</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar
                    </button>
                    <button type="button" class="btn" style="background-color: #003049;color: white;"
                            ng-click="updateRol()">Modificar
                    </button>
                </div>

            </div>

        </div>
    </div>
</div>


<div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #1565c0;">
                <h5 class="modal-title" style="color: white;">Detalles de Rol</h5>
                <button type="button" class="close text-white" data-dismiss="modal"
                        aria-label="Close">X
                </button>
            </div>
            <div class="modal-body">

                <div class="form-group">
                    <label class="col-form-label">Nombre: <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="InputNamem" name="detailsName"
                           ng-model="detailRol.name" aria-describedby="nameHelp" ng-change="" disabled>
                </div>
                <div class="form-group" ng-init="findAllStatus()">
                    <label class="form-label">Estado: <span class="text-danger">*</span></label>
                    <select class="form-control"  ng-model="detailRol.status"
                             name="detailStatus" ng-options="status.name for status in arrayStatus track by status.id" disabled>
                    </select>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="deleteRolModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #1565c0;">
                <h5 class="modal-title" style="color: white;">Eliminar Rol</h5>
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
                            ng-click="deleteRolDb()">Si
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
