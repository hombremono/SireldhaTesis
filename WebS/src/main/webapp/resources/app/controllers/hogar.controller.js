angular.module('webS').controller('HogarController',
    [ '$scope', '$rootScope', '$sce', '$uibModal', 'hogarService', '$location', HogarController ]);
function HogarController($scope,$rootScope, $sce, $uibModal, hogarService, $location) {


    $rootScope.idFamilia = 0;

    $scope.titulo = "Carga de Hogar";
    $scope.Hogar = {
        id: "",
        idPlan: "",
        idVivienda: "",
        idLocalidad: "",
        barrio: "",
        direccion: {
            calle: "",
            numero: "",
            pisoDepto: "",
        },
        telefono: "",
        tarjeta: false,
        celular: false,
        fechaInicio: "",
        direccionFull:""
    };
    $scope.Planes = [{
        id_SolucionHabitacional: 0,
        descripcion: "-TIPO DE PLAN A SOLICITAR-"
    }];
    $scope.Viviendas = [{
        id_SituacionInmueble: 0,
        descripcion: "-SELECCIONE-"
    }];
    $scope.Localidades = [{
        id_Localidad: 0,
        localidad: "-SELECCIONE UNA LOCALIDAD-"
    }];
    hogarService.loadCombos().then(function (resp) {
        datos = resp.data;
        cargarCombo($scope.Planes, datos.solucionesHabitacionales);
        //cargarCombo($scope.Viviendas, datos.situacionesInmuebles);
        cargarCombo($scope.Localidades, datos.localidades);
        $scope.Hogar.idVivienda = $scope.Viviendas[0].id_SituacionInmueble;
        $scope.Hogar.idPlan = $scope.Planes[0].id_SolucionHabitacional;
        $scope.Hogar.idLocalidad = $scope.Localidades[0].id_Localidad;
    }, function (respErr) {
        console.log(respErr);
        $scope.datos = [];
        $scope.opt.wait = false;
    });
    $scope.actualizarVivienda = function(planId,planes){
      if(planId == 0){
          $scope.Viviendas = [{
              id_SituacionInmueble: 0,
              descripcion: "-SELECCIONE-"
          }];
      }
      else{
          $scope.Viviendas = [{
              id_SituacionInmueble: 0,
              descripcion: "-SELECCIONE-"
          }];
          planes.forEach(function (item) {
              if(item.id_SolucionHabitacional == planId){
                  cargarCombo($scope.Viviendas, item.situacionInmuebleList);
              }
                  });
      }

    };


    var cargarCombo = function (combo, coleccion) {
        var resultado = [];
        coleccion.forEach(function (value) {
            combo.push(value);
        });
    };
    $scope.opt = {
        agregando: false,
        wait: true
    };
    //List no hace falta. O se van a listar todos los hogares alguna vez??

    $scope.crearHogar = function () {

        //Variables de Id para eñ Req de crear Hogar
        var telefonoId = -1;
        var direccionId = -1;
        ejecutarValidaciones();

    };
    $scope.cancelar = function () {
        $scope.Hogar = {
            id: "",
            idPlan: "",
            idVivienda: "",
            idLocalidad: "",
            barrio: "",
            direccion: {
                calle: "",
                numero: "",
                pisoDepto: "",
            },
            telefono: "",
            tarjeta: false,
            fechaInicio: ""
        };
        $scope.opt.agregando = false;
    }

    $scope.delete = function (Hogar) {
        if (confirm("¿Esta seguro que desea ELIMINAR el hogar seleccionado?")) {
            hogarService.delete(Hogar.id).then(function (resp) {
                $scope.cancelar();
            }, function (respErr) {
                console.log(respErr);
            });
        }

    };
    var getYears = function (fechaInicio) { // birthday is a date
        var ageDifMs = Date.now() - fechaInicio.getTime();
        var ageDate = new Date(ageDifMs); // miliseconds from epoch
        return Math.abs(ageDate.getUTCFullYear() - 1970);
    }

    var ejecutarValidaciones = function () {
        var result = true;
        getCoordenadas().then(function () {

        }, function (err) {
            return false;
        });

        };

    var showNotification = function (mensaje, tipo) {
        $.notify({
            icon: "pe-7s-attention",
            message: mensaje

        }, {
            type: tipo,
            timer: 4000,
            placement: {
                from: 'top',
                align: 'right'
            }
        });
    };

    //---------MAPS
    var getCoordenadas = function () {
            var deferred = $.Deferred();
        var result = true;
            var addressInput = document.getElementById('adress-hogar').value;
        var reN = new RegExp("^[0-9]*$");
        var reL = new RegExp("^[a-zA-Z, ]*$");
        if ((reN.test(addressInput))||(reL.test(addressInput))) {
            showNotification('Ingrese una dirección valida!', 'danger');
            result = false;
        }
            var geocoder = new google.maps.Geocoder();


            geocoder.geocode({address: addressInput}, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var myResult = results[0].geometry.location; // reference LatLng value
                    if(isNaN(results[0].address_components[0].long_name)){
                        var direccion = addressInput.substr(0,addressInput.indexOf(','));
                        var partes = direccion.split(/[\s,]+/);
                        var numero =partes [partes .length-1];
                        $scope.Hogar.direccion.numero = Number(numero);
                        $scope.Hogar.direccion.calle =results[0].address_components[0].long_name;

                    }else{
                        $scope.Hogar.direccion.numero = Number(results[0].address_components[0].long_name);
                        $scope.Hogar.direccion.calle =results[0].address_components[1].long_name;
                    }
                    $scope.Hogar.direccion.latitud =results[0].geometry.location.lat();
                    $scope.Hogar.direccion.longitud =results[0].geometry.location.lng();
                    if ($scope.Hogar.idLocalidad == 0) {
                        showNotification('Seleccione una localidad valida!', 'danger');
                        result = false;
                    }
                    if ($scope.Hogar.idPlan == 0) {
                        showNotification('Seleccione un plan habitacional!', 'danger');
                        result = false;
                    }
                    if ($scope.Hogar.idVivienda == 0) {
                        showNotification('Seleccione un tipo de vivienda valida!', 'danger');
                        result = false;
                    }
                    if ($scope.Hogar.direccionFull == "") {
                        showNotification('Se requiere agregar una Direccion', 'danger');
                        result = false;
                    }
                    if ($scope.Hogar.fechaInicio == "" || ($scope.Hogar.fechaInicio.getFullYear() > 10000)) {
                        showNotification('Ingrese una fecha de Inicio de residencia valida', 'danger');
                        result = false;
                    }

                    if(result){
                        var telefonoReq;
                        //Variables para los Req de los Id
                        if($scope.Hogar.telefono){
                            telefonoReq = {
                                "celular": $scope.Hogar.celular,
                                "numero": $scope.Hogar.telefono
                            };
                        }
                        else {
                            telefonoReq = null;
                        };

                        var direccionReq = {
                            "calle": $scope.Hogar.direccion.calle,
                            "numero": $scope.Hogar.direccion.numero,
                            "dpto": $scope.Hogar.direccion.pisoDepto,
                            "barrio": $scope.Hogar.barrio,
                            "latitud": $scope.Hogar.direccion.latitud,
                            "longitud": $scope.Hogar.direccion.longitud,
                            "localidad": {
                                "id_Localidad": $scope.Hogar.idLocalidad
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
                        $rootScope.hogar = hogarReq;
                        document.getElementById("btnHogar").disabled = true;
                        hogarService.add(hogarReq).then(function (resp) {
                            document.getElementById("btnHogar").disabled = false;
                            $rootScope.idFamilia = resp.data.id_Familia;
                            $rootScope.hogar.id_Familia = resp.data.id_Familia;

                            $location.path('/requestJF');
                        }, function (respErr) {
                            console.log(respErr);
                        });

                    }
                    deferred.resolve(true);
                }
                else{
                    deferred.reject(false);
                }
            });
        return deferred.promise();
    }

}


