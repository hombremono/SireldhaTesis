angular.module('webS').controller('HogarController',
    [ '$scope', '$sce', '$uibModal', 'hogarService', '$location', HogarController ]);
function HogarController($scope, $sce, $uibModal, hogarService, $location) {
    debugger;

    $scope.titulo = "Carga de Hogar";
    $scope.Hogar = {
        id:"",
        idPlan:"",
        idVivienda:"",
        idLocalidad:"",
        barrio:"",
        direccion:{
            calle:"",
            numero:"",
            pisoDepto:"",
        },
        telefono:"",
        tarjeta:false,
        fechaInicio:""
    };
    //Listas de datos
    var defaultOptions={
        Id:0,
        Descripcion:"-SELECCIONE-"
    };
    hogarService.loadCombos().then(function(resp) {
        debugger;


        datos = resp.data;
        $scope.Planes = datos.solucionesHabitacionales;
        $scope.Viviendas = datos.situacionesInmuebles;
        $scope.Localidades = datos.localidades;

    }, function(respErr) {
        console.log(respErr);
        $scope.datos = [];
        $scope.opt.wait=false;
    });


    $scope.opt = {
        agregando: false,
        wait : true
    };
    //List no hace falta. O se van a listar todos los hogares alguna vez??

    $scope.crearHogar = function() {
        hogarService.add($scope.Hogar).then(function(resp) {

            $scope.cancelar();
            $location.path('/requestJF');
        }, function(respErr) {
            console.log(respErr);
        });
    };
    $scope.cancelar = function() {
        $scope.Hogar = {
            id:"",
            idPlan:"",
            idVivienda:"",
            idLocalidad:"",
            barrio:"",
            direccion:{
                calle:"",
                numero:"",
                pisoDepto:"",
            },
            telefono:"",
            tarjeta:false,
            fechaInicio:""
        };
        $scope.opt.agregando=false;
    }

    $scope.delete = function(Hogar) {
        if(confirm("¿Esta seguro que desea ELIMINAR el hogar seleccionado?")) {
            hogarService.delete(Hogar.id).then(function(resp) {
                $scope.cancelar();
            }, function(respErr) {
                console.log(respErr);
            });
        }

    };
}
