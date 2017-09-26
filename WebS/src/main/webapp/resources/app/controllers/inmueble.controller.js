angular.module('webS').controller('InmuebleController',
    [ '$scope', '$rootScope', '$sce', '$uibModal','$location', 'inmuebleService', InmuebleController ]);
function InmuebleController($scope,$rootScope, $sce, $uibModal, $location, inmuebleService ) {

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
        valorFiscal:0,
        superficie:0,
        edificado:false,
        estado:"",
        motivoNoPosee:"",
        alquiler:{
            cuota:"",
            inicio:"",
            fin:"",
        },
        sinInmueble:"",
        tipoPared:0,
        revoque:false,
        tipoTecho:0,
        cieloRazo:false,
        tipoPiso:0,
        agua:false,
        conexionAgua:0,
        procedenciaAgua:0,
        tipoBano:0,
        poseeCadena:false,
        banoCompartido:false,
        luz:false,
        tipoLuz:"",
        cocina:false,
        tipoCocina:0,
        cocinaAgua:false,
        cuartos:0,
        camas:0,
        zonaInsalubre:false,
        bano:false
    };
    $scope.datosOK = false;
    var idFamilia =$rootScope.idFamilia;

    //Carga de Opciones
    $scope.estados =[
        {
        id_Estado:0,
        Descripcion:"-SELECCIONE-"
        },
        {
            id_Estado:1,
            Descripcion:"Posee Inmueble"
        },
        {
            id_Estado:2,
            Descripcion:"No Posee Inmueble"
        }
    ];
    $scope.NoPosee =[
        {
        id_NoPosee:0,
        descripcion:"-SELECCIONE-"
        },
        {
            id_NoPosee:1,
            descripcion:"Ocupacion terreno fiscal"
        },
        {
            id_NoPosee:2,
            descripcion:"Ocupacion terreno privado"
        },
        {
            id_NoPosee:3,
            descripcion:"Inquilino - Arrendatario"
        },
        {
            id_NoPosee:4,
            descripcion:"Prestamo - Comodato del Estado"
        },
        {
            id_NoPosee:5,
            descripcion:"Prestamo - Comodato del Estado"
        },
        {
            id_NoPosee:6,
            descripcion:"Prestamo - Comodato por parte de un Pariente"
        },
        {
            id_NoPosee:7,
            descripcion:"No posee Inmueble"
        }
    ];

    //Variables para llenar las listas
        $scope.motivosFalta = [{
            id_MotivoCarecimiento:0,
            descripcion:"-SELECCIONE-"
        }];
        $scope.tiposPared=[{
            id_MaterialPared:0,
            descripcion:"-SELECCIONE-"
        }];
        $scope.tiposTecho=[{
            id_MaterialTecho:0,
            descripcion:"-SELECCIONE-"
        }];
        $scope.tiposPiso=[{
            id_MaterialPiso:0,
            descripcion:"-SELECCIONE-"
        }];
        $scope.conexionesAgua=[{
            id_PoseeAgua:0,
            descripcion:"-SELECCIONE-"
        }];
        $scope.procedenciasAgua=[{
            id_ProcedenciaAgua:0,
            descripcion:"-SELECCIONE-"
        }];
        $scope.tiposBano=[{
            id_tipobano:0,
            descripcion:"-SELECCIONE-"
        }];
        $scope.tiposLuz=[{
            id_PoseeLuz:0,
            descripcion:"-SELECCIONE-"
        }];
        $scope.tiposCocina=[{
            id_PoseeCocina:0,
            descripcion:"-SELECCIONE-"
        }];
        $scope.Localidades=[{
            id_Localidad:0,
            localidad:"-SELECCIONE-"
        }];
        var cargarCombo = function(combo, coleccion){
            var resultado = [];
            coleccion.forEach(function(value) {
                combo.push(value);
            });
        };
        var defaultCombos = function(){
            $scope.inmueble.sinInmueble = $scope.motivosFalta[0].id_MotivoCarecimiento;
            $scope.inmueble.tipoPared = $scope.tiposPared[0].id_MaterialPared;
            $scope.inmueble.tipoTecho = $scope.tiposTecho[0].id_MaterialTecho;
            $scope.inmueble.tipoPiso = $scope.tiposPiso[0].id_MaterialPiso;
            $scope.inmueble.conexionAgua = $scope.conexionesAgua[0].id_PoseeAgua;
            $scope.inmueble.procedenciaAgua = $scope.procedenciasAgua[0].id_ProcedenciaAgua;
            $scope.inmueble.tipoBano = $scope.tiposBano[0].id_tipobano;
            $scope.inmueble.tipoLuz = $scope.tiposLuz[0].id_PoseeLuz;
            $scope.inmueble.tipoCocina = $scope.tiposCocina[0].id_PoseeCocina;
            $scope.inmueble.idLocalidad = $scope.Localidades[0].id_Localidad;

            $scope.inmueble.estado = $scope.estados[0].id_Estado;
            $scope.inmueble.motivoNoPosee = $scope.NoPosee[0].id_NoPosee;


        };
        inmuebleService.loadCombosInmueble().then(function(resp) {
            datos = resp.data;
            cargarCombo($scope.motivosFalta,datos.listaMotivoCarecimiento);
            cargarCombo($scope.tiposPared,datos.listaMaterialPared);
            cargarCombo($scope.tiposTecho,datos.listaMaterialTecho);
            cargarCombo($scope.tiposPiso,datos.listaMaterialPiso);
            cargarCombo($scope.conexionesAgua,datos.listaPoseeAgua);
            cargarCombo($scope.procedenciasAgua,datos.listaProcedenciaAgua);
            cargarCombo($scope.tiposBano,datos.listaTipoBano);
            cargarCombo($scope.tiposLuz,datos.listaPoseeLuz);
            cargarCombo($scope.tiposCocina,datos.listaPoseeCocina);
            cargarCombo($scope.Localidades,datos.listaLocalidad);
            //Seteado de elemento 0
            defaultCombos();
        }, function(respErr) {
            console.log(respErr);
            $scope.datos = [];
            $scope.opt.wait=false;
        });

        $scope.opt = {
            agregando: false,
            wait : true,
            datosOK:false
        };
        var valid;
        $scope.cargarInmueble = function() {
            //Validaciones


            valid = ejecutarValidaciones();
            if(valid){

                var inmubleConexAgua = null;
                var inmuebleProdAgua = null;
                var inmuebleBano = null;
                var inmuebleCocina = null;
                var inmuebleLuz = null;
                if($scope.inmueble.agua){
                    inmubleConexAgua = {
                        "poseeAgua": {
                            "id_PoseeAgua": inmubleConexAgua,
                            "active": true
                        },
                        "procedenciaAgua": {
                            "id_ProcedenciaAgua": inmuebleProdAgua,
                            "active": true
                        },
                        "active": true
                    };
                }
                else{
                    inmubleConexAgua=null;
                }
                if($scope.inmueble.luz){
                    inmuebleLuz = {
                        "id_PoseeLuz": inmuebleLuz,
                        "active": true
                    };
                }
                else{
                    inmuebleLuz = null;
                }
                if($scope.inmueble.bano){
                    inmuebleBano =$scope.inmueble.tipoBano;
                }
                var reqInmueble ={
                    "cantidadHabitaciones": $scope.inmueble.cuartos,
                    "cantidadCamas": $scope.inmueble.camas,
                    "promiscuidad": false,
                    "familia": {
                        "id_Familia": idFamilia
                    },
                    "pared": {
                        "revoque": $scope.inmueble.revoque,
                        "active": true,
                        "tipoPared": {
                            "id_MaterialPared": $scope.inmueble.tipoPared,
                            "active": true
                        }
                    },
                    "techo": {
                        "cieloRazo": $scope.inmueble.cieloRazo,
                        "active": true,
                        "tipoTecho": {
                            "id_MaterialTecho": $scope.inmueble.tipoTecho,
                            "active": true
                        }
                    },
                    "poseeLuz":inmuebleLuz ,
                    "servicioAgua":inmubleConexAgua ,
                    "active": true,
                    "piso": {
                        "id_MaterialPiso": $scope.inmueble.tipoPiso,
                        "active": true
                    }
                };
            inmuebleService.add(reqInmueble).then(function(resp) {
                var idInmueble = resp.data.id_Inmueble;
                if($scope.inmueble.cocina && $scope.inmueble.bano)
                {
                    var reqCocina = {
                        "instalacionDeAgua": $scope.inmueble.cocinaAgua,
                        "tipoCocina": {
                        "id_TipoCocina": $scope.inmueble.tipoCocina,
                            "active": true
                    },
                        "active": true,
                        "inmueble": {
                        "id_Inmueble": idInmueble
                    }

                    };
                    inmuebleService.addCocina(reqCocina).then(function(resp) {
                            var reqBano = {
                            "descargaInodoro": $scope.inmueble.descargaInodoro,
                            "compartido": $scope.inmueble.banoCompartido,
                            "tipoBano": {
                            "id_tipobano": $scope.inmueble.tipoBano,
                                "active": true
                        },
                            "active": true,
                            "inmueble": {
                            "id_Inmueble": idInmueble
                        }

                            };
                            inmuebleService.addBano(reqBano).then(function (r) {
                                solicitudTerminada();

                            });

                    });

                }
                else if($scope.inmueble.cocina){
                    var reqCocina = {
                        "instalacionDeAgua": $scope.inmueble.cocinaAgua,
                        "tipoCocina": {
                            "id_TipoCocina": $scope.inmueble.tipoCocina,
                            "active": true
                        },
                        "active": true,
                        "inmueble": {
                            "id_Inmueble": idInmueble
                        }

                    };
                    inmuebleService.addCocina(reqCocina).then(function(resp) {
                        solicitudTerminada();
                    });
                }
                else if($scope.inmueble.bano){
                    var reqBano = {
                        "descargaInodoro": $scope.inmueble.descargaInodoro,
                        "compartido": $scope.inmueble.banoCompartido,
                        "tipoBano": {
                            "id_tipobano": $scope.inmueble.tipoBano,
                            "active": true
                        },
                        "active": true,
                        "inmueble": {
                            "id_Inmueble": idInmueble
                        }

                    };
                    inmuebleService.addBano(reqBano).then(function (r) {
                        solicitudTerminada();

                    });
                }
                else{
                    solicitudTerminada();
                }
            }, function(respErr) {
                console.log(respErr);
            });
            }
        };
        $scope.cancelar = function() {
            $scope.opt.agregando=false;
        };
        $scope.cargarEstado = function(){
            $scope.datosOK  = verificarPosesion();
        };
        $scope.verificarPosesion = function(){
            var result = true;
            if($scope.inmueble.estado == 0)
            {
                showNotification('Seleccione si el hogar posee o no un inmueble', 'danger');
                result=false;
            }
            if($scope.inmueble.estado == 2 && $scope.inmueble.motivoNoPosee == 0)
            {
                showNotification('Seleccione un motivo de falta de inmueble ', 'danger');
                result=false;
            }
            if($scope.inmueble.motivoNoPosee == 7 && $scope.inmueble.sinInmueble ==0)
            {
                showNotification('Seleccione por que el hogar carece de inmueble', 'danger');
                result=false;
            }
            if(result){
                /*REVISARLO PARA USAR LOS CHECKS. MUCHO MAS SENCILLO.*/
                if($scope.inmueble.estado == 1){
                    var addressInput = document.getElementById('adress-inmueble').value;
                    var geocoder = new google.maps.Geocoder();

                    geocoder.geocode({address: addressInput}, function(results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            var myResult = results[0].geometry.location; // reference LatLng value
                            var num = Number(results[0].address_components[0].long_name);
                            var calle =results[0].address_components[1].long_name;
                            var lat =results[0].geometry.location.lat();
                            var lng =results[0].geometry.location.lng();
                            var reqTerreno = {
                                "valorFiscal":$scope.inmueble.valorFiscal,
                                "superficie":$scope.inmueble.superficie,
                                "familia":{
                                    "id_Familia":$rootScope.idFamilia
                                },
                                "direccion":{
                                    "calle": calle,
                                    "numero": num,
                                    "dpto": "",
                                    "barrio": $scope.inmueble.barrio,
                                    "latitud": lat,
                                    "longitud": lng,
                                    "localidad": {
                                        "id_Localidad": $scope.inmueble.idLocalidad
                                    }
                                },
                                "edificacion":$scope.inmueble.edificado
                            };
                            debugger;
                            inmuebleService.addTerreno(reqTerreno).then(function(resp){

                                $scope.datosOK = true;
                            });
                        }
                    });

                }
                if($scope.inmueble.estado == 2){
                    if($scope.inmueble.motivoNoPosee!=3 && $scope.inmueble.motivoNoPosee!=7)
                    {
                        var terrenoFiscal = ($scope.inmueble.motivoNoPosee==1);
                        var terrenoPrivado = ($scope.inmueble.motivoNoPosee==2);
                        var comoEstado = ($scope.inmueble.motivoNoPosee==4);
                        var comoTrabajo = ($scope.inmueble.motivoNoPosee==5);
                        var comoPariente = ($scope.inmueble.motivoNoPosee==6);
                        var reqSinInmueble = {
                            "ocupacionTerrenoFiscal": terrenoFiscal,
                            "ocupacionTerrenoPrivado": terrenoPrivado,
                            "comodatoEstado": comoEstado,
                            "comodatoTrabajo": comoTrabajo,
                            "comodatoPariente": comoPariente
                        };
                        inmuebleService.addSinInmueble(reqSinInmueble).then(function(resp){
                            $scope.datosOK = true;
                        });
                    }
                    else if($scope.inmueble.motivoNoPosee==3){
                        var reqAlquiler= {
                                "monto": $scope.inmueble.alquiler.cuota,
                                "fechaDesde": $scope.inmueble.alquiler.inicio,
                                "fechaHaSta": $scope.inmueble.alquiler.fin,
                                "familia": {
                                    "id_Familia": $rootScope.idFamilia
                                }
                            };
                            inmuebleService.addAlquiler(reqAlquiler).then(function(resp){
                                $scope.datosOK = true;
                            });
                        }
                    else if($scope.inmueble.motivoNoPosee==7){
                        var reqCarece = {
                            "familia": {
                                "id_Familia": $rootScope.idFamilia
                            },
                            "motivoCarecimiento": {
                                "id_MotivoCarecimiento": $scope.inmueble.sinInmueble
                            }
                        };
                        inmuebleService.addCareceInmueble(reqCarece).then(function(resp){
                            $scope.datosOK = true;
                        });
                    }
                }
            }
        };
        var ejecutarValidaciones = function(){
            var result = true;
            if($scope.inmueble.tipoPared == 0)
            {
                showNotification('Seleccione un tipo de PARED!', 'danger');
                result=false;
            }
            if($scope.inmueble.tipoPiso == 0)
            {
                showNotification('Seleccione un tipo de PISO!', 'danger');
                result=false;
            }
            if($scope.inmueble.tipoTecho == 0)
            {
                showNotification('Seleccione un tipo de TECHO!', 'danger');
                result=false;
            }

            if($scope.inmueble.agua && $scope.inmueble.procedenciaAgua == 0)
            {
                showNotification('Seleccione la prodecedencia del AGUA del inmueble', 'danger');
                result=false;
            }
            if($scope.inmueble.agua && $scope.inmueble.conexionAgua == 0)
            {
                showNotification('Seleccione el tipo de conexion de AGUA del inmueble!', 'danger');
                result=false;
            }
            if($scope.inmueble.cocina && $scope.inmueble.tipoCocina == 0)
            {
                showNotification('Seleccione el tipo de la COCINA!', 'danger');
                result=false;
            }
            if($scope.inmueble.cuartos == "")
            {
                showNotification('Ingrese una cantidad de CUARTOS valida!', 'danger');
                result=false;
            }
            if($scope.inmueble.camas == "")
            {
                showNotification('Ingrese una cantidad de CAMAS valida!', 'danger');
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
        var solicitudTerminada = function(nombre){
        $.notify({
            icon: "pe-7s-smile",
            message: 'Solicitud cargada con Exito!'

        },{
            type: 'success',
            timer: 4000,
            placement: {
                from: 'top',
                align: 'right'
            }
        });
        $location.path('/');
    };
}


