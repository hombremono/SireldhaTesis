angular.module('webS').controller('HogarController',
    [ '$scope', '$sce', '$uibModal', 'hogarService', HogarController ]);
function HogarController($scope, $sce, $uibModal, hogarService) {
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


    $scope.Planes=[];
    $scope.Viviendas=[];
    $scope.Localidades=[];

    loadCollection = function(coleccion){
        var datosColeccion;
        //Llamo al servicio que me trae todos los datos
        coleccion.push(defaultOptions);
        coleccion.push(datosColeccion);
    };

    loadCollection($scope.Planes);
    loadCollection($scope.Viviendas);
    loadCollection($scope.Localidades);
    
    $scope.opt = {
        agregando: false,
        wait : true
    };
    //List no hace falta. O se van a listar todos los hogares alguna vez??

    $scope.crearHogar = function() {
        hogarService.add($scope.Hogar).then(function(resp) {
                        
            $scope.cancelar();
            //Redireccion???
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
    //Tiene que estar. Cuando se trigerea??
    $scope.delete = function(Hogar) {
        if(confirm("¿Esta seguro que desea ELIMINAR el hogar seleccionado?")) {
            hogarService.delete(Hogar.id).then(function(resp) {
                $scope.cancelar();                
            }, function(respErr) {
                console.log(respErr);
            });
        }

    }    
}
