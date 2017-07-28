/**
 * Created by fran_ on 13/6/2017.
 */
angular.module('webS').controller('FamiliaController',
    [ '$scope', '$sce', '$uibModal', 'familiaService','personaService','jefeFamiliaService', FamiliaController ]);
function FamiliaController($scope, $sce, $uibModal, familiaService,personaService, jefeFamiliaService ) {

    $scope.titulo = "Familia";
    $scope.familia = {
        id: "",
        Apellido: "",
        JefeDeFamiliaDni: "",
        integrantes: []
    };
    $scope.persona = {
        nombre: "",
        apellido: "",
        tipoDni: "",
        DNI: "",
        CUIL: "",
        nacimiento: "",
        sexo: "",
        estadoCivil: "",
        nacionalidad: "",
        estudios: "",
        profesion: "",
        capConstructiva: "",
        depLaboral: "",
        relacionJF: "",
        DescRelacionJF: "",
        ingresoNeto: "",
        mail: "",
        telefono: "",
        jubilado: "",
        carnetJubilacion: "",
        discapacidad: ""
    };
    $scope.jefeDeFamilia = {
        nombre: "",
        apellido: "",
        tipoDni: "",
        DNI: "",
        CUIL: "",
        nacimiento: "",
        sexo: "",
        estadoCivil: "",
        nacionalidad: "",
        estudios: "",
        profesion: "",
        capConstructiva: "",
        depLaboral: "",
        ingresoNeto: "",
        mail: "",
        telefono: "",
        jubilado: "",
        relacionJF: 99,
        DescRelacionJF: "Jefe/a de Familia",
        carnetJubilacion: "",
        discapacidad: ""
    };

    $scope.defaultOptions = {
        Id: 0,
        Descripcion: "-SELECCIONE-"
    };
//Variables para llenar las listas
    $scope.tiposDni = [];
    $scope.sexos = [];
    $scope.estadosCiviles = [];
    $scope.nacionalidades = [];
    $scope.estudios = [];
    $scope.profesiones = [];
    $scope.capConstructivas = [];
    $scope.depLaborales = [];
    $scope.relacionJF = [];


    loadCollection = function (coleccion) {
        var datosColeccion;
        //Llamo al servicio que me trae todos los datos
        coleccion.push($scope.defaultOptions);
        coleccion.push(datosColeccion);
    };

    loadCollection($scope.tiposDni);
    loadCollection($scope.sexos);
    loadCollection($scope.estadosCiviles);
    loadCollection($scope.nacionalidades);
    loadCollection($scope.estudios);
    loadCollection($scope.profesiones);
    loadCollection($scope.capConstructivas);
    loadCollection($scope.depLaborales);
    loadCollection($scope.relacionJF);


//Agregando y wait van a servir para el loading.
    $scope.opt = {
        agregando: false,
        editando: false,
        wait: true
    };
    var resetPersona = function () {
        $scope.persona = {
            nombre: "",
            apellido: "",
            tipoDni: "",
            DNI: "",
            CUIL: "",
            nacimiento: "",
            sexo: "",
            estadoCivil: "",
            nacionalidad: "",
            estudios: "",
            profesion: "",
            capConstructiva: "",
            depLaboral: "",
            relacionJF: "",
            ingresoNeto: "",
            mail: "",
            telefono: "",
            jubilado: "",
            carnetJubilacion: "",
            discapacidad: ""
        };
    };

    $scope.listarFamilia = function () {
        familiaService.list().then(function (resp) {
            $scope.opt.wait = false;
            resp.personas.forEach(function (persona) {
                $scope.familia.integrantes.push(persona);
            });
        }, function (respErr) {
            console.log(respErr);
            $scope.opt.wait = false;
        });
        $scope.agregarIntegrante = function () {
            $scope.opt.agregando = true;
            $scope.opt.editando = false;
        };
    }

//AGREGAR PERSON
    $scope.addPersona = function (persona) {
        personaService.add(persona).then(function (resp) {
            //Retorne el ID de la PERSONA NUEVA
            personaService.get(resp.persona.id).then(function (resp) {
                $scope.familia.integrantes.push(resp.persona);
            });
            $scope.cancelar();
        }, function (respErr) {
            console.log(respErr);
        });
    };
    $scope.cancelar = function () {
        resetPersona();
        this.opt.agregando = false;
    };
    $scope.eliminarIntegrante = function (persona) {
        if (confirm("¿Esta seguro que desea ELIMINAR al integrante seleccionado?")) {
            personaService.delete(persona.id).then(function (resp) {
                $scope.familia.integrantes.forEach(function (item, idx) {
                    if (item.id === persona.id) {
                        $scope.familia.integrantes.splice(idx, 1);
                        return false;
                    }
                });
            }, function (respErr) {
                console.log(respErr);
            });
        }

    };
    $scope.guardarCambios = function () {
        familiaService.update($scope.familia).then(function (resp) {
            $scope.cancelar();
            //Redireccionar
        }, function (respErr) {
            console.log(respErr);
            $scope.cancelar();
        });

    };
//Variable para volver atras la edicion
    var integranteRaw;
    $scope.editarIntegrante = function (integrante) {
        integranteRaw = integrante;
        mapPersona(integrante);
        $scope.opt.agregando = false;
        $scope.opt.editando = true;
    };

    mapPersona = function (int) {
        $scope.persona.nombre = int.nombre;
        $scope.persona.apellido = int.apellido;
        $scope.persona.tipoDni = int.tipoDni;
        $scope.persona.DNI = int.DNI;
        $scope.persona.CUIL = int.CUIL;
        $scope.persona.nacimiento = int.nacimiento;
        $scope.persona.sexo = int.sexo;
        $scope.persona.estadoCivil = int.estadoCivil;
        $scope.persona.nacionalidad = int.nacionalidad;
        $scope.persona.estudios = int.estudios;
        $scope.persona.profesion = int.profesion;
        $scope.persona.capConstructiva = int.capConstructiva;
        $scope.persona.depLaboral = int.depLaboral;
        $scope.persona.relacionJF = int.relacionJF;
        $scope.persona.ingresoNeto = int.ingresoNeto;
        $scope.persona.mail = int.mail;
        $scope.persona.telefono = int.telefono;
        $scope.persona.jubilado = int.jubilado;
        $scope.persona.carnetJubilacion = int.carnetJubilacion;
        $scope.persona.discapacidad = int.discapacidad;

    };

    $scope.cancelarCarga = function () {
        $scope.resetPersona();
        $scope.opt.agregando = false;
        $scope.opt.editando = false;
    };

    $scope.cancelarEdicion = function () {
        mapPersona($scope.integranteRaw);
        $scope.opt.agregando = false;
        $scope.opt.editando = false;
    };

    $scope.addJefeDeFamilia = function (jefeDeFamilia) {
        jefeFamiliaService.add($scope.jefeDeFamilia).then(function (resp) {
            jefeFamiliaService.get(resp.jefeFamilia.id).then(function (resp) {
                $scope.familia.integrantes.push(resp.persona);
                $scope.familia.JefeDeFamiliaDni = resp.persona.DNI;
                $scope.familia.Apellido = resp.persona.apellido;
            });
        }, function (respErr) {
            console.log(respErr);
        });
        familiaService.update($scope.familia).then(function (resp) {
            $scope.cancelar();
        }, function (respErr) {
            console.log(respErr);
        });
        //Redireccion
    };
}
