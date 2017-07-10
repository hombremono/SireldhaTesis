/**
 * Created by fran_ on 13/6/2017.
 */
angular.module('webS').controller('FamiliaController',
    [ '$scope', '$sce', '$uibModal', 'familiaService','personaService', FamiliaController ]);
function FamiliaController($scope, $sce, $uibModal, familiaService,personaService ) {

$scope.titulo = "Familia";
this.familia = {
    id:"",
    Apellido:"",
    JefeDeFamiliaDni:"",
    integrantes:[]
};
this.persona ={
    nombre:"",
    apellido:"",
    tipoDni:"",
    DNI:"",
    CUIL:"",
    nacimiento:"",
    sexo:"",
    estadoCivil:"",
    nacionalidad:"",
    estudios:"",
    profesion:"",
    capConstructiva:"",
    depLaboral:"",
    relacionJF:"",
    ingresoNeto:"",
    mail:"",
    telefono:"",
    jubilado:"",
    carnetJubilacion:"",
    discapacidad:""
};
this.jefeDeFamilia={
    nombre:"",
    apellido:"",
    tipoDni:"",
    DNI:"",
    CUIL:"",
    nacimiento:"",
    sexo:"",
    estadoCivil:"",
    nacionalidad:"",
    estudios:"",
    profesion:"",
    capConstructiva:"",
    depLaboral:"",
    ingresoNeto:"",
    mail:"",
    telefono:"",
    jubilado:"",
    carnetJubilacion:"",
    discapacidad:""
};
//Variables para llenar las listas
    this.tiposDni = [];
    this.sexos=[];
    this.estadosCiviles=[];
    this.nacionalidades=[];
    this.estudios=[];
    this.profesiones=[];
    this.capConstructivas=[];
    this.depLaborales=[];
    this.relacionJF=[];

    //TODO
    // /Agregar este metodo al Servicio
    familiaService.cargarLista(Lista).then(function(resp) {
        resp.ferEach(function (item) {
            Lista.push(persona);
        });
    },
        function(respErr) {
            console.log(respErr);
            $scope.opt.wait=false;
    });



//Agregando y wait van a servir para el loading.
this.opt = {
    agregando: false,
    wait : true
};
var resetPersona = function () {
    $scope.persona ={
        nombre:"",
        apellido:"",
        tipoDni:"",
        DNI:"",
        CUIL:"",
        nacimiento:"",
        sexo:"",
        estadoCivil:"",
        nacionalidad:"",
        estudios:"",
        profesion:"",
        capConstructiva:"",
        depLaboral:"",
        relacionJF:"",
        ingresoNeto:"",
        mail:"",
        telefono:"",
        jubilado:"",
        carnetJubilacion:"",
        discapacidad:""
    };
};

familiaService.list().then(function(resp) {
    $scope.opt.wait=false;
    resp.forEach(function(persona){
        $scope.familia.integrantes.push(persona);
    });
}, function(respErr) {
    console.log(respErr);
    $scope.opt.wait=false;
});
this.agregarIntegrante = function() {
    this.opt.agregando=true;
};

//AGREGAR PERSON
this.addPersona = function() {
    personaService.add($scope.persona).then(function(resp) {

        //Retorne el ID de la PERSONA NUEVA
        personaService.get(resp.persona.id).then(function(resp) {
            $scope.familia.integrantes.push(resp.persona);
        });

        this.cancelar();
    }, function(respErr) {
        console.log(respErr);
    });
};
this.cancelar = function() {
    resetPersona();
    this.opt.agregando=false;
};
this.eliminarIntegrante = function(persona) {
    if(confirm("¿Esta seguro que desea ELIMINAR al integrante seleccionado?")) {
        personaService.delete(persona.id).then(function(resp) {
            $scope.familia.integrantes.forEach(function(item, idx) {
                if (item.id === persona.id) {
                    $scope.familia.integrantes.splice(idx,1);
                    return false;
                }
            });
        }, function(respErr) {
            console.log(respErr);
        });
    }

};
this.guardarCambios = function() {
    familiaService.update($scope.familia).then(function(resp) {
        //QUE HACER? MOSTRAR CONFIRM?
        $scope.cancelar();
    }, function(respErr) {
        console.log(respErr);
        $scope.cancelar();
    });

};

// $scope.agregarIntegrante = function() {
//     var modalInstance = $uibModal.open({
//         animation: true,
//         ariaLabelledBy: 'modal-title',
//         ariaDescribedBy: 'modal-body',
//         templateUrl: 'views/plan/agregarLocalidad.html',
//         controller: 'AddLocalidadController',
//         controllerAs: '$ctrl',
//         size: 'lg',
//         resolve: {
//             instancia: function () {
//                 return $scope.localidad;
//             }
//         }
//     });
//     modalInstance.result.then(function (instancia) {
//             if(instancia)
//                 $scope.localidad = instancia;
//             $scope.save();
//         }, function () {
//             $scope.cancelar();
//         }
//     );
// }
}

