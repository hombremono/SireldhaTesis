
angular.module('webS').controller('ConsultarDatosController',
    [ '$scope', '$sce', '$uibModal','$location', 'familiaService', ConsultarDatosController ]);
function ConsultarDatosController($scope, $sce, $uibModal, $location, familiaService) {

    $scope.buscando = false;
    $scope.codigoPersonal="";
    $scope.seePerson=false;
    $scope.resultadosBusqueda=[];
    $scope.datosHabitacionales={
        "solucion":"",
        "direccion":"",
        "telefono":"",
        "situacionInmueble":""
    };
    $scope.persona={
        "nombre":"",
        "apellido" :"",
        "nroDocumento":"",
        "nroCuil":"",
        "fechaNacimiento":"",
        "sexo":{"sexo":""},
        "estadoCivil":{"estadoCivil":""},
        "nacionalidad":{"descripcion":""},
        "rolFamiliar":{"rolFamiliar":""},
        "estudios":{"estudios":""},
        "profesion":{"profesion":""},
        "situacionLaboral":{"dependenciaLaboral":""}
    };
    $scope.buscarDatos = function(codigoPersonal){
        familiaService.getDatos(codigoPersonal).then(function(resp){
            $scope.datosHabitacionales.solucion=resp.data.solucionHabitacional.descripcion;
            $scope.datosHabitacionales.direccion = resp.data.direccion.calle+' '+resp.data.direccion.numero;
            $scope.datosHabitacionales.telefono = resp.data.telefono.numero;
            $scope.datosHabitacionales.situacionInmueble = resp.data.situacionInmueble.descripcion;
            familiaService.getIntegrantes(resp.data.id_Familia).then(function(res){
                $scope.resultadosBusqueda=res.data;
                $scope.buscando = true;
            })
        });
    };
    $scope.salir = function(){
        $scope.buscando = false;
        $scope.codigoPersonal="";
        $scope.seePerson=false;
        $scope.resultadosBusqueda=[];
        $location.path('/');
    };
    $scope.paginaInicial = function () {
        $location.path('/');
    };
    $scope.verPersona=function(integrante){
        $scope.persona = integrante;
        var fec=new Date(integrante.fechaNacimiento);
        $scope.persona.fechaNacimiento = fec.toLocaleDateString();
        $scope.seePerson=true;
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