/**
 * Created by fran_ on 13/6/2017.
 */

angular.module('webS').controller('LocalidadController',
    [ '$scope', '$sce', '$uibModal', 'localidadService', LocalidadController ]);
function LocalidadController($scope, $sce, $uibModal, localidadService) {
    $scope.titulo = "Localidades";
    $scope.localidad = {
        id:"",
        Nombre:""
    };
    $scope.localidad = this.localidad;
    $scope.localidades =[];


    //Agregando y wait van a servir para el loading.
    $scope.opt = {
        agregando: false,
        wait : true
    };
    var mapLocalidad = function (localidad) {
        var tempLocalidad;
        tempLocalidad.id=localidad.id;
        tempLocalidad.Nombre =localidad.Nombre;
        $scope.localidades.push(tempLocalidad);
    };

    localidadService.list().then(function(resp) {
        $scope.opt.wait=false;
        resp.forEach(function(localidad){
            mapLocalidad(localidad);
        });
    }, function(respErr) {
        console.log(respErr);
        $scope.opt.wait=false;
    });
    $scope.agregar = function() {
        $scope.opt.agregando=true;
    }

   /* $scope.save = function() {
        localidadService.add(this.localidad).then(function(resp) {
            //Retorne el ID de la LOCALIDAD NUEVA
            localidadService.get(resp.localidad.id).then(function(resp) {
                mapLocalidad(resp.localidad);
            });
            $scope.cancelar();
        }, function(respErr) {
            console.log(respErr);
        });
    };*/
    $scope.cancelar = function() {
        $scope.localidad = {
            id:"",
            Nombre:""
        };
        $scope.opt.agregando=false;
    }
    $scope.eliminarLocalidad = function(localidad) {
        if(confirm("¿Esta seguro que desea ELIMINAR la localidad seleccionada?")) {
            localidadService.delete(localidad.id).then(function(resp) {
                $scope.localidades.forEach(function(item, idx) {
                    if (item.id === localidad.id) {
                        $scope.localidades.splice(idx,1);
                        return false;
                    }
                });
            }, function(respErr) {
                console.log(respErr);
            });
        }

    }


    $scope.guardar = function() {
        localidadService.update($scope.localidad).then(function(resp) {
            $scope.localidades.forEach(function(item, idx) {
                if (item.id === $scope.localidad.id) {
                    angular.copy($scope.localidad, $scope.localidades[idx]);
                    return false;
                }
            });
            $scope.cancelar();
        }, function(respErr) {
            console.log(respErr);
            $scope.cancelar();
        });

    };


    $scope.agregarLocalidad = function() {
        var modalInstance = $uibModal.open({
            animation: true,
            ariaLabelledBy: 'modal-title',
            ariaDescribedBy: 'modal-body',
            templateUrl: 'views/plan/agregarLocalidad.html',
            controller: 'AddLocalidadController',
            controllerAs: '$ctrl',
            size: 'lg',
            resolve: {
                instancia: function () {
                    return $scope.localidad;
                }
            }
        });
        modalInstance.result.then(function (instancia) {
                if(instancia)
                    $scope.localidad = instancia;
                $scope.guardar();
            }, function () {
                $scope.cancelar();
            }
        );
    }
}

angular.module('webS').controller('AddLocalidadController', function ($uibModalInstance, instancia) {
    var $ctrl = this;
    $ctrl.instancia = instancia;

    $ctrl.ok = function () {
        $uibModalInstance.close($ctrl.instancia);
    };
    $ctrl.cancel = function () {
        $uibModalInstance.dismiss();
    };
});
