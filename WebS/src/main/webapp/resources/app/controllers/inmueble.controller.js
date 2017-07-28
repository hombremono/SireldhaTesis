/**
 * Created by fran_ on 13/6/2017.
 */
angular.module('webS').controller('InmuebleController',
    [ '$scope', '$sce', '$uibModal', 'inmuebleService', InmmuebleController ]);
function InmmuebleController($scope, $sce, $uibModal, inmuebleService ) {

    $scope.titulo = "Datos de Inmueble";
    $scope.inmueble = {
        id:"",
        idLocalidad:"",
        barrio:"",
        direccion:{
            calle:"",
            numero:"",
            pisoDepto:""
        },
        valorFiscal:"",
        superficie:"",
        edificado:false,
        estado:"",
        motivoNoPosee:"",
        alquiler:{
            cuota:"",
            inicio:"",
            fin:"",
        },
        sinInmueble:"",
        tipoPared:"",
        tipoTecho:"",
        TipoPiso:"",
        conexionAgua:"",
        procedenciaAgua:"",
        tipoBano:"",
        poseeCadena:"",
        banoCompartido:"",
        luz:false,
        tipoLuz:"",
        cocina:false,
        tipoCocina:"",
        cocinaAgua:"",
        cuartos:"",
        camas:"",
        zonaInsalubre:""
    };

//Variables para llenar las listas
    $scope.motivosFalta = [];
    $scope.tiposPared=[];
    $scope.tiposTecho=[];
    $scope.tiposPiso=[];
    $scope.conexionesAgua=[];
    $scope.procedenciasAgua=[];
    $scope.tiposBano=[];
    $scope.tiposLuz=[];
    $scope.tiposCocina=[];
    $scope.Localidades=[];
    var defaultOptions={
        Id:0,
        Descripcion:"-SELECCIONE-"
    };
    $scope.loadCollection = function(coleccion){
        var datosColeccion;
        //Llamo al servicio que me trae todos los datos
        coleccion.push(defaultOptions);
        coleccion.push(datosColeccion);
    };
    loadCollection($scope.motivosFalta);
    loadCollection($scope.tiposPared);
    loadCollection($scope.tiposPiso);
    loadCollection($scope.conexionesAgua);
    loadCollection($scope.tiposBano);
    loadCollection($scope.tiposLuz);
    loadCollection($scope.tiposCocina);
    loadCollection($scope.Localidades);
    

    $scope.opt = {
        agregando: false,
        wait : true,
        datosOK:false
    };

    $scope.cargarInmueble = function() {
        inmuebleService.add($scope.inmueble).then(function(resp) {
            $scope.cancelar();
            //Redirecciono
        }, function(respErr) {
            console.log(respErr);
        });
    };
    $scope.cancelar = function() {
        $scope.opt.agregando=false;
    };

    //UTILIDAD????
    $scope.elimianrInmueble = function(inmueble) {
        if(confirm("¿Esta seguro que desea ELIMINAR el inmueble seleccionado?")) {
            personaService.delete(inmueble.id).then(function(resp) {
                //Confirm?
            }, function(respErr) {
                console.log(respErr);
            });
        }

    };
}


