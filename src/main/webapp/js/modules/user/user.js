//Defiinición de un controller de angularjs
app.controller('user',['$scope','$http','$window',function ($scope,$http){
    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";

    $scope.arrayStatus = []
    $scope.arrayRoles = []
    $scope.arrayUsers = []
    $scope.arrayRolesSelected = []
    $scope.deleteRolData = []
    $scope.deleteUserData = []
    $scope.rol = {}
    $scope.user = {}

    $scope.findAllStatus = () =>{
        $http({
            method: 'POST',
            url: 'Course-Struts/findAllStatus'
        }).then(function(response){
            const {data: {listStatus}} = response;

            $scope.arrayStatus = listStatus
            //Se empleara ng-init para ejecutar metodos desde que se inicializa la app
        })
    }

    $scope.createRol = () =>{
        $http({
            method: 'POST',
                url: 'Course-Struts/createRol',
                data: `data=${angular.toJson($scope.rol)}`
        }).then((response)=>{
            $('#registerRolModal').modal('hide')
            console.log(response)
        })
    }

    $scope.findAllRoles = () =>{
        $http({
            method: 'POST',
            url: 'Course-Struts/findAllRoles'
        }).then(function(response){
            const {data: {listRoles}} = response;
            $scope.arrayRoles = listRoles
            console.log("roles en arrayRoles")
            console.log($scope.arrayRoles)
            //Se empleara ng-init para ejecutar metodos desde que se inicializa la app
        })
    }

    $scope.detailsRolModal = (rol) =>{
        $scope.detailRol = angular.copy(rol) //genera una referencia nueva, sin perjudicar el objeto original
        console.log("Detalles")
        console.log($scope.detailRol)
        $('#detailModal').modal('toggle')
    }

    $scope.updateRolModal = (rol) =>{
        $scope.updateRolData = angular.copy(rol) //genera una referencia nueva, sin perjudicar el objeto original
       console.log("Modificar rol")
        console.log($scope.updateRolData)
        $('#modifyRolModal').modal('toggle')
    }

    $scope.updateRol = () =>{
        console.log($scope.updateRolData)
        $http({
            method: 'POST',
            url: 'Course-Struts/updateRol',
            data: `data=${angular.toJson($scope.updateRolData)}`
        }).then((response)=>{
            $('#modifyRolModal').modal('hide')
            console.log(response)
        })
    }

        $scope.deleteRolModal = (rol) =>{
            $scope.deleteRolData = angular.copy(rol) //genera una referencia nueva, sin perjudicar el objeto original
            $('#deleteRolModal').modal('toggle')
        }
    $scope.deleteRolDb = () =>{
        console.log($scope.deleteRolData)
        $http({
            method: 'POST',
            url: 'Course-Struts/deleteRol',
            data: `data=${angular.toJson($scope.deleteRolData)}`
        }).then((response)=>{
            $('#deleteRolModal').modal('hide')
            console.log(response)
        })
    }

    //Actions for user
    $scope.selectRol=(rol)=>{
        $scope.arrayRolesSelected.push(rol)
        $scope.arrayRoles.split($scope.arrayRoles.indexOf(rol),1)
        console.log("Rol seleccionado:" + $scope.arrayRoles)
    }
    $scope.deleteRol=(rol)=>{
        $scope.arrayRoles.push(rol)
        $scope.arrayRolesSelected.splice($scope.arrayRolesSelected.indexOf(rol), 1)
        console.log("Roles designados:" + $scope.arrayRolesSelected)
    }

    $scope.createUser = () =>{
        $scope.user.roles = $scope.arrayRolesSelected
        console.log("Usuaerio",$scope.user)

        console.log($scope.user.roles.reduce((r,c)=> Object.assign(r,c),{}))
        $scope.userData = {
            pname: $scope.user.person.name,
            psurname:  $scope.user.person.surname,
            plastname: $scope.user.person.lastname,
            pbirthday: toSqlDatetime($scope.user.person.birthday),
            pphone: $scope.user.person.phone,
            uemail: $scope.user.email,
            upassword: $scope.user.password,
            user_status_id: $scope.user.status,
            rol: $scope.user.roles.reduce((r,c)=> Object.assign(r,c),{})}
        $http({
            method: 'POST',
            url: 'Course-Struts/createUser',
            data: `data=${angular.toJson($scope.userData)}`
        }).then((response)=>{
            $('#registerUserModal').modal('hide')
            console.log(response)
        })
    }

    $scope.updateUserModal = (user) =>{
        $scope.updateuser = angular.copy(user) //genera una referencia nueva, sin perjudicar el objeto original
        console.log("Modificar usuario")
        console.log($scope.updateuser)
        $('#updateUserModal').modal('toggle')
    }

    $scope.updateUser = () =>{
        console.log($scope.updateuser)
        $http({
            method: 'POST',
            url: 'Course-Struts/updateUser',
            data: `data=${angular.toJson($scope.updateuser)}`
        }).then((response)=>{
            $('#updateUserModal').modal('hide')
            console.log(response)
        })
    }

    $scope.detailsUserModal = (user) =>{
        $scope.detailUser = angular.copy(user) //genera una referencia nueva, sin perjudicar el objeto original
        $scope.arrayRolesSelected.push( $scope.detailUser.rol)
        console.log($scope.arrayRolesSelected)
        console.log("Detalles usuario")
        console.log($scope.detailUser)
        $('#detailUserModal').modal('toggle')
    }

    $scope.deleteUserModal = (user) =>{
        $scope.deleteUserData = angular.copy(user) //genera una referencia nueva, sin perjudicar el objeto original
        $('#deleteUserModal').modal('toggle')
    }
    $scope.deleteUser = () =>{
        console.log($scope.deleteUserData)
        $http({
            method: 'POST',
            url: 'Course-Struts/deleteUser',
            data: `data=${angular.toJson($scope.deleteUserData)}`
        }).then((response)=>{
            $('#deleteUserModal').modal('hide')
            console.log(response)
        })
    }



    $scope.findAllUsers = () =>{
        $http({
            method: 'POST',
            url: 'Course-Struts/findAllUsers'
        }).then(function(response){
            const {data: {listUsers}} = response;
            $scope.arrayUsers = listUsers
            console.log("Usuarios en arrayUsers")
            console.log($scope.arrayUsers)
            //Se empleara ng-init para ejecutar metodos desde que se inicializa la app
        })
    }

    const toSqlDatetime = (inputDate) => {
        const date = new Date(inputDate)
        const dateWithOffest = new Date(date.getTime() - (date.getTimezoneOffset() * 60000))
        return dateWithOffest
            .toISOString()
            .slice(0, 19)
            .replace('T', ' ')
    }
}])