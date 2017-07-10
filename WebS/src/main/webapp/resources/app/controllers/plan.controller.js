/**
 * Created by fran_ on 12/6/2017.
 */
angular.module('webS').controller('PlanController',
    [ '$scope', '$sce', '$uibModal', 'planService', PlanController ]);
function PlanController($scope, $sce, $uibModal, planService) {
    $scope.titulo = "Planes de vivienda";
    $scope.plan = {
        id:"",
        Nombre:"",
        Descripcion:""
    };
    $scope.planes =[];


    //Agregando y wait van a servir para el loading.
    $scope.opt = {
        agregando: false,
        wait : true
    };
    var mapPlan = function (plan) {
        var tempPlan;
        tempPlan.id=plan.id;
        tempPlan.Nombre =plan.Nombre;
        tempPlan.Descripcion = plan.Descripcion;
        $scope.planes.push(tempPlan);
    };

    planService.list().then(function(resp) {
        $scope.opt.wait=false;
        resp.forEach(function(plan){
            mapPlan(plan);
        });
    }, function(respErr) {
        console.log(respErr);
        $scope.opt.wait=false;
    });
    $scope.agregar = function() {
        $scope.opt.agregando=true;
    }

    $scope.save = function() {
        planService.add($scope.plan).then(function(resp) {
            //Retorne el ID del PLAN NUEVO
                planService.get(resp.plan.id).then(function(resp) {
                    mapPlan(resp.plan);
                });
            $scope.cancelar();
        }, function(respErr) {
            console.log(respErr);
        });
    };
    $scope.cancelar = function() {
        $scope.plan = {
            id:"",
            Nombre:"",
            Descripcion:""
        };
        $scope.opt.agregando=false;
    }
    $scope.delete = function(plan) {
        if(confirm("¿Esta seguro que desea ELIMINAR el Plan Seleccionado?")) {
            planService.delete(plan.id).then(function(resp) {
                $scope.planes.forEach(function(item, idx) {
                    if (item.id === plan.id) {
                        $scope.planes.splice(idx,1);
                        return false;
                    }
                });
            }, function(respErr) {
                console.log(respErr);
            });
        }

    }


    $scope.guardar = function() {
        planService.update($scope.plan).then(function(resp) {
            $scope.planes.forEach(function(item, idx) {
                if (item.id === $scope.plan.id) {
                    angular.copy($scope.plan, $scope.planes[idx]);
                    return false;
                }
            });
            $scope.cancelar();
        }, function(respErr) {
            console.log(respErr);
            $scope.cancelar();
        });

    };


    $scope.agregarModal = function() {
        var modalInstance = $uibModal.open({
            animation: true,
            ariaLabelledBy: 'modal-title',
            ariaDescribedBy: 'modal-body',
            templateUrl: 'views/plan/agregarPlan.html',
            controller: 'AddPlanController',
            controllerAs: '$ctrl',
            size: 'lg',
            resolve: {
                instancia: function () {
                    return $scope.plan;
                }
            }
        });
        modalInstance.result.then(function (instancia) {
                if(instancia)
                    $scope.plan = instancia;
                $scope.save();
            }, function () {
                $scope.cancelar();
            }
        );
    }
}

angular.module('webS').controller('AddPlanController', function ($uibModalInstance, instancia) {
    var $ctrl = this;
    $ctrl.instancia = instancia;

    $ctrl.ok = function () {
        $uibModalInstance.close($ctrl.instancia);
    };
    $ctrl.cancel = function () {
        $uibModalInstance.dismiss();
    };
});


