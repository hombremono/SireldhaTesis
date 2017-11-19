2/**
 * Created by fran_ on 12/6/2017.
 */
angular.module('webS').controller('PlanController',
    [ '$scope', '$sce', '$uibModal','$location', 'planService', PlanController ]);
function PlanController($scope, $sce, $uibModal, $location, planService) {
    $scope.titulo = "Planes de vivienda";
    $scope.Plan = {
        nombre:"",
        financiamiento:0,
        tipo:0
    };
    //Listas de Combos
    $scope.Financiamientos = [
        {
        id: 0,
        descripcion: "-SELECCIONE-"
        },
        {
            id: 1,
            descripcion: "NACIONAL"
        },
        {
            id: 2,
            descripcion: "PROVINCIAL"
        },
        {
            id: 3,
            descripcion: "MUNICIPAL"
        }

    ];
    $scope.Plan.financiamiento = $scope.Financiamientos[0].id;
    $scope.Tipos = [
        {
            id: 0,
            descripcion: "-SELECCIONE-"
        },
        {
            id: 1,
            descripcion: "TERRENO"
        },
        {
            id: 2,
            descripcion: "VIVIENDA NUEVA"
        },
        {
            id: 3,
            descripcion: "MEJORAMIENTO Y/O AMPLIACION"
        },
        {
            id: 4,
            descripcion: "REGULARIZACION"
        }
        ];
    $scope.Plan.tipo = $scope.Tipos[0].id;


    //Situaciones
    $scope.sitRegistro = {
        items:[]
    };
    $scope.sitHogar = {
        items:[]
    };

    //COMBOS
    $scope.comboSitHogar = {
        items: [
            {
                id: 0,
                descripcion: "-SELECCIONE-"
            },
            {
                id: 1,
                descripcion: "Antigüedad de la inscripción en el registro"
            },
            {
                id: 2,
                descripcion: "Documentación probatoria completa"
            }]
    };
    $scope.comboSitLocalidad = {
        items: [
            {
                id: 0,
                descripcion: "-SELECCIONE-"
            },
            {
                id: 1,
                descripcion: "Antigüedad de la inscripción en el registro"
            },
            {
                id: 2,
                descripcion: "Documentación probatoria completa"
            }]
    };
    $scope.comboSitEdadJefe = {
        items: [
            {
                id: 0,
                descripcion: "-SELECCIONE-"
            },
            {
                id: 1,
                descripcion: "Antigüedad de la inscripción en el registro"
            },
            {
                id: 2,
                descripcion: "Documentación probatoria completa"
            }]
    };
    $scope.comboSitCapCons = {
        items: [
            {
                id: 0,
                descripcion: "-SELECCIONE-"
            },
            {
                id: 1,
                descripcion: "Antigüedad de la inscripción en el registro"
            },
            {
                id: 2,
                descripcion: "Documentación probatoria completa"
            }]
    };
    $scope.comboSitRegistro = {
        items: [
            {
                id: 0,
                descripcion: "-SELECCIONE-"
            },
            {
                id: 1,
                descripcion: "Antigüedad de la inscripción en el registro"
            },
            {
                id: 2,
                descripcion: "Documentación probatoria completa"
            }]
    };
    $scope.temp ={
        item : $scope.comboSitRegistro.items[0].id,
        itemHogar: $scope.comboSitHogar.items[0].id,
        itemLocalidad: $scope.comboSitLocalidad.items[0].id,
        itemEdadJefe: $scope.comboSitEdadJefe.items[0].id,
        itemCapCons: $scope.comboSitCapCons.items[0].id,
    };

    //FUNCIONES
    $scope.addItem = function(id,coleccion,categoria,combo){
        combo.forEach(function (element, index) {
            if (element.id == id && element.id !=0) {
                var item={
                    categoria:categoria,
                    descripcion:element.descripcion,
                    puntaje:0
                };
                coleccion.push(item);
            }
        });



    };
    $scope.quitarItem = function(item,coleccion,combo){
        coleccion.forEach(function (element, index) {
            if (element == item) {
                coleccion.splice(element, 1);
            }
        });
    };
    $scope.addAll = function(combo,coleccion,categoria){
        combo.forEach(function (elemento, index) {
            if(elemento.id !=0){
                var item ={
                    categoria:categoria,
                    descripcion:elemento.descripcion,
                    puntaje:0
                };
                coleccion.push(item);
            }

        });

    };
    //Variables n' Stuff
    $scope.mostrarSitRegistro = true;
    $scope.mostarSitHogar =true;
}


/*
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

    $scope.save = function(plan) {
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
    $$scope.cancelar = function() {
        $scope.plan = {
            id:"",
            Nombre:"",
            Descripcion:""
        };
        $scope.opt.agregando=false;
    }
    $scope.eliminarPlan = function(plan) {
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

    $scope.volverInicio = function(){
        $location.path("/");
    };


    $scope.agregarPlan = function() {
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
                $scope.save(instancia);
            }, function () {
                $scope.cancelar();
            }
        );
    }/*
}


*/
