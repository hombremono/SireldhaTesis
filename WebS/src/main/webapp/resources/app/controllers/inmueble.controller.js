/**
 * Created by fran_ on 13/6/2017.
 */
angular.module('webS').controller('InmuebleController',
    [ '$scope', '$sce', '$uibModal', 'inmuebleService', InmmuebleController ]);
function InmmuebleController($scope, $sce, $uibModal, inmuebleService ) {

    $scope.titulo = "Datos de Inmueble";
    this.inmueble = {
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
    this.motivosFalta = [];
    this.tiposPared=[];
    this.tiposTecho=[];
    this.tiposPiso=[];
    this.conexionesAgua=[];
    this.procedenciasAgua=[];
    this.tiposBano=[];
    this.tiposLuz=[];
    this.tiposCocina=[];

    //TODO
    // /Agregar este metodo al Servicio
    inmuebleService.cargarLista(Lista).then(function(resp) {
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
        wait : true,
        datosOK:false
    };

//AGREGAR PERSON
    this.cargarInmueble = function() {
        inmuebleService.add(this.inmueble).then(function(resp) {
            this.cancelar();
            //Redirecciono
        }, function(respErr) {
            console.log(respErr);
        });
    };
    this.cancelar = function() {
        this.opt.agregando=false;
    };

    //UTILIDAD????
    this.elimianrInmueble = function(inmueble) {
        if(confirm("¿Esta seguro que desea ELIMINAR el inmueble seleccionado?")) {
            personaService.delete(inmueble.id).then(function(resp) {
                //Confirm?
            }, function(respErr) {
                console.log(respErr);
            });
        }

    };
}


