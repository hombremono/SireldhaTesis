/**
 * Created by fran_ on 12/6/2017.
 */
angular.module('webS').controller('SolicitudController',
    [ '$scope', '$sce', '$uibModal', 'solicitudService', SolicitudController ]);
function SolicitudController($scope, $sce, $uibModal, solicitudService) {
    $scope.titulo = "Solicitud de Plan";
    this.solicitud = {
        id:"",
        Hogar:{
            idPlan:"",
            idVivienda:"",
            idLocalidad:"",
            barrio:"",
            direccion:{
                calle:"",
                numero:"",
                pisoDepto:""
            },
            telefono:"",
            celular:false,
            tarjeta:false,
            fechaInicio:""
        },
    };
    this.Solicitudes=[]; //No sirve. Cargar innesesarion
    //Cargar Hogar
    this.Planes =[];
    this.Viviendas =[];
    this.Localidades =[];



    //Agregando y wait van a servir para el loading.
    this.opt = {
        agregando: false,
        wait : true
    };

    // solicitudService.list().then(function(resp) {
    // }, function(respErr) {
    // });
    // $scope.agregar = function() {
    //     this.opt.agregando=true;
    // }

    this.save = function() {
        solicitudService.add(this.solicitud).then(function(resp) {
            //Redirecciono.
            this.cancelar();
        }, function(respErr) {
            console.log(respErr);
        });
    };
    this.cancelar = function() {
        this.solicitud = {
            id:"",
            Hogar:{
                idPlan:"",
                idVivienda:"",
                idLocalidad:"",
                barrio:"",
                direccion:{
                    calle:"",
                    numero:"",
                    pisoDepto:""
                },
                telefono:"",
                celular:false,
                tarjeta:false,
                fechaInicio:""
            },
        };
        this.opt.agregando=false;
    }
    // this.delete = function(solicitud) {
    //     if(confirm("¿Esta seguro que desea ELIMINAR la Solicitud Seleccionado?")) {
    //         solicitudService.delete(solicitud.id).then(function(resp) {
    //             this.solicitudes.forEach(function(item, idx) {
    //                 if (item.id === plan.id) {
    //                     this.solicitudes.splice(idx,1);
    //                     return false;
    //                 }
    //             });
    //         }, function(respErr) {
    //             console.log(respErr);
    //         });
    //     }
    //
    // }

    //Editar.
    this.guardar = function() {
        solicitudService.update(this.solicitud).then(function(resp) {
            this.cancelar();
            //Redireccionar,
        }, function(respErr) {
            console.log(respErr);
            this.cancelar();
        });

    };
}


