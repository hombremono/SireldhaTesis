angular.module('webS').controller('FamiliaController',
    [ '$scope', '$rootScope', '$sce', '$uibModal','$location', 'familiaService','personaService','jefeFamiliaService', FamiliaController ]);
function FamiliaController($scope,$rootScope, $sce, $uibModal, $location, familiaService,personaService, jefeFamiliaService ) {
//---
    document.body.scrollTop = document.documentElement.scrollTop = 0;
//--
var idFamilia =$rootScope.idFamilia;
$scope.editandoJF=false;

$scope.titulo = "Familia";

$scope.agregando = false;

$scope.familia = {
    id:"",
    Apellido:"",
    JefeDeFamiliaDni:"",
    integrantes:[]
};
$scope.persona ={
    id_Persona:0,
    nombre:"",
    apellido:"",
    tipoDni:0,
    DNI:"",
    CUIL:"",
    nacimiento:"",
    sexo:0,
    estadoCivil:0,
    nacionalidad:0,
    estudios:0,
    profesion:0,
    capConstructiva:0,
    depLaboral:0,
    relacionJF:0,
    DescRelacionJF:"",
    ingresoNeto:"",
    mail:"",
    telefono:"",
    jubilado:"",
    carnetJubilacion:"",
    discapacidad:"",
    idEdicion:0,
    editando:false,
    idTelefono:0
};
$scope.jefeDeFamilia={
    nombre:"",
    apellido:"",
    tipoDni:"",
    DNI:"",
    CUIL:"",
    nacimiento:"",
    sexo:"",
    estadoCivil:"",
    nacionalidad:"",
    estudios:"",
    profesion:"",
    capConstructiva:"",
    depLaboral:"",
    trabajoDependencia:{
        empresa:"",
        fechaIngreso:"",
        idLocalidad:"",
        barrio:"",
        direccion:{
            idDireccion:0,
            calle:"",
            numero:"",
            pisoDepto:""
        },
        idTelefono:0,
        telefono:"",
        celular:false
    },
    trabajoAutonomo:{
        inicioActividades:""
    },
    ingresoNeto:"",
    mail:"",
    telefono:"",
    jubilado:false,
    relacionJF:99,
    DescRelacionJF:"Jefe/a de Familia",
    carnetJubilacion:"",
    discapacidad:false,
    idEdicion:0,
    editando:false,
    idTelefono:0
};
//Inicilizacion de Combos
$scope.tiposDni =[{
    id_TipoDocumento:0,
    tipo:"-SELECCIONE TIPO DE DOCUMENTO-"
}];
$scope.sexos =[{
    id_Sexo:0,
    sexo:"-SELECCIONE-"
}];
$scope.estadosCiviles =[{
    id_EstadoCivil:0,
    estadoCivil:"-SELECCIONE-"
}];
$scope.nacionalidades =[{
    id_Nacionalidad:0,
    descripcion:"-SELECCIONE-"
}];
$scope.estudios =[{
    id_Estudios:0,
    estudios:"-SELECCIONE-"
}];
$scope.profesiones =[{
    id_Profesion:0,
    profesion:"-SELECCIONE-"
}];
$scope.capConstructivas =[{
    id_TipoCapacidadConstructiva:0,
    descripcion:"-SELECCIONE-"
}];
$scope.depLaborales =[{
    id_DependenciaLaboral:0,
    dependenciaLaboral:"-SELECCIONE-"
}];
$scope.Localidades =[{
    id_Localidad:0,
    localidad:"-SELECCIONE-"
}];
$scope.relacionJF =[{
    id_RolFamiliar:0,
    rolFamiliar:"-SELECCIONE-"
}];
var defaultCombos = function(){
    $scope.persona.tipoDni = $scope.tiposDni[0].id_TipoDocumento;
    $scope.jefeDeFamilia.tipoDni = $scope.tiposDni[0].id_TipoDocumento;

    $scope.persona.sexo = $scope.sexos[0].id_Sexo;
    $scope.jefeDeFamilia.sexo = $scope.sexos[0].id_Sexo;

    $scope.persona.estadoCivil = $scope.estadosCiviles[0].id_EstadoCivil;
    $scope.jefeDeFamilia.estadoCivil = $scope.estadosCiviles[0].id_EstadoCivil;

    $scope.persona.nacionalidad = $scope.nacionalidades[0].id_Nacionalidad;
    $scope.jefeDeFamilia.nacionalidad = $scope.nacionalidades[0].id_Nacionalidad;

    $scope.persona.estudios = $scope.estudios[0].id_Estudios;
    $scope.jefeDeFamilia.estudios = $scope.estudios[0].id_Estudios;

    $scope.persona.profesion = $scope.profesiones[0].id_Profesion;
    $scope.jefeDeFamilia.profesion = $scope.profesiones[0].id_Profesion;

    $scope.persona.capConstructiva = $scope.capConstructivas[0].id_TipoCapacidadConstructiva;
    $scope.jefeDeFamilia.capConstructiva = $scope.capConstructivas[0].id_TipoCapacidadConstructiva;

    $scope.persona.depLaboral = $scope.depLaborales[0].id_DependenciaLaboral;
    $scope.jefeDeFamilia.depLaboral = $scope.depLaborales[0].id_DependenciaLaboral;

    $scope.persona.relacionJF = $scope.relacionJF[0].id_RolFamiliar;
    $scope.jefeDeFamilia.trabajoDependencia.idLocalidad = $scope.Localidades[0].id_Localidad;
};
var cargarCombo = function(combo, coleccion){
        coleccion.forEach(function(value) {
            combo.push(value);
        });
    };
//--------------------------
familiaService.loadCombosPersona().then(function(resp) {
        datos = resp.data;
        cargarCombo($scope.tiposDni,datos.tiposDocumentos);
        cargarCombo($scope.sexos,datos.generos);
        cargarCombo($scope.estadosCiviles,datos.estadosCiviles);
        cargarCombo($scope.nacionalidades,datos.nacionalidades);
        cargarCombo($scope.estudios,datos.estudios);
        cargarCombo($scope.profesiones,datos.profesiones);
        cargarCombo($scope.capConstructivas,datos.capacidadesConstructivas);
        cargarCombo($scope.depLaborales,datos.situacionesLaborales);
        cargarCombo($scope.Localidades,datos.localidades);
        cargarCombo($scope.relacionJF,datos.rolesFamiliares);
        //Seteado de elemento 0
        defaultCombos();
    }, function(respErr) {
        console.log(respErr);
        $scope.datos = [];
        $scope.opt.wait=false;
    });
var valid;
if($rootScope.idJefe){
  personaService.get($rootScope.idJefe).then(function(resp){
      var jubiladoChk = false;
      if(resp.data.nroCarnetJubilacion)
      {
          jubiladoChk = true;
      }
      debugger;
      var integrante ={
          id_Persona:resp.data.id_Persona,
          nombre:resp.data.nombre,
          apellido:resp.data.apellido,
          tipoDni:resp.data.tipoDocumento.id_TipoDocumento,
          DNI:resp.data.nroDocumento,
          CUIL:resp.data.nroCuil,
          nacimiento:resp.data.fechaNacimiento,
          sexo:resp.data.sexo.id_Sexo,
          estadoCivil:resp.data.estadoCivil.id_EstadoCivil,
          nacionalidad:resp.data.nacionalidad.id_Nacionalidad,
          estudios:resp.data.estudios.id_Estudios,
          profesion:resp.data.profesion.id_Profesion,
          capConstructiva:resp.data.tipoCapacidadConstructiva.id_TipoCapacidadConstructiva,
          depLaboral:resp.data.situacionLaboral.id_DependenciaLaboral,
          relacionJF:resp.data.rolFamiliar.id_RolFamiliar,
          DescRelacionJF:resp.data.rolFamiliar.rolFamiliar,
          ingresoNeto:resp.data.ingresoNeto,
          mail:resp.data.mail,
          idTelefono:resp.data.telefono.id_Telefono,
          telefono:resp.data.telefono.numero,
          jubilado:jubiladoChk,
          carnetJubilacion:resp.data.nroCarnetJubilacion,
          discapacidad:false,
          editando:false,
          trabajoDependencia:{
              empresa:"",
              fechaIngreso:"",
              idLocalidad:"",
              barrio:"",
              direccion:{
                  idDireccion:0,
                  calle:"",
                  numero:"",
                  pisoDepto:""
              },
              idTelefono:0,
              telefono:"",
              celular:false
          },
          trabajoAutonomo:{
              inicioActividades:""
          }
      };
      $scope.familia.Apellido = resp.data.apellido;
      $scope.familia.JefeDeFamiliaDni =resp.data.nroDocumento;
      $scope.familia.familia=$rootScope.idFamilia;
      if(resp.data.situacionLaboral.id_DependenciaLaboral == 1 && resp.data.rolFamiliar.id_RolFamiliar ==1)
      {
          familiaService.getRelacionDep($rootScope.idDependencia).then(function(resp){
              integrante.trabajoDependencia.empresa = resp.data.empresa;
              integrante.trabajoDependencia.fechaIngreso = resp.data.fechaIngreso;
              integrante.trabajoDependencia.idLocalidad = resp.data.direccion.localidad.id_Localidad;
              integrante.trabajoDependencia.barrio = resp.data.direccion.barrio;
              integrante.trabajoDependencia.direccion.idDireccion = resp.data.direccion.id_Direccion;
              integrante.trabajoDependencia.direccion.calle = resp.data.direccion.calle;
              integrante.trabajoDependencia.direccion.numero = resp.data.direccion.numero;
              integrante.trabajoDependencia.direccion.pisoDepto = resp.data.direccion.dpto;
              integrante.trabajoDependencia.telefono = resp.data.telefono.numero;
              integrante.trabajoDependencia.idTelefono = resp.data.telefono.id_Telefono;
              $scope.familia.integrantes.push(integrante);
          });
      }
      else if(resp.data.situacionLaboral.id_DependenciaLaboral == 2 && resp.data.rolFamiliar.id_RolFamiliar ==1)
      {
          familiaService.getAutonomo($rootScope.idAutonomo).then(function(resp){
              integrante.trabajoAutonomo.inicioActividades = resp.data.fechaInicioActividades;
              $scope.familia.integrantes.push(integrante);
          });
      }
      else
      {
          $scope.familia.integrantes.push(integrante);
      }

  });
};
$scope.addjefeDeFamilia = function(){
    valid = ejecutarValidacionesJF();
    if(valid){
        var jefeReq = {
            "nombre": $scope.jefeDeFamilia.nombre,
            "apellido":$scope.jefeDeFamilia.apellido ,
            "nroDocumento": $scope.jefeDeFamilia.DNI,
            "nroCuil": $scope.jefeDeFamilia.CUIL,
            "fechaNacimiento":$scope.jefeDeFamilia.nacimiento,
            "ingresoNeto": $scope.jefeDeFamilia.ingresoNeto,
            "mail": $scope.jefeDeFamilia.mail,
            "tipoDocumento": {"id_TipoDocumento": $scope.jefeDeFamilia.tipoDni},
            "familia": {"id_Familia": idFamilia},
            "situacionLaboral": {"id_DependenciaLaboral": $scope.jefeDeFamilia.depLaboral},
            "sexo": {"id_Sexo": $scope.jefeDeFamilia.sexo},
            "estadoCivil": {"id_EstadoCivil": $scope.jefeDeFamilia.estadoCivil},
            "nacionalidad": {"id_Nacionalidad": $scope.jefeDeFamilia.nacionalidad},
            "localidad": {"id_Localidad":1},
            "estudios": {"id_Estudios": $scope.jefeDeFamilia.estudios},
            "profesion": {"id_Profesion": $scope.jefeDeFamilia.profesion},
            "telefono": {
                "celular":$scope.jefeDeFamilia.celular || false,
                "numero":$scope.jefeDeFamilia.telefono},
            "rolFamiliar": {"id_RolFamiliar": 1},
            "active": true,
            "tipoCapacidadConstructiva":{
                "id_TipoCapacidadConstructiva":$scope.jefeDeFamilia.capConstructiva
            }

        };
        /*var jefeReqEdit = {
            "id_Persona":$scope.jefeDeFamilia.idEdicion,
            "nombre": $scope.jefeDeFamilia.nombre,
            "apellido":$scope.jefeDeFamilia.apellido ,
            "nroDocumento": $scope.jefeDeFamilia.DNI,
            "nroCuil": $scope.jefeDeFamilia.CUIL,
            "fechaNacimiento":$scope.jefeDeFamilia.nacimiento,
            "ingresoNeto": $scope.jefeDeFamilia.ingresoNeto,
            "mail": $scope.jefeDeFamilia.mail,
            "tipoDocumento": {"id_TipoDocumento": $scope.jefeDeFamilia.tipoDni},
            "familia": {"id_Familia": idFamilia},
            "situacionLaboral": {"id_DependenciaLaboral": $scope.jefeDeFamilia.depLaboral},
            "sexo": {"id_Sexo": $scope.jefeDeFamilia.sexo},
            "estadoCivil": {"id_EstadoCivil": $scope.jefeDeFamilia.estadoCivil},
            "nacionalidad": {"id_Nacionalidad": $scope.jefeDeFamilia.nacionalidad},
            "localidad": {"id_Localidad":1},
            "estudios": {"id_Estudios": $scope.jefeDeFamilia.estudios},
            "profesion": {"id_Profesion": $scope.jefeDeFamilia.profesion},
            "telefono": {
                "celular":$scope.jefeDeFamilia.celular,
                "numero":$scope.jefeDeFamilia.telefono},
            "rolFamiliar": {"id_RolFamiliar": 1},
            "active": true,

        };*/
        personaService.add(jefeReq).then(function(resp){
            $rootScope.idJefe =resp.data.id_Persona;
                var trabajoAutonomo = {
                    "persona": {
                        "id_Persona": $rootScope.idJefe
                    },
                    "fechaInicioActividades": $scope.jefeDeFamilia.trabajoAutonomo.inicioActividades,
                    "active": true
                };
                var trabajoDependencia={
                    "empresa": $scope.jefeDeFamilia.trabajoDependencia.empresa,
                    "fechaIngreso": $scope.jefeDeFamilia.trabajoDependencia.fechaIngreso,
                    "persona": {
                        "id_Persona": $rootScope.idJefe
                    },
                    "telefono": {
                        "numero": $scope.jefeDeFamilia.trabajoDependencia.telefono,
                        "celular": false,
                        "active": true
                    },
                    "direccion": {
                        "calle": $scope.jefeDeFamilia.trabajoDependencia.direccion.calle,
                        "numero": $scope.jefeDeFamilia.trabajoDependencia.direccion.numero,
                        "dpto": $scope.jefeDeFamilia.trabajoDependencia.direccion.pisoDepto,
                        "barrio": $scope.jefeDeFamilia.trabajoDependencia.barrio,
                        "latitud": 0,
                        "longitud": 0,
                        "localidad": {
                            "id_Localidad": $scope.jefeDeFamilia.trabajoDependencia.idLocalidad,
                            "localidad": "",
                            "isActive": true
                        },
                        "isActive": true
                    },
                    "active": true
                };
            if(resp.data.situacionLaboral.id_DependenciaLaboral == 1)
            {
                 familiaService.addRelacionDep(trabajoDependencia).then(function(resp){
                     $rootScope.idDependencia=resp.data.id_TrabajoDependencia;
                     $location.path('/family');
                 });
            }
            else if(resp.data.situacionLaboral.id_DependenciaLaboral == 2)
            {
                familiaService.addAutonomo(trabajoAutonomo).then(function(resp){
                    $rootScope.idAutonomo=resp.data.id_TrabajoAutonomo;
                    $location.path('/family');
                });

            }
            else
            {
                $location.path('/family');
            }

        },
        function(respErr){
            console.log(respErr);
        });
    }

};
$scope.editjefeDeFamilia = function() {
    valid = ejecutarValidacionesJF();
    if(valid){
        var jefeReqEdit = {
            "id_Persona":$rootScope.idJefe,
            "nombre": $scope.jefeDeFamilia.nombre,
            "apellido":$scope.jefeDeFamilia.apellido ,
            "nroDocumento": $scope.jefeDeFamilia.DNI,
            "nroCuil": $scope.jefeDeFamilia.CUIL,
            "fechaNacimiento":$scope.jefeDeFamilia.nacimiento,
            "ingresoNeto": $scope.jefeDeFamilia.ingresoNeto,
            "mail": $scope.jefeDeFamilia.mail,
            "tipoDocumento": {"id_TipoDocumento": $scope.jefeDeFamilia.tipoDni},
            "familia": {"id_Familia": idFamilia},
            "situacionLaboral": {"id_DependenciaLaboral": $scope.jefeDeFamilia.depLaboral},
            "sexo": {"id_Sexo": $scope.jefeDeFamilia.sexo},
            "estadoCivil": {"id_EstadoCivil": $scope.jefeDeFamilia.estadoCivil},
            "nacionalidad": {"id_Nacionalidad": $scope.jefeDeFamilia.nacionalidad},
            "localidad": {"id_Localidad":1},
            "estudios": {"id_Estudios": $scope.jefeDeFamilia.estudios},
            "profesion": {"id_Profesion": $scope.jefeDeFamilia.profesion},
            "telefono": {
                "id_Telefono":$scope.jefeDeFamilia.idTelefono,
                "celular":$scope.jefeDeFamilia.celular,
                "numero":$scope.jefeDeFamilia.telefono},
            "rolFamiliar": {"id_RolFamiliar": 1},
            "active": true,
            "tipoCapacidadConstructiva":{
                "id_TipoCapacidadConstructiva":$scope.jefeDeFamilia.capConstructiva
            }
        };
        personaService.update(jefeReqEdit).then(function(resp){
                var trabajoAutonomo = {
                    "persona": {
                        "id_Persona": $rootScope.idJefe
                    },
                    "id_TrabajoAutonomo":$rootScope.idAutonomo,
                    "fechaInicioActividades": $scope.jefeDeFamilia.trabajoAutonomo.inicioActividades,
                    "active": true
                };
                var trabajoDependencia={
                    "id_TrabajoDependencia":$rootScope.idDependencia,
                    "empresa": $scope.jefeDeFamilia.trabajoDependencia.empresa,
                    "fechaIngreso": $scope.jefeDeFamilia.trabajoDependencia.fechaIngreso,
                    "persona": {
                        "id_Persona": $rootScope.idJefe
                    },
                    "telefono": {
                        "id_Telefono":$scope.jefeDeFamilia.trabajoDependencia.idTelefono,
                        "numero": $scope.jefeDeFamilia.trabajoDependencia.telefono,
                        "celular": false,
                        "active": true
                    },
                    "direccion": {
                        "id_Direccion": $scope.jefeDeFamilia.trabajoDependencia.direccion.idDireccion,
                        "calle": $scope.jefeDeFamilia.trabajoDependencia.direccion.calle,
                        "numero": $scope.jefeDeFamilia.trabajoDependencia.direccion.numero,
                        "dpto": $scope.jefeDeFamilia.trabajoDependencia.direccion.pisoDepto,
                        "barrio": $scope.jefeDeFamilia.trabajoDependencia.barrio,
                        "latitud": 0,
                        "longitud": 0,
                        "localidad": {
                            "id_Localidad": $scope.jefeDeFamilia.trabajoDependencia.idLocalidad,
                            "localidad": "",
                            "isActive": true
                        },
                        "isActive": true
                    },
                    "active": true
                };
                if(jefeReqEdit.situacionLaboral.id_DependenciaLaboral == 1)
                {
                    familiaService.updateRelacionDep(trabajoDependencia).then(function(resp){
                        $scope.familia.integrantes.forEach(function (item,index){
                            if(item.id_Persona == $rootScope.idJefe){
                                $scope.familia.integrantes.splice(index,1);
                                return false;
                            }
                        });
                        personaService.get($rootScope.idJefe).then(function(resp){
                            var jubiladoChk = false;
                            if(resp.data.nroCarnetJubilacion)
                            {
                                jubiladoChk = true;
                            }
                            var integrante ={
                                id_Persona:resp.data.id_Persona,
                                nombre:resp.data.nombre,
                                apellido:resp.data.apellido,
                                tipoDni:resp.data.tipoDocumento.id_TipoDocumento,
                                DNI:resp.data.nroDocumento,
                                CUIL:resp.data.nroCuil,
                                nacimiento:resp.data.fechaNacimiento,
                                sexo:resp.data.sexo.id_Sexo,
                                estadoCivil:resp.data.estadoCivil.id_EstadoCivil,
                                nacionalidad:resp.data.nacionalidad.id_Nacionalidad,
                                estudios:resp.data.estudios.id_Estudios,
                                profesion:resp.data.profesion.id_Profesion,
                                capConstructiva:resp.data.tipoCapacidadConstructiva.id_TipoCapacidadConstructiva,
                                depLaboral:resp.data.situacionLaboral.id_DependenciaLaboral,
                                relacionJF:resp.data.rolFamiliar.id_RolFamiliar,
                                DescRelacionJF:resp.data.rolFamiliar.rolFamiliar,
                                ingresoNeto:resp.data.ingresoNeto,
                                mail:resp.data.mail,
                                telefono:resp.data.telefono.numero,
                                jubilado:jubiladoChk,
                                carnetJubilacion:resp.data.nroCarnetJubilacion,
                                discapacidad:false,
                                editando:false
                            };
                            $scope.familia.integrantes.push(integrante);
                            $scope.editandoJF=false;
                        });
                    });
                }
                else if(jefeReqEdit.situacionLaboral.id_DependenciaLaboral == 2)
                {
                    familiaService.updateAutonomo(trabajoAutonomo).then(function(resp){
                        $scope.familia.integrantes.forEach(function (item,index){
                            if(item.id_Persona == $rootScope.idJefe){
                                $scope.familia.integrantes.splice(index,1);
                                return false;
                            }
                        });
                        personaService.get($rootScope.idJefe).then(function(resp){
                            var jubiladoChk = false;
                            if(resp.data.nroCarnetJubilacion)
                            {
                                jubiladoChk = true;
                            }
                            var integrante ={
                                id_Persona:resp.data.id_Persona,
                                nombre:resp.data.nombre,
                                apellido:resp.data.apellido,
                                tipoDni:resp.data.tipoDocumento.id_TipoDocumento,
                                DNI:resp.data.nroDocumento,
                                CUIL:resp.data.nroCuil,
                                nacimiento:resp.data.fechaNacimiento,
                                sexo:resp.data.sexo.id_Sexo,
                                estadoCivil:resp.data.estadoCivil.id_EstadoCivil,
                                nacionalidad:resp.data.nacionalidad.id_Nacionalidad,
                                estudios:resp.data.estudios.id_Estudios,
                                profesion:resp.data.profesion.id_Profesion,
                                capConstructiva:resp.data.tipoCapacidadConstructiva.id_TipoCapacidadConstructiva,
                                depLaboral:resp.data.situacionLaboral.id_DependenciaLaboral,
                                relacionJF:resp.data.rolFamiliar.id_RolFamiliar,
                                DescRelacionJF:resp.data.rolFamiliar.rolFamiliar,
                                ingresoNeto:resp.data.ingresoNeto,
                                mail:resp.data.mail,
                                telefono:resp.data.telefono.numero,
                                jubilado:jubiladoChk,
                                carnetJubilacion:resp.data.nroCarnetJubilacion,
                                discapacidad:false,
                                editando:false
                            };
                            $scope.familia.integrantes.push(integrante);
                            $scope.editandoJF=false;
                        });
                    });

                }
                else{
                    $scope.familia.integrantes.forEach(function (item,index){
                        if(item.id_Persona == $rootScope.idJefe){
                            $scope.familia.integrantes.splice(index,1);
                            return false;
                        }
                    });
                    personaService.get($rootScope.idJefe).then(function(resp){
                        var jubiladoChk = false;
                        if(resp.data.nroCarnetJubilacion)
                        {
                            jubiladoChk = true;
                        }
                        var integrante ={
                            id_Persona:resp.data.id_Persona,
                            nombre:resp.data.nombre,
                            apellido:resp.data.apellido,
                            tipoDni:resp.data.tipoDocumento.id_TipoDocumento,
                            DNI:resp.data.nroDocumento,
                            CUIL:resp.data.nroCuil,
                            nacimiento:resp.data.fechaNacimiento,
                            sexo:resp.data.sexo.id_Sexo,
                            estadoCivil:resp.data.estadoCivil.id_EstadoCivil,
                            nacionalidad:resp.data.nacionalidad.id_Nacionalidad,
                            estudios:resp.data.estudios.id_Estudios,
                            profesion:resp.data.profesion.id_Profesion,
                            capConstructiva:resp.data.tipoCapacidadConstructiva.id_TipoCapacidadConstructiva,
                            depLaboral:resp.data.situacionLaboral.id_DependenciaLaboral,
                            relacionJF:resp.data.rolFamiliar.id_RolFamiliar,
                            DescRelacionJF:resp.data.rolFamiliar.rolFamiliar,
                            ingresoNeto:resp.data.ingresoNeto,
                            mail:resp.data.mail,
                            telefono:resp.data.telefono.numero,
                            jubilado:jubiladoChk,
                            carnetJubilacion:resp.data.nroCarnetJubilacion,
                            discapacidad:false,
                            editando:false
                        };
                        $scope.familia.integrantes.push(integrante);
                        $scope.editandoJF=false;
                    });

                }
            },
            function(respErr){
                console.log(respErr);
            });
    }
};
$scope.addPersona = function() {
    valid = ejecutarValidaciones();
    if(valid) {
        debugger;
        var reqPersona = {
            "nombre": $scope.persona.nombre,
            "apellido": $scope.persona.apellido,
            "nroDocumento": $scope.persona.DNI,
            "nroCuil": $scope.persona.CUIL,
            "fechaNacimiento": $scope.persona.nacimiento,
            "ingresoNeto": $scope.persona.ingresoNeto,
            "mail": $scope.persona.mail,
            "tipoDocumento": {"id_TipoDocumento": $scope.persona.tipoDni},
            "familia": {"id_Familia": idFamilia},
            "situacionLaboral": {"id_DependenciaLaboral": $scope.persona.depLaboral},
            "sexo": {"id_Sexo": $scope.persona.sexo},
            "estadoCivil": {"id_EstadoCivil": $scope.persona.estadoCivil},
            "nacionalidad": {"id_Nacionalidad": $scope.persona.nacionalidad},
            "localidad": {"id_Localidad": 1},
            "estudios": {"id_Estudios": $scope.persona.estudios},
            "profesion": {"id_Profesion": $scope.persona.profesion},
            "telefono": {
                "celular": $scope.persona.celular,
                "numero": $scope.persona.telefono
            },
            "rolFamiliar": {"id_RolFamiliar": $scope.persona.relacionJF},
            "active": true,
            "tipoCapacidadConstructiva":{
                "id_TipoCapacidadConstructiva":$scope.persona.capConstructiva
            }
        };
        var reqEdicion={
            "id_Persona":$scope.persona.idEdicion,
            "nombre": $scope.persona.nombre,
            "apellido": $scope.persona.apellido,
            "nroDocumento": $scope.persona.DNI,
            "nroCuil": $scope.persona.CUIL,
            "fechaNacimiento": $scope.persona.nacimiento,
            "ingresoNeto": $scope.persona.ingresoNeto,
            "mail": $scope.persona.mail,
            "tipoDocumento": {"id_TipoDocumento": $scope.persona.tipoDni},
            "familia": {"id_Familia": idFamilia},
            "situacionLaboral": {"id_DependenciaLaboral": $scope.persona.depLaboral},
            "sexo": {"id_Sexo": $scope.persona.sexo},
            "estadoCivil": {"id_EstadoCivil": $scope.persona.estadoCivil},
            "nacionalidad": {"id_Nacionalidad": $scope.persona.nacionalidad},
            "localidad": {"id_Localidad": 1},
            "estudios": {"id_Estudios": $scope.persona.estudios},
            "profesion": {"id_Profesion": $scope.persona.profesion},
            "telefono": {
                "id_Telefono":$scope.persona.idTelefono,
                "celular": $scope.persona.celular,
                "numero": $scope.persona.telefono
            },
            "rolFamiliar": {"id_RolFamiliar": $scope.persona.relacionJF},
            "active": true,
            "tipoCapacidadConstructiva":{
                "id_TipoCapacidadConstructiva":$scope.persona.capConstructiva
            }
        };
        if ($scope.persona.editando) {
            personaService.update(reqEdicion).then(function (resp) {
                //FUNCIONA.
                /*var integrante ={
                    id_Persona:resp.data.id_Persona,
                    nombre:resp.data.nombre,
                    apellido:resp.data.apellido,
                    tipoDni:resp.data.tipoDocumento.id_TipoDocumento,
                    DNI:resp.data.nroDocumento,
                    CUIL:resp.data.nroCuil,
                    nacimiento:resp.data.fechaNacimiento,
                    sexo:resp.data.sexo.id_Sexo,
                    estadoCivil:resp.data.estadoCivil.id_EstadoCivil,
                    nacionalidad:resp.data.nacionalidad.id_Nacionalidad,
                    estudios:resp.data.estudios.id_Estudios,
                    profesion:resp.data.profesion.id_Profesion,
                    capConstructiva:0,
                    depLaboral:resp.data.situacionLaboral.id_DependenciaLaboral,
                    relacionJF:resp.data.rolFamiliar.id_RolFamiliar,
                    DescRelacionJF:resp.data.rolFamiliar.rolFamiliar,
                    ingresoNeto:resp.data.ingresoNeto,
                    mail:resp.data.mail,
                    idTelefono:resp.data.telefono.id_Telefono,
                    telefono:resp.data.telefono.numero,
                    jubilado:jubiladoChk,
                    carnetJubilacion:resp.data.nroCarnetJubilacion,
                    discapacidad:false,
                    editando:false,
                    trabajoDependencia:{
                        empresa:"",
                        fechaIngreso:"",
                        idLocalidad:"",
                        barrio:"",
                        direccion:{
                            calle:"",
                            numero:"",
                            pisoDepto:""
                        },
                        telefono:"",
                        celular:false
                    },
                    trabajoAutonomo:{
                        inicioActividades:""
                    }
                };*/
                $scope.familia.integrantes.forEach(function (item,index){
                    if(item.id_Persona == reqEdicion.id_Persona){
                        $scope.familia.integrantes.splice(index,1);
                        return false;
                    }
                });
                personaService.get(reqEdicion.id_Persona).then(function(resp){
                    var jubiladoChk = false;
                    if(resp.data.nroCarnetJubilacion)
                    {
                        jubiladoChk = true;
                    }
                    debugger;
                var integrante ={
                        id_Persona:resp.data.id_Persona,
                        nombre:resp.data.nombre,
                        apellido:resp.data.apellido,
                        tipoDni:resp.data.tipoDocumento.id_TipoDocumento,
                        DNI:resp.data.nroDocumento,
                        CUIL:resp.data.nroCuil,
                        nacimiento:resp.data.fechaNacimiento,
                        sexo:resp.data.sexo.id_Sexo,
                        estadoCivil:resp.data.estadoCivil.id_EstadoCivil,
                        nacionalidad:resp.data.nacionalidad.id_Nacionalidad,
                        estudios:resp.data.estudios.id_Estudios,
                        profesion:resp.data.profesion.id_Profesion,
                        capConstructiva:resp.data.tipoCapacidadConstructiva.id_TipoCapacidadConstructiva,
                        depLaboral:resp.data.situacionLaboral.id_DependenciaLaboral,
                        relacionJF:resp.data.rolFamiliar.id_RolFamiliar,
                        DescRelacionJF:resp.data.rolFamiliar.rolFamiliar,
                        ingresoNeto:resp.data.ingresoNeto,
                        mail:resp.data.mail,
                        telefono:resp.data.telefono.numero,
                        jubilado:jubiladoChk,
                        carnetJubilacion:resp.data.nroCarnetJubilacion,
                        discapacidad:false,
                        editando:false
                    }
                    $scope.familia.integrantes.push(integrante);
                    $scope.persona ={
                        id_Persona:0,
                        nombre:"",
                        apellido:"",
                        tipoDni:0,
                        DNI:"",
                        CUIL:"",
                        nacimiento:"",
                        sexo:0,
                        estadoCivil:0,
                        nacionalidad:0,
                        estudios:0,
                        profesion:0,
                        capConstructiva:0,
                        depLaboral:0,
                        relacionJF:0,
                        DescRelacionJF:"",
                        ingresoNeto:"",
                        mail:"",
                        telefono:"",
                        jubilado:"",
                        carnetJubilacion:"",
                        discapacidad:"",
                        idEdicion:0,
                        editando:false,
                        idTelefono:0
                    };
                    $scope.agregando = false;
                    });


            });
        }
        else{
            personaService.add(reqPersona).then(function(resp) {
                var jubiladoChk = false;
                if(resp.data.nroCarnetJubilacion)
                {
                    jubiladoChk = true;
                }
                debugger;
                var integrante ={
                    id_Persona:resp.data.id_Persona,
                    nombre:resp.data.nombre,
                    apellido:resp.data.apellido,
                    tipoDni:resp.data.tipoDocumento.id_TipoDocumento,
                    DNI:resp.data.nroDocumento,
                    CUIL:resp.data.nroCuil,
                    nacimiento:resp.data.fechaNacimiento,
                    sexo:resp.data.sexo.id_Sexo,
                    estadoCivil:resp.data.estadoCivil.id_EstadoCivil,
                    nacionalidad:resp.data.nacionalidad.id_Nacionalidad,
                    estudios:resp.data.estudios.id_Estudios,
                    profesion:resp.data.profesion.id_Profesion,
                    capConstructiva:resp.data.tipoCapacidadConstructiva.id_TipoCapacidadConstructiva,
                    depLaboral:resp.data.situacionLaboral.id_DependenciaLaboral,
                    relacionJF:resp.data.rolFamiliar.id_RolFamiliar,
                    DescRelacionJF:resp.data.rolFamiliar.rolFamiliar,
                    ingresoNeto:resp.data.ingresoNeto,
                    mail:resp.data.mail,
                    idTelefono:resp.data.telefono.id_Telefono,
                    telefono:resp.data.telefono.numero,
                    jubilado:jubiladoChk,
                    carnetJubilacion:resp.data.nroCarnetJubilacion,
                    discapacidad:false,
                    editando:false,
                    trabajoDependencia:{
                        empresa:"",
                        fechaIngreso:"",
                        idLocalidad:"",
                        barrio:"",
                        direccion:{
                            calle:"",
                            numero:"",
                            pisoDepto:""
                        },
                        telefono:"",
                        celular:false
                    },
                    trabajoAutonomo:{
                        inicioActividades:""
                    }
                };
                $scope.familia.integrantes.push(integrante);
                $scope.persona ={
                    id_Persona:0,
                    nombre:"",
                    apellido:"",
                    tipoDni:0,
                    DNI:"",
                    CUIL:"",
                    nacimiento:"",
                    sexo:0,
                    estadoCivil:0,
                    nacionalidad:0,
                    estudios:0,
                    profesion:0,
                    capConstructiva:0,
                    depLaboral:0,
                    relacionJF:0,
                    DescRelacionJF:"",
                    ingresoNeto:"",
                    mail:"",
                    telefono:"",
                    jubilado:"",
                    carnetJubilacion:"",
                    discapacidad:"",
                    idEdicion:0,
                    editando:false,
                    idTelefono:0
                };
                $scope.agregando = false;

            }, function(respErr) {
                console.log(respErr);
            });
        }
 }};

$scope.agregarPersona = function(){
    resetPersona();
    $scope.agregando = true;

};
$scope.eliminarPersona = function(integrante){

    if(confirm("Seguro que desea eliminar a "+integrante.nombre +" "+integrante.apellido+" de la familia?" ))
    {
        personaService.delete(integrante.id_Persona).then(function(resp){
           $scope.familia.integrantes.forEach(function (item,index){
             if(item.id_Persona == integrante.id_Persona){
                 $scope.familia.integrantes.splice(index,1);
                 return false;
             }
           }, function(respErr){
               console.log(respErr);
           });
        });
    }
};
$scope.editarPersona = function(integrante){
    if(integrante.relacionJF!=1)
    {
        $scope.persona.editando=true;
        $scope.persona.nombre = integrante.nombre;
        $scope.persona.apellido = integrante.apellido;
        $scope.persona.tipoDni = integrante.tipoDni;
        $scope.persona.DNI = Number(integrante.DNI);
        $scope.persona.CUIL = Number(integrante.CUIL);
        $scope.persona.nacimiento = new Date(Number(integrante.nacimiento));
        $scope.persona.sexo = integrante.sexo;
        $scope.persona.estadoCivil = integrante.estadoCivil;
        $scope.persona.nacionalidad = integrante.nacionalidad;
        $scope.persona.estudios = integrante.estudios;
        $scope.persona.profesion = integrante.profesion;
        $scope.persona.capConstructiva = integrante.capConstructiva;
        $scope.persona.depLaboral = integrante.depLaboral;
        $scope.persona.relacionJF = integrante.relacionJF;
        $scope.persona.ingresoNeto = integrante.ingresoNeto;
        $scope.persona.mail = integrante.mail;
        $scope.persona.idTelefono = integrante.idTelefono;
        $scope.persona.telefono = Number(integrante.telefono);
        $scope.persona.jubilado = integrante.jubilado;
        $scope.persona.carnetJubilacion = integrante.carnetJubilacion;
        $scope.persona.discapacidad = integrante.discapacidad;
        $scope.persona.idEdicion = integrante.id_Persona;
        $scope.agregando = true;
    }
    else
    {
        $scope.jefeDeFamilia.editando=true;
        $scope.jefeDeFamilia.nombre = integrante.nombre;
        $scope.jefeDeFamilia.apellido = integrante.apellido;
        $scope.jefeDeFamilia.tipoDni = integrante.tipoDni;
        $scope.jefeDeFamilia.DNI = Number(integrante.DNI);
        $scope.jefeDeFamilia.CUIL = Number(integrante.CUIL);
        $scope.jefeDeFamilia.nacimiento = new Date(Number(integrante.nacimiento));
        $scope.jefeDeFamilia.sexo = integrante.sexo;
        $scope.jefeDeFamilia.estadoCivil = integrante.estadoCivil;
        $scope.jefeDeFamilia.nacionalidad = integrante.nacionalidad;
        $scope.jefeDeFamilia.estudios = integrante.estudios;
        $scope.jefeDeFamilia.profesion = integrante.profesion;
        $scope.jefeDeFamilia.capConstructiva = integrante.capConstructiva;
        $scope.jefeDeFamilia.depLaboral = integrante.depLaboral;
        $scope.jefeDeFamilia.relacionJF = 1;
        $scope.jefeDeFamilia.ingresoNeto = integrante.ingresoNeto;
        $scope.jefeDeFamilia.mail = integrante.mail;
        $scope.jefeDeFamilia.idTelefono = integrante.idTelefono;
        $scope.jefeDeFamilia.telefono = Number(integrante.telefono);
        $scope.jefeDeFamilia.jubilado = integrante.jubilado;
        $scope.jefeDeFamilia.carnetJubilacion = integrante.carnetJubilacion;
        $scope.jefeDeFamilia.discapacidad = integrante.discapacidad;
        $scope.jefeDeFamilia.trabajoDependencia.empresa = integrante.trabajoDependencia.empresa;
        $scope.jefeDeFamilia.trabajoDependencia.fechaIngreso = new Date(Number(integrante.trabajoDependencia.fechaIngreso));
        $scope.jefeDeFamilia.trabajoDependencia.idLocalidad = integrante.trabajoDependencia.idLocalidad;
        $scope.jefeDeFamilia.trabajoDependencia.barrio = integrante.trabajoDependencia.barrio;

        $scope.jefeDeFamilia.trabajoDependencia.direccion.idDireccion = integrante.trabajoDependencia.direccion.idDireccion;
        $scope.jefeDeFamilia.trabajoDependencia.direccion.calle = integrante.trabajoDependencia.direccion.calle;
        $scope.jefeDeFamilia.trabajoDependencia.direccion.numero = Number(integrante.trabajoDependencia.direccion.numero);
        $scope.jefeDeFamilia.trabajoDependencia.direccion.pisoDepto = integrante.trabajoDependencia.direccion.pisoDepto;
        $scope.jefeDeFamilia.trabajoDependencia.telefono = Number(integrante.trabajoDependencia.telefono);
        $scope.jefeDeFamilia.trabajoDependencia.idTelefono = integrante.trabajoDependencia.idTelefono;
        $scope.jefeDeFamilia.trabajoDependencia.celular = integrante.trabajoDependencia.celular;
        $scope.jefeDeFamilia.trabajoAutonomo.inicioActividades = new Date(Number(integrante.trabajoAutonomo.inicioActividades));
        $scope.editandoJF = true;
    }
};
$scope.addFamilia = function(){
    var ingresoNetoFamiliar =0;
    $scope.familia.integrantes.forEach(function (item,index){
        ingresoNetoFamiliar +=item.ingresoNeto;
    });
    $rootScope.hogar.ingresoNetoFamiliar = ingresoNetoFamiliar;
    var familyReq = $rootScope.hogar;
    familiaService.update(familyReq).then(function(resp){
        debugger;
        var v = resp.data;
        $location.path('/requestProperty');
    });

};

var ejecutarValidacionesJF = function(){
    var result = true;
    if($scope.jefeDeFamilia.nombre == "")
    {
        showNotification('Ingrese un nombre', 'danger');
            result=false;
    }
    if($scope.jefeDeFamilia.apellido == "")
    {
        showNotification('Ingrese el apellido', 'danger');
            result=false;
    }
    if($scope.jefeDeFamilia.tipoDni == 0)
    {
        showNotification('Seleccione un tipo de DNI valido', 'danger');
            result=false;
    }
    if($scope.jefeDeFamilia.DNI == "")
    {
        showNotification('Ingrese un DNI valido', 'danger');
            result=false;
    }
    if($scope.jefeDeFamilia.nacimiento == "")
    {
        showNotification('Ingrese una fecha de nacimiento valida', 'danger');
            result=false;
    }
    if($scope.jefeDeFamilia.sexo == 0)
    {
        showNotification('Seleccione un Sexo', 'danger');
            result=false;
    }
    if($scope.jefeDeFamilia.estadoCivil == 0)
    {
        showNotification('Seleccione un Estado Civil valido', 'danger');
            result=false;
    }
    if($scope.jefeDeFamilia.nacionalidad == 0)
    {
        showNotification('Seleccione una Nacionalidad valida', 'danger');
            result=false;
    }
    if($scope.jefeDeFamilia.estudios == 0)
    {
        showNotification('Seleccione un nivel de Estudios valido', 'danger');
            result=false;
    }
    if($scope.jefeDeFamilia.profesion == 0)
    {
        showNotification('Seleccione una profesion valida', 'danger');
            result=false;
    }
    if($scope.jefeDeFamilia.capConstructiva == 0)
    {
        showNotification('Seleccione una Capacidad Constructiva valida', 'danger');
            result=false;
    }
    if($scope.jefeDeFamilia.depLaboral == 0)
    {
        showNotification('Seleccione una Dependencia Laboral valida', 'danger');
            result=false;
    }
    //Validaciones Laborales
    if($scope.jefeDeFamilia.depLaboral == 1 && $scope.jefeDeFamilia.trabajoDependencia.empresa=="")
    {
        showNotification('Ingrese una empresa', 'danger');
            result=false;
    }
    if($scope.jefeDeFamilia.depLaboral == 1 && $scope.jefeDeFamilia.trabajoDependencia.fechaIngreso=="")
    {
        showNotification('Ingrese una fecha de ingreso laboral valida', 'danger');
            result=false;
    }
    if($scope.jefeDeFamilia.depLaboral ==2 && $scope.jefeDeFamilia.trabajoAutonomo.inicioActividades=="")
    {
        showNotification('Seleccione una fecha de inicio de actividades valida', 'danger');
            result=false;
    }
    //----
    if($scope.jefeDeFamilia.ingresoNeto == "" || $scope.jefeDeFamilia.ingresoNeto <= 0  )
    {
        showNotification('Ingrese un Ingreso Neto valido', 'danger');
            result=false;
    }
    return result;

};
var ejecutarValidaciones = function(){
    var result = true;
    if($scope.persona.nombre == "")
    {
        showNotification('Ingrese un nombre', 'danger');
            result=false;
    }
    if($scope.persona.apellido == "")
    {
        showNotification('Ingrese el apellido', 'danger');
            result=false;
    }
    if($scope.persona.tipoDni == 0)
    {
        showNotification('Seleccione un tipo de DNI valido', 'danger');
            result=false;
    }
    if($scope.persona.DNI == "")
    {
        showNotification('Ingrese un DNI valido', 'danger');
            result=false;
    }
    if($scope.persona.nacimiento == "")
    {
        showNotification('Ingrese una fecha de nacimiento valida', 'danger');
            result=false;
    }
    if($scope.persona.sexo == 0)
    {
        showNotification('Seleccione un Sexo', 'danger');
            result=false;
    }
    if($scope.persona.estadoCivil == 0)
    {
        showNotification('Seleccione un Estado Civil valido', 'danger');
            result=false;
    }
    if($scope.persona.nacionalidad == 0)
    {
        showNotification('Seleccione una Nacionalidad valida', 'danger');
            result=false;
    }
    if($scope.persona.estudios == 0)
    {
        showNotification('Seleccione un nivel de Estudios valido', 'danger');
            result=false;
    }
    if($scope.persona.profesion == 0)
    {
        showNotification('Seleccione una profesion valida', 'danger');
            result=false;
    }
    if($scope.persona.capConstructiva == 0)
    {
        showNotification('Seleccione una Capacidad Constructiva valida', 'danger');
            result=false;
    }
    if($scope.persona.depLaboral == 0)
    {
        showNotification('Seleccione una Dependencia Laboral valida', 'danger');
            result=false;
    }
    if($scope.persona.relacionJF == 0)
    {
        showNotification('Seleccione una relacion con el Jefe/a de familia', 'danger');
            result=false;
    }
    if($scope.persona.ingresoNeto == "" || $scope.persona.ingresoNeto <= 0  )
    {
        showNotification('Ingrese un Ingreso Neto valido', 'danger');
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
var resetPersona = function () {
        $scope.persona ={
            nombre:"",
            apellido:"",
            tipoDni:0,
            DNI:"",
            CUIL:"",
            nacimiento:"",
            sexo:0,
            estadoCivil:0,
            nacionalidad:0,
            estudios:0,
            profesion:0,
            capConstructiva:0,
            depLaboral:0,
            relacionJF:0,
            ingresoNeto:"",
            mail:"",
            telefono:"",
            jubilado:"",
            carnetJubilacion:"",
            discapacidad:""
        };
    };

}

