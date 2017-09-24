angular.module('webS').controller('HogarController',
    [ '$scope', '$rootScope', '$sce', '$uibModal', 'hogarService', '$location', HogarController ]);
function HogarController($scope,$rootScope, $sce, $uibModal, hogarService, $location) {
    $rootScope.idFamilia = 0;

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
        celular:false,
        fechaInicio:""
    };
    $scope.Planes =[{
        id_SolucionHabitacional:0,
        descripcion:"-TIPO DE PLAN A SOLICITAR-"
    }];
    $scope.Viviendas =[{
        id_SituacionInmueble:0,
        descripcion:"-SELECCIONE-"
    }];
    $scope.Localidades =[{
        id_Localidad:0,
        localidad:"-SELECCIONE UNA LOCALIDAD-"
    }];
    hogarService.loadCombos().then(function(resp) {
        datos = resp.data;
        cargarCombo($scope.Planes ,datos.solucionesHabitacionales);
        cargarCombo($scope.Viviendas ,datos.situacionesInmuebles);
        cargarCombo($scope.Localidades ,datos.localidades);
        $scope.Hogar.idVivienda = $scope.Viviendas[0].id_SituacionInmueble;
        $scope.Hogar.idPlan =$scope.Planes[0].id_SolucionHabitacional;
        $scope.Hogar.idLocalidad=$scope.Localidades[0].id_Localidad;
    }, function(respErr) {
        console.log(respErr);
        $scope.datos = [];
        $scope.opt.wait=false;
    });


    var cargarCombo = function(combo, coleccion){
        var resultado = [];
        coleccion.forEach(function(value) {
            combo.push(value);
        });
    };
    $scope.opt = {
        agregando: false,
        wait : true
    };
    //List no hace falta. O se van a listar todos los hogares alguna vez??

    $scope.crearHogar = function() {
        //Variables de Id para eñ Req de crear Hogar
        var telefonoId = -1;
        var direccionId = -1;
        valid = ejecutarValidaciones();
        if(valid)
        {
        //Variables para los Req de los Id
        var telefonoReq = {
    "celular":$scope.Hogar.celular,
    "numero":$scope.Hogar.telefono
        };
        var direccionReq = {
            "calle":$scope.Hogar.direccion.calle,
            "numero":$scope.Hogar.direccion.numero,
            "dpto":$scope.Hogar.direccion.pisoDepto,
            "barrio":$scope.Hogar.barrio,
            "latitud":"",
            "longitud":"",
            "localidad":{
                "id_Localidad":$scope.Hogar.idLocalidad
            }
        };
        var hogarReq = {
            "ingresoNetoFamiliar": 0,
            "tarjetaCredito": $scope.Hogar.tarjeta,
            "solucionHabitacional": {"id_SolucionHabitacional": $scope.Hogar.idPlan},
            "situacionInmueble": {"id_SituacionInmueble": $scope.Hogar.idVivienda},
            "direccion": direccionReq,
            "telefono": telefonoReq,
            "active": true,
            "antiguedadResidencia": getYears($scope.Hogar.fechaInicio)
        };                
        hogarService.add(hogarReq).then(function(resp) {

             $rootScope.idFamilia = resp.data.id_Familia;
             $rootScope.hogar = resp.data;
                $location.path('/requestJF');
            }, function(respErr) {
                console.log(respErr);
            });
        }

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
    var getYears =  function(fechaInicio) { // birthday is a date
        var ageDifMs = Date.now() - fechaInicio.getTime();
        var ageDate = new Date(ageDifMs); // miliseconds from epoch
        return Math.abs(ageDate.getUTCFullYear() - 1970);
    }

    var ejecutarValidaciones = function(){
        var result = true;
        if($scope.Hogar.idLocalidad == 0)
        {
            showNotification('Seleccione una localidad valida!', 'danger');
            result=false;
        }
        if($scope.Hogar.idPlan == 0)
        {
            showNotification('Seleccione un plan habitacional!', 'danger');
            result=false;
        }
        if($scope.Hogar.idVivienda == 0)
        {
            showNotification('Seleccione un tipo de vivienda valida!','danger');
            result=false;
        }
        if($scope.Hogar.direccion.calle =="")
        {
            showNotification('Se requiere agregar una Calle','danger');
            result=false;
        }
        if($scope.Hogar.direccion.numero =="")
        {
            showNotification('Se requiere ingresar un numero a la Calle','danger');
            result=false;
        }
        if($scope.Hogar.fechaInicio =="")
        {
            showNotification('Se requiere ingresar una fehca de Inicio de residencia','danger');
            result=false;
        }
        return result;
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


