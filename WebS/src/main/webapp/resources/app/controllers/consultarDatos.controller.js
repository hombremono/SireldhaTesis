
angular.module('webS').controller('ConsultarDatosController',
    [ '$scope', '$sce', '$uibModal','$location', 'consultarDatosService', ConsultarDatosController ]);
function ConsultarDatosController($scope, $sce, $uibModal, $location, consultarDatosService) {

    $scope.buscando = false;
    $scope.codigoPersonal="";
    $scope.verPersona=false;
    $scope.resultadosBusqueda=[];
    $scope.buscarDatos = function(codigo){
        consultarDatosService.getDatos(codigo).then(function(resp){

        });
    };
    $scope.salir = function(){
        $scope.buscando = false;
        $scope.codigoPersonal="";
        $scope.verPersona=false;
        $scope.resultadosBusqueda=[];
        $location.path('/');
    };
    $scope.paginaInicial = function () {
        $location.path('/');
    };
    var showNotification = function(mensaje, tipo){
        $.notify({
            icon: "pe-7s-attention",
            message: mensaje
        },{
            type: tipo,
            timer: 4000,
            placement: {
                from: 'top',
                align: 'right'
            }
        });
    };

}