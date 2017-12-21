angular.module('webS').controller('FamiliaController',
    [ '$scope', '$rootScope', '$sce', '$uibModal','$location', 'familiaService','personaService','jefeFamiliaService', FamiliaController ]);
function FamiliaController($scope,$rootScope, $sce, $uibModal, $location, familiaService,personaService, jefeFamiliaService ) {
//---
    document.body.scrollTop = document.documentElement.scrollTop = 0;
//--
var idFamilia =$rootScope.idFamilia;
$scope.editandoJF=false;

$scope.titulo = "Familia";
$scope.DNIBusqueda = "";
$scope.loading = false;

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

    depLaboral:0,
    relacionJF:0,
    DescRelacionJF:"",
    ingresoNeto:0,
    mail:"",
    telefono:"",
    jubilado:"",
    carnetJubilacion:"",
    Discapacidad:"",
    idEdicion:0,
    editando:false,
    idTelefono:0,
    idFamilia:0,
    busqueda:false,
    discapacidadCombo:0,
    enfermedad:false,
    enfermedadDescripcion:"",
    capacidadesConstructivas:{
        pintor:false,
        pocero:false,
        techador:false,
        ceramista:false,
        yesero:false,
        soldador:false,
        vidriero:false,
        opMaq:false
    },
    subsidio: {
        nacional: false,
        provincial: false,
        municipal: false
    },
    adjudicatarioPlanEstatal: false,
    situacionesEspeciales: {
        enfermedadCronica: false,
        excombatiente: false,
        victimaViolencia: false,
        asociacionGremio: false,
        asociacionEntidadPublica: false
    }
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

    depLaboral:"",
    trabajoDependencia:{
        empresa:"",
        fechaIngreso:"",
        idLocalidad:"",
        barrio:"",
        direccionFull:"",
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
    ingresoNeto:0,
    mail:"",
    telefono:"",
    jubilado:false,
    relacionJF:99,
    DescRelacionJF:"Jefe/a de Familia",
    carnetJubilacion:"",
    discapacidad:false,
    idEdicion:0,
    editando:false,
    idTelefono:0,
    idFamilia:0,
    busqueda:false,
    discapacidadCombo:0,
    enfermedad:false,
    enfermedadDescripcion:"",
    capacidadesConstructivas:{
        pintor:false,
        pocero:false,
        techador:false,
        ceramista:false,
        yesero:false,
        soldador:false,
        vidriero:false,
        opMaq:false
    },
    subsidio: {
        nacional: false,
        provincial: false,
        municipal: false
    },
    adjudicatarioPlanEstatal: false,
    situacionesEspeciales: {
        enfermedadCronica: false,
        excombatiente: false,
        victimaViolencia: false,
        asociacionGremio: false,
        asociacionEntidadPublica: false
    }
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
$scope.discapacidades=[
    {
    id_Discapacidad:0,
    descripcion:"-SELECCIONE-"
    }
    ];

//Combo de resultado de carga
$scope.resultadosBusqueda=[];
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



    $scope.persona.depLaboral = $scope.depLaborales[0].id_DependenciaLaboral;
    $scope.jefeDeFamilia.depLaboral = $scope.depLaborales[0].id_DependenciaLaboral;

    $scope.persona.relacionJF = $scope.relacionJF[0].id_RolFamiliar;
    $scope.jefeDeFamilia.trabajoDependencia.idLocalidad = $scope.Localidades[0].id_Localidad;

    $scope.persona.discapacidadCombo = $scope.discapacidades[0].id_Discapacidad;
    $scope.jefeDeFamilia.discapacidadCombo = $scope.discapacidades[0].id_Discapacidad;
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
        cargarCombo($scope.discapacidades, datos.discapacidades);
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
      var integrante;
      if(resp.data.telefono){
          integrante ={
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
              depLaboral:resp.data.situacionLaboral.id_DependenciaLaboral,
              relacionJF:resp.data.rolFamiliar.id_RolFamiliar,
              DescRelacionJF:resp.data.rolFamiliar.rolFamiliar,
              ingresoNeto:resp.data.ingresoNeto,
              mail:resp.data.mail,
              idTelefono: resp.data.telefono.id_Telefono,
              telefono: resp.data.telefono.numero,
              jubilado:jubiladoChk,
              carnetJubilacion:resp.data.nroCarnetJubilacion,
              discapacidad:false,
              editando:false,
              discapacidadCombo:resp.data.discapacidad.id_Discapacidad,
              enfermedadCronica:false,
              enfermedadDescripcion:resp.data.descripcionEnfermedad,
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
              capacidadesConstructivas:{
                  pintor:false,
                  pocero:false,
                  techador:false,
                  ceramista:false,
                  yesero:false,
                  soldador:false,
                  vidriero:false,
                  opMaq:false
              },
              subsidio: {
                  nacional: resp.data.subsidio.nacional,
                  provincial: resp.data.subsidio.provincial,
                  municipal: resp.data.subsidio.municipal
              },
              adjudicatarioPlanEstatal: resp.data.adjudicatarioPlanEstatal,
              situacionesEspeciales: {
                  enfermedadCronica: resp.data.situacionesEspeciales.enfermedadCronica,
                  excombatiente: resp.data.situacionesEspeciales.excombatiente,
                  victimaViolencia: resp.data.situacionesEspeciales.victimaViolencia,
                  asociacionGremio: resp.data.situacionesEspeciales.asociacionGremio,
                  asociacionEntidadPublica: resp.data.situacionesEspeciales.asociacionEntidadPublica
              }
          };
      }
      else {
          integrante ={
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

              depLaboral:resp.data.situacionLaboral.id_DependenciaLaboral,
              relacionJF:resp.data.rolFamiliar.id_RolFamiliar,
              DescRelacionJF:resp.data.rolFamiliar.rolFamiliar,
              ingresoNeto:resp.data.ingresoNeto,
              mail:resp.data.mail,
              telefono: "",
              jubilado:jubiladoChk,
              carnetJubilacion:resp.data.nroCarnetJubilacion,
              discapacidad:false,
              editando:false,
              discapacidadCombo:resp.data.discapacidad.id_Discapacidad,
              enfermedadCronica:false,
              enfermedadDescripcion:resp.data.descripcionEnfermedad,
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
              capacidadesConstructivas:{
                  pintor:false,
                  pocero:false,
                  techador:false,
                  ceramista:false,
                  yesero:false,
                  soldador:false,
                  vidriero:false,
                  opMaq:false
              },
              subsidio: {
                  nacional: resp.data.subsidio.nacional,
                  provincial: resp.data.subsidio.provincial,
                  municipal: resp.data.subsidio.municipal
              },
              adjudicatarioPlanEstatal: resp.data.adjudicatarioPlanEstatal,
              situacionesEspeciales: {
                  enfermedadCronica: resp.data.situacionesEspeciales.enfermedadCronica,
                  excombatiente: resp.data.situacionesEspeciales.excombatiente,
                  victimaViolencia: resp.data.situacionesEspeciales.victimaViolencia,
                  asociacionGremio: resp.data.situacionesEspeciales.asociacionGremio,
                  asociacionEntidadPublica: resp.data.situacionesEspeciales.asociacionEntidadPublica
              }
          };
      }
      getCapCons(resp.data.capacidadesConstructivas,integrante);
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
              if(integrante.trabajoDependencia.telefono){
                  integrante.trabajoDependencia.telefono = resp.data.telefono.numero;
                  integrante.trabajoDependencia.idTelefono = resp.data.telefono.id_Telefono;
              }
              else{
                  integrante.trabajoDependencia.telefono = "";
                  integrante.trabajoDependencia.idTelefono = 0;
              }
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
}
$scope.addjefeDeFamilia = function(){
    valid = ejecutarValidacionesJF();
    if(valid){
        var telefonoReq;
        if($scope.jefeDeFamilia.telefono != ""){
            telefonoReq = {
                "celular":$scope.jefeDeFamilia.celular || false,
                "numero":$scope.jefeDeFamilia.telefono}
        }
        else {
            telefonoReq = null;
        }
        var capConst = mapearCapCons($scope.jefeDeFamilia);

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
            "telefono": telefonoReq,
            "rolFamiliar": {"id_RolFamiliar": 1},
            "active": true,
            "discapacidad":{
                "id_Discapacidad":$scope.jefeDeFamilia.discapacidadCombo
            },
            "enfermedadCronica":$scope.jefeDeFamilia.enfermedad,
            "descripcionEnfermedad":$scope.jefeDeFamilia.enfermedadDescripcion,
            "capacidadesConstructivas":capConst,
            "subsidio": {
                "nacional": $scope.jefeDeFamilia.subsidio.nacional,
                "provincial": $scope.jefeDeFamilia.subsidio.provincial,
                "municipal": $scope.jefeDeFamilia.subsidio.municipal
            },
            "adjudicatarioPlanEstatal": $scope.jefeDeFamilia.adjudicatarioPlanEstatal,
            "situacionesEspeciales": {
                "enfermedadCronica": $scope.jefeDeFamilia.situacionesEspeciales.enfermedadCronica,
                "excombatiente": $scope.jefeDeFamilia.situacionesEspeciales.excombatiente,
                "victimaViolencia": $scope.jefeDeFamilia.situacionesEspeciales.victimaViolencia,
                "asociacionGremio": $scope.jefeDeFamilia.situacionesEspeciales.asociacionGremio,
                "asociacionEntidadPublica": $scope.jefeDeFamilia.situacionesEspeciales.asociacionEntidadPublica
            }


        };
        personaService.add(jefeReq).then(function(resp){
            debugger;
            if(resp.status == 409)
            {
                showNotification(resp.data.message, 'danger');
            }
            else {
                $rootScope.idJefe = resp.data.id_Persona;


                if (resp.data.situacionLaboral.id_DependenciaLaboral == 1) {

                    var addressInput = document.getElementById('adress-jf').value;
                    var geocoder = new google.maps.Geocoder();


                    geocoder.geocode({address: addressInput}, function (results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            var myResult = results[0].geometry.location; // reference LatLng value
                            var num;
                            var calle;
                            if (isNaN(results[0].address_components[0].long_name)) {
                                var direccion = addressInput.substr(0, addressInput.indexOf(','));
                                var partes = direccion.split(/[\s,]+/);
                                var numero = partes [partes.length - 1];
                                num = Number(numero);
                                calle = results[0].address_components[0].long_name;

                            } else {
                                num = Number(results[0].address_components[0].long_name);
                                calle = results[0].address_components[1].long_name;
                            }
                            var lat = results[0].geometry.location.lat();
                            var lng = results[0].geometry.location.lng();
                            var telefonoTrabajo;
                            if ($scope.jefeDeFamilia.trabajoDependencia.telefono) {
                                telefonoTrabajo = {
                                    "numero": $scope.jefeDeFamilia.trabajoDependencia.telefono,
                                    "celular": false,
                                    "active": true
                                };
                            }
                            else {
                                telefonoTrabajo = null;
                            }
                            var trabajoDependencia = {
                                "empresa": $scope.jefeDeFamilia.trabajoDependencia.empresa,
                                "fechaIngreso": $scope.jefeDeFamilia.trabajoDependencia.fechaIngreso,
                                "persona": {
                                    "id_Persona": $rootScope.idJefe
                                },
                                "telefono": telefonoTrabajo,
                                "direccion": {
                                    "calle": calle,
                                    "numero": num,
                                    "dpto": "",
                                    "barrio": $scope.jefeDeFamilia.trabajoDependencia.barrio,
                                    "latitud": lat,
                                    "longitud": lng,
                                    "localidad": {
                                        "id_Localidad": $scope.jefeDeFamilia.trabajoDependencia.idLocalidad,
                                        "localidad": "",
                                        "isActive": true
                                    },
                                    "isActive": true
                                },
                                "active": true
                            };
                            debugger;
                            familiaService.addRelacionDep(trabajoDependencia).then(function (resp) {
                                $rootScope.idDependencia = resp.data.id_TrabajoDependencia;
                                $location.path('/family');
                            });
                        }
                        else {
                            alert("Se ha producido un error inesperado con el servicio de Google Maps.");
                        }
                    });

                }
                else if (resp.data.situacionLaboral.id_DependenciaLaboral == 2) {
                    var trabajoAutonomo = {
                        "persona": {
                            "id_Persona": $rootScope.idJefe
                        },
                        "fechaInicioActividades": $scope.jefeDeFamilia.trabajoAutonomo.inicioActividades,
                        "active": true
                    };
                    familiaService.addAutonomo(trabajoAutonomo).then(function (resp) {
                        $rootScope.idAutonomo = resp.data.id_TrabajoAutonomo;
                        $location.path('/family');
                    });

                }
                else {
                    $location.path('/family');
                }
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
        var telefonoJefeEdit;
        if($scope.jefeDeFamilia.idTelefono!=0){
            telefonoJefeEdit = {
                "id_Telefono":$scope.jefeDeFamilia.idTelefono,
                "celular":$scope.jefeDeFamilia.celular,
                "numero":$scope.jefeDeFamilia.telefono};
        }
         else if($scope.jefeDeFamilia.idTelefono==0 && $scope.jefeDeFamilia.telefono){
            telefonoJefeEdit={
                "celular":$scope.jefeDeFamilia.celular,
                "numero":$scope.jefeDeFamilia.telefono};
        }
        else{
            telefonoJefeEdit=null;
        }
        var capConst = mapearCapCons($scope.jefeDeFamilia);
        var jefeReqEdit = {
            "id_Persona":$rootScope.idJefe || $scope.jefeDeFamilia.idEdicion,
            "nombre": $scope.jefeDeFamilia.nombre,
            "apellido":$scope.jefeDeFamilia.apellido ,
            "nroDocumento": $scope.jefeDeFamilia.DNI,
            "nroCuil": $scope.jefeDeFamilia.CUIL,
            "fechaNacimiento":$scope.jefeDeFamilia.nacimiento,
            "ingresoNeto": $scope.jefeDeFamilia.ingresoNeto,
            "mail": $scope.jefeDeFamilia.mail,
            "tipoDocumento": {"id_TipoDocumento": $scope.jefeDeFamilia.tipoDni},
            "familia": {"id_Familia": idFamilia || $scope.jefeDeFamilia.idFamilia},
            "situacionLaboral": {"id_DependenciaLaboral": $scope.jefeDeFamilia.depLaboral},
            "sexo": {"id_Sexo": $scope.jefeDeFamilia.sexo},
            "estadoCivil": {"id_EstadoCivil": $scope.jefeDeFamilia.estadoCivil},
            "nacionalidad": {"id_Nacionalidad": $scope.jefeDeFamilia.nacionalidad},
            "localidad": {"id_Localidad":1},
            "estudios": {"id_Estudios": $scope.jefeDeFamilia.estudios},
            "profesion": {"id_Profesion": $scope.jefeDeFamilia.profesion},
            "telefono":telefonoJefeEdit ,
            "rolFamiliar": {"id_RolFamiliar": 1},
            "active": true,

            "discapacidad":{
                "id_Discapacidad":$scope.jefeDeFamilia.discapacidadCombo
            },
            "enfermedadCronica":$scope.jefeDeFamilia.enfermedad,
            "descripcionEnfermedad":$scope.jefeDeFamilia.enfermedadDescripcion,
            "capacidadesConstructivas":capConst,
            "subsidio": {
                "nacional": $scope.jefeDeFamilia.subsidio.nacional,
                "provincial": $scope.jefeDeFamilia.subsidio.provincial,
                "municipal": $scope.jefeDeFamilia.subsidio.municipal
            },
            "adjudicatarioPlanEstatal": $scope.jefeDeFamilia.adjudicatarioPlanEstatal,
            "situacionesEspeciales": {
                "enfermedadCronica": $scope.jefeDeFamilia.situacionesEspeciales.enfermedadCronica,
                "excombatiente": $scope.jefeDeFamilia.situacionesEspeciales.excombatiente,
                "victimaViolencia": $scope.jefeDeFamilia.situacionesEspeciales.victimaViolencia,
                "asociacionGremio": $scope.jefeDeFamilia.situacionesEspeciales.asociacionGremio,
                "asociacionEntidadPublica": $scope.jefeDeFamilia.situacionesEspeciales.asociacionEntidadPublica
            }
        };
        if(!$rootScope.idJefe){
            $rootScope.idJefe = $scope.jefeDeFamilia.idEdicion;
        }
        personaService.update(jefeReqEdit).then(function(resp){
            if(resp.status == 409)
            {
                showNotification(resp.data.message, 'danger');
            }
            else {
                if (jefeReqEdit.situacionLaboral.id_DependenciaLaboral == 1) {
                    var telefonoTrabajo;
                    if ($scope.jefeDeFamilia.trabajoDependencia.idTelefono != 0) {
                        telefonoTrabajo = {
                            "id_Telefono": $scope.jefeDeFamilia.trabajoDependencia.idTelefono,
                            "numero": $scope.jefeDeFamilia.trabajoDependencia.telefono,
                            "celular": false,
                            "active": true
                        };
                    }
                    else if ($scope.jefeDeFamilia.trabajoDependencia.idTelefono == 0 && $scope.jefeDeFamilia.trabajoDependencia.telefono) {
                        telefonoTrabajo = {
                            "numero": $scope.jefeDeFamilia.trabajoDependencia.telefono,
                            "celular": false,
                            "active": true
                        };
                    }
                    else {
                        telefonoTrabajo = null;
                    }
                    var trabajoDependencia = {
                        "id_TrabajoDependencia": $rootScope.idDependencia,
                        "empresa": $scope.jefeDeFamilia.trabajoDependencia.empresa,
                        "fechaIngreso": $scope.jefeDeFamilia.trabajoDependencia.fechaIngreso,
                        "persona": {
                            "id_Persona": $rootScope.idJefe
                        },
                        "telefono": telefonoTrabajo,
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
                    familiaService.updateRelacionDep(trabajoDependencia).then(function (resp) {
                        $scope.familia.integrantes.forEach(function (item, index) {
                            if (item.id_Persona == $rootScope.idJefe) {
                                $scope.familia.integrantes.splice(index, 1);
                                return false;
                            }
                        });
                        //todo Falta obtener el id de la relacion de dependencia.
                        personaService.get($rootScope.idJefe).then(function (resp) {
                            var jubiladoChk = false;
                            if (resp.data.nroCarnetJubilacion) {
                                jubiladoChk = true;
                            }
                            var integrante;
                            if (resp.data.telefono) {
                                integrante = {
                                    id_Persona: resp.data.id_Persona,
                                    nombre: resp.data.nombre,
                                    apellido: resp.data.apellido,
                                    tipoDni: resp.data.tipoDocumento.id_TipoDocumento,
                                    DNI: resp.data.nroDocumento,
                                    CUIL: resp.data.nroCuil,
                                    nacimiento: resp.data.fechaNacimiento,
                                    sexo: resp.data.sexo.id_Sexo,
                                    estadoCivil: resp.data.estadoCivil.id_EstadoCivil,
                                    nacionalidad: resp.data.nacionalidad.id_Nacionalidad,
                                    estudios: resp.data.estudios.id_Estudios,
                                    profesion: resp.data.profesion.id_Profesion,

                                    depLaboral: resp.data.situacionLaboral.id_DependenciaLaboral,
                                    relacionJF: resp.data.rolFamiliar.id_RolFamiliar,
                                    DescRelacionJF: resp.data.rolFamiliar.rolFamiliar,
                                    ingresoNeto: resp.data.ingresoNeto,
                                    mail: resp.data.mail,
                                    idTelefono: resp.data.telefono.id_Telefono,
                                    telefono: resp.data.telefono.numero,
                                    jubilado: jubiladoChk,
                                    carnetJubilacion: resp.data.nroCarnetJubilacion,
                                    discapacidad: false,
                                    editando: false,
                                    discapacidadCombo: resp.data.discapacidad.id_Discapacidad,
                                    enfermedadCronica: resp.data.enfermedadCronica,
                                    enfermedadDescripcion: resp.data.descripcionEnfermedad,
                                    capacidadesConstructivas: {
                                        pintor: false,
                                        pocero: false,
                                        techador: false,
                                        ceramista: false,
                                        yesero: false,
                                        soldador: false,
                                        vidriero: false,
                                        opMaq: false
                                    }
                                };
                            }
                            else {
                                integrante = {
                                    id_Persona: resp.data.id_Persona,
                                    nombre: resp.data.nombre,
                                    apellido: resp.data.apellido,
                                    tipoDni: resp.data.tipoDocumento.id_TipoDocumento,
                                    DNI: resp.data.nroDocumento,
                                    CUIL: resp.data.nroCuil,
                                    nacimiento: resp.data.fechaNacimiento,
                                    sexo: resp.data.sexo.id_Sexo,
                                    estadoCivil: resp.data.estadoCivil.id_EstadoCivil,
                                    nacionalidad: resp.data.nacionalidad.id_Nacionalidad,
                                    estudios: resp.data.estudios.id_Estudios,
                                    profesion: resp.data.profesion.id_Profesion,

                                    depLaboral: resp.data.situacionLaboral.id_DependenciaLaboral,
                                    relacionJF: resp.data.rolFamiliar.id_RolFamiliar,
                                    DescRelacionJF: resp.data.rolFamiliar.rolFamiliar,
                                    ingresoNeto: resp.data.ingresoNeto,
                                    mail: resp.data.mail,
                                    telefono: "",
                                    jubilado: jubiladoChk,
                                    carnetJubilacion: resp.data.nroCarnetJubilacion,
                                    discapacidad: false,
                                    editando: false,
                                    discapacidadCombo: resp.data.discapacidad.id_Discapacidad,
                                    enfermedadCronica: resp.data.enfermedadCronica,
                                    enfermedadDescripcion: resp.data.descripcionEnfermedad,
                                    capacidadesConstructivas: {
                                        pintor: false,
                                        pocero: false,
                                        techador: false,
                                        ceramista: false,
                                        yesero: false,
                                        soldador: false,
                                        vidriero: false,
                                        opMaq: false
                                    }
                                };
                            }
                            getCapCons(resp.data.capacidadesConstructivas, integrante);
                            $scope.familia.integrantes.push(integrante);
                            $scope.editandoJF = false;
                        });
                    });
                }
                else if (jefeReqEdit.situacionLaboral.id_DependenciaLaboral == 2) {
                    var trabajoAutonomo = {
                        "persona": {
                            "id_Persona": $rootScope.idJefe
                        },
                        "id_TrabajoAutonomo": $rootScope.idAutonomo,
                        "fechaInicioActividades": $scope.jefeDeFamilia.trabajoAutonomo.inicioActividades,
                        "active": true
                    };
                    familiaService.updateAutonomo(trabajoAutonomo).then(function (resp) {
                        $scope.familia.integrantes.forEach(function (item, index) {
                            if (item.id_Persona == $rootScope.idJefe) {
                                $scope.familia.integrantes.splice(index, 1);
                                return false;
                            }
                        });
                        //todo falta obtener el id del trabajo autonomo
                        personaService.get($rootScope.idJefe).then(function (resp) {
                            var jubiladoChk = false;
                            if (resp.data.nroCarnetJubilacion) {
                                jubiladoChk = true;
                            }
                            var integrante;
                            if (resp.data.telefono) {
                                integrante = {
                                    id_Persona: resp.data.id_Persona,
                                    nombre: resp.data.nombre,
                                    apellido: resp.data.apellido,
                                    tipoDni: resp.data.tipoDocumento.id_TipoDocumento,
                                    DNI: resp.data.nroDocumento,
                                    CUIL: resp.data.nroCuil,
                                    nacimiento: resp.data.fechaNacimiento,
                                    sexo: resp.data.sexo.id_Sexo,
                                    estadoCivil: resp.data.estadoCivil.id_EstadoCivil,
                                    nacionalidad: resp.data.nacionalidad.id_Nacionalidad,
                                    estudios: resp.data.estudios.id_Estudios,
                                    profesion: resp.data.profesion.id_Profesion,

                                    depLaboral: resp.data.situacionLaboral.id_DependenciaLaboral,
                                    relacionJF: resp.data.rolFamiliar.id_RolFamiliar,
                                    DescRelacionJF: resp.data.rolFamiliar.rolFamiliar,
                                    ingresoNeto: resp.data.ingresoNeto,
                                    mail: resp.data.mail,
                                    idTelefono: resp.data.telefono.id_Telefono,
                                    telefono: resp.data.telefono.numero,
                                    jubilado: jubiladoChk,
                                    carnetJubilacion: resp.data.nroCarnetJubilacion,
                                    discapacidad: false,
                                    editando: false,
                                    discapacidadCombo: resp.data.discapacidad.id_Discapacidad,
                                    enfermedadCronica: false,
                                    enfermedadDescripcion: resp.data.descripcionEnfermedad,
                                    capacidadesConstructivas: {
                                        pintor: false,
                                        pocero: false,
                                        techador: false,
                                        ceramista: false,
                                        yesero: false,
                                        soldador: false,
                                        vidriero: false,
                                        opMaq: false
                                    },
                                    subsidio: {
                                        nacional: resp.data.subsidio.nacional,
                                        provincial: resp.data.subsidio.provincial,
                                        municipal: resp.data.subsidio.municipal
                                    },
                                    adjudicatarioPlanEstatal: resp.data.adjudicatarioPlanEstatal,
                                    situacionesEspeciales: {
                                        enfermedadCronica: resp.data.situacionesEspeciales.enfermedadCronica,
                                        excombatiente: resp.data.situacionesEspeciales.excombatiente,
                                        victimaViolencia: resp.data.situacionesEspeciales.victimaViolencia,
                                        asociacionGremio: resp.data.situacionesEspeciales.asociacionGremio,
                                        asociacionEntidadPublica: resp.data.situacionesEspeciales.asociacionEntidadPublica
                                    }
                                };
                            }
                            else {
                                integrante = {
                                    id_Persona: resp.data.id_Persona,
                                    nombre: resp.data.nombre,
                                    apellido: resp.data.apellido,
                                    tipoDni: resp.data.tipoDocumento.id_TipoDocumento,
                                    DNI: resp.data.nroDocumento,
                                    CUIL: resp.data.nroCuil,
                                    nacimiento: resp.data.fechaNacimiento,
                                    sexo: resp.data.sexo.id_Sexo,
                                    estadoCivil: resp.data.estadoCivil.id_EstadoCivil,
                                    nacionalidad: resp.data.nacionalidad.id_Nacionalidad,
                                    estudios: resp.data.estudios.id_Estudios,
                                    profesion: resp.data.profesion.id_Profesion,

                                    depLaboral: resp.data.situacionLaboral.id_DependenciaLaboral,
                                    relacionJF: resp.data.rolFamiliar.id_RolFamiliar,
                                    DescRelacionJF: resp.data.rolFamiliar.rolFamiliar,
                                    ingresoNeto: resp.data.ingresoNeto,
                                    mail: resp.data.mail,
                                    telefono: "",
                                    jubilado: jubiladoChk,
                                    carnetJubilacion: resp.data.nroCarnetJubilacion,
                                    discapacidad: false,
                                    editando: false,
                                    discapacidadCombo: resp.data.discapacidad.id_Discapacidad,
                                    enfermedadCronica: false,
                                    enfermedadDescripcion: resp.data.descripcionEnfermedad,
                                    capacidadesConstructivas: {
                                        pintor: false,
                                        pocero: false,
                                        techador: false,
                                        ceramista: false,
                                        yesero: false,
                                        soldador: false,
                                        vidriero: false,
                                        opMaq: false
                                    },
                                    subsidio: {
                                        nacional: resp.data.subsidio.nacional,
                                        provincial: resp.data.subsidio.provincial,
                                        municipal: resp.data.subsidio.municipal
                                    },
                                    adjudicatarioPlanEstatal: resp.data.adjudicatarioPlanEstatal,
                                    situacionesEspeciales: {
                                        enfermedadCronica: resp.data.situacionesEspeciales.enfermedadCronica,
                                        excombatiente: resp.data.situacionesEspeciales.excombatiente,
                                        victimaViolencia: resp.data.situacionesEspeciales.victimaViolencia,
                                        asociacionGremio: resp.data.situacionesEspeciales.asociacionGremio,
                                        asociacionEntidadPublica: resp.data.situacionesEspeciales.asociacionEntidadPublica
                                    }
                                };
                            }
                            getCapCons(resp.data.capacidadesConstructivas, integrante);
                            $scope.familia.integrantes.push(integrante);
                            $scope.editandoJF = false;
                        });
                    });

                }
                else {
                    if ($scope.jefeDeFamilia.busqueda) {
                        $scope.resultadosBusqueda.forEach(function (item, index) {
                            if (item.id_Persona == $scope.jefeDeFamilia.idEdicion) {
                                $scope.resultadosBusqueda.splice(index, 1);
                                return false;
                            }
                        });
                        personaService.get($scope.jefeDeFamilia.idEdicion).then(function (resp) {
                            var jubiladoChk = false;
                            if (resp.data.nroCarnetJubilacion) {
                                jubiladoChk = true;
                            }
                            var integrante;
                            if (resp.data.telefono) {
                                integrante = {
                                    id_Persona: resp.data.id_Persona,
                                    nombre: resp.data.nombre,
                                    apellido: resp.data.apellido,
                                    tipoDni: resp.data.tipoDocumento.id_TipoDocumento,
                                    DNI: resp.data.nroDocumento,
                                    CUIL: resp.data.nroCuil,
                                    nacimiento: resp.data.fechaNacimiento,
                                    sexo: resp.data.sexo.id_Sexo,
                                    estadoCivil: resp.data.estadoCivil.id_EstadoCivil,
                                    nacionalidad: resp.data.nacionalidad.id_Nacionalidad,
                                    estudios: resp.data.estudios.id_Estudios,
                                    profesion: resp.data.profesion.id_Profesion,

                                    depLaboral: resp.data.situacionLaboral.id_DependenciaLaboral,
                                    relacionJF: resp.data.rolFamiliar.id_RolFamiliar,
                                    DescRelacionJF: resp.data.rolFamiliar.rolFamiliar,
                                    ingresoNeto: resp.data.ingresoNeto,
                                    mail: resp.data.mail,
                                    idTelefono: resp.data.telefono.id_Telefono,
                                    telefono: resp.data.telefono.numero,
                                    jubilado: jubiladoChk,
                                    carnetJubilacion: resp.data.nroCarnetJubilacion,
                                    discapacidad: false,
                                    editando: false,
                                    discapacidadCombo: resp.data.discapacidad.id_Discapacidad,
                                    enfermedadCronica: resp.data.enfermedadCronica,
                                    enfermedadDescripcion: resp.data.descripcionEnfermedad,
                                    trabajoDependencia: {
                                        empresa: "",
                                        fechaIngreso: "",
                                        idLocalidad: "",
                                        barrio: "",
                                        direccion: {
                                            idDireccion: 0,
                                            calle: "",
                                            numero: "",
                                            pisoDepto: ""
                                        },
                                        idTelefono: 0,
                                        telefono: "",
                                        celular: false
                                    },
                                    trabajoAutonomo: {
                                        inicioActividades: ""
                                    },
                                    capacidadesConstructivas: {
                                        pintor: false,
                                        pocero: false,
                                        techador: false,
                                        ceramista: false,
                                        yesero: false,
                                        soldador: false,
                                        vidriero: false,
                                        opMaq: false
                                    },
                                    subsidio: {
                                        nacional: resp.data.subsidio.nacional,
                                        provincial: resp.data.subsidio.provincial,
                                        municipal: resp.data.subsidio.municipal
                                    },
                                    adjudicatarioPlanEstatal: resp.data.adjudicatarioPlanEstatal,
                                    situacionesEspeciales: {
                                        enfermedadCronica: resp.data.situacionesEspeciales.enfermedadCronica,
                                        excombatiente: resp.data.situacionesEspeciales.excombatiente,
                                        victimaViolencia: resp.data.situacionesEspeciales.victimaViolencia,
                                        asociacionGremio: resp.data.situacionesEspeciales.asociacionGremio,
                                        asociacionEntidadPublica: resp.data.situacionesEspeciales.asociacionEntidadPublica
                                    }
                                };
                            }
                            else {
                                integrante = {
                                    id_Persona: resp.data.id_Persona,
                                    nombre: resp.data.nombre,
                                    apellido: resp.data.apellido,
                                    tipoDni: resp.data.tipoDocumento.id_TipoDocumento,
                                    DNI: resp.data.nroDocumento,
                                    CUIL: resp.data.nroCuil,
                                    nacimiento: resp.data.fechaNacimiento,
                                    sexo: resp.data.sexo.id_Sexo,
                                    estadoCivil: resp.data.estadoCivil.id_EstadoCivil,
                                    nacionalidad: resp.data.nacionalidad.id_Nacionalidad,
                                    estudios: resp.data.estudios.id_Estudios,
                                    profesion: resp.data.profesion.id_Profesion,

                                    depLaboral: resp.data.situacionLaboral.id_DependenciaLaboral,
                                    relacionJF: resp.data.rolFamiliar.id_RolFamiliar,
                                    DescRelacionJF: resp.data.rolFamiliar.rolFamiliar,
                                    ingresoNeto: resp.data.ingresoNeto,
                                    mail: resp.data.mail,
                                    telefono: "",
                                    jubilado: jubiladoChk,
                                    carnetJubilacion: resp.data.nroCarnetJubilacion,
                                    discapacidad: false,
                                    editando: false,
                                    discapacidadCombo: resp.data.discapacidad.id_Discapacidad,
                                    enfermedadCronica: resp.data.enfermedadCronica,
                                    enfermedadDescripcion: resp.data.descripcionEnfermedad,
                                    trabajoDependencia: {
                                        empresa: "",
                                        fechaIngreso: "",
                                        idLocalidad: "",
                                        barrio: "",
                                        direccion: {
                                            idDireccion: 0,
                                            calle: "",
                                            numero: "",
                                            pisoDepto: ""
                                        },
                                        idTelefono: 0,
                                        telefono: "",
                                        celular: false
                                    },
                                    trabajoAutonomo: {
                                        inicioActividades: ""
                                    },
                                    capacidadesConstructivas: {
                                        pintor: false,
                                        pocero: false,
                                        techador: false,
                                        ceramista: false,
                                        yesero: false,
                                        soldador: false,
                                        vidriero: false,
                                        opMaq: false
                                    },
                                    subsidio: {
                                        nacional: resp.data.subsidio.nacional,
                                        provincial: resp.data.subsidio.provincial,
                                        municipal: resp.data.subsidio.municipal
                                    },
                                    adjudicatarioPlanEstatal: resp.data.adjudicatarioPlanEstatal,
                                    situacionesEspeciales: {
                                        enfermedadCronica: resp.data.situacionesEspeciales.enfermedadCronica,
                                        excombatiente: resp.data.situacionesEspeciales.excombatiente,
                                        victimaViolencia: resp.data.situacionesEspeciales.victimaViolencia,
                                        asociacionGremio: resp.data.situacionesEspeciales.asociacionGremio,
                                        asociacionEntidadPublica: resp.data.situacionesEspeciales.asociacionEntidadPublica
                                    }
                                };
                            }
                            getCapCons(resp.data.capacidadesConstructivas, integrante);
                            //todo falta logica de trabajos. Resolver problema con los id antes.
                            $scope.resultadosBusqueda.push(integrante);
                            $scope.editandoJF = false;
                        });
                    }
                    else {
                        $scope.familia.integrantes.forEach(function (item, index) {
                            if (item.id_Persona == $rootScope.idJefe) {
                                $scope.familia.integrantes.splice(index, 1);
                                return false;
                            }
                        });
                        personaService.get($rootScope.idJefe).then(function (resp) {
                            var jubiladoChk = false;
                            if (resp.data.nroCarnetJubilacion) {
                                jubiladoChk = true;
                            }
                            var integrante;
                            if (resp.data.telefono) {
                                integrante = {
                                    id_Persona: $rootScope.idJefe,
                                    nombre: resp.data.nombre,
                                    apellido: resp.data.apellido,
                                    tipoDni: resp.data.tipoDocumento.id_TipoDocumento,
                                    DNI: resp.data.nroDocumento,
                                    CUIL: resp.data.nroCuil,
                                    nacimiento: resp.data.fechaNacimiento,
                                    sexo: resp.data.sexo.id_Sexo,
                                    estadoCivil: resp.data.estadoCivil.id_EstadoCivil,
                                    nacionalidad: resp.data.nacionalidad.id_Nacionalidad,
                                    estudios: resp.data.estudios.id_Estudios,
                                    profesion: resp.data.profesion.id_Profesion,

                                    depLaboral: resp.data.situacionLaboral.id_DependenciaLaboral,
                                    relacionJF: resp.data.rolFamiliar.id_RolFamiliar,
                                    DescRelacionJF: resp.data.rolFamiliar.rolFamiliar,
                                    ingresoNeto: resp.data.ingresoNeto,
                                    mail: resp.data.mail,
                                    idTelefono: resp.data.telefono.id_Telefono,
                                    telefono: resp.data.telefono.numero,
                                    jubilado: jubiladoChk,
                                    carnetJubilacion: resp.data.nroCarnetJubilacion,
                                    discapacidad: false,
                                    editando: false,
                                    discapacidadCombo: resp.data.discapacidad.id_Discapacidad,
                                    enfermedadCronica: resp.data.enfermedadCronica,
                                    enfermedadDescripcion: resp.data.descripcionEnfermedad,
                                    trabajoDependencia: {
                                        empresa: "",
                                        fechaIngreso: "",
                                        idLocalidad: "",
                                        barrio: "",
                                        direccion: {
                                            idDireccion: 0,
                                            calle: "",
                                            numero: "",
                                            pisoDepto: ""
                                        },
                                        idTelefono: 0,
                                        telefono: "",
                                        celular: false
                                    },
                                    trabajoAutonomo: {
                                        inicioActividades: ""
                                    },
                                    capacidadesConstructivas: {
                                        pintor: false,
                                        pocero: false,
                                        techador: false,
                                        ceramista: false,
                                        yesero: false,
                                        soldador: false,
                                        vidriero: false,
                                        opMaq: false
                                    }
                                };
                            }
                            else {
                                integrante = {
                                    id_Persona: $rootScope.idJefe,
                                    nombre: resp.data.nombre,
                                    apellido: resp.data.apellido,
                                    tipoDni: resp.data.tipoDocumento.id_TipoDocumento,
                                    DNI: resp.data.nroDocumento,
                                    CUIL: resp.data.nroCuil,
                                    nacimiento: resp.data.fechaNacimiento,
                                    sexo: resp.data.sexo.id_Sexo,
                                    estadoCivil: resp.data.estadoCivil.id_EstadoCivil,
                                    nacionalidad: resp.data.nacionalidad.id_Nacionalidad,
                                    estudios: resp.data.estudios.id_Estudios,
                                    profesion: resp.data.profesion.id_Profesion,

                                    depLaboral: resp.data.situacionLaboral.id_DependenciaLaboral,
                                    relacionJF: resp.data.rolFamiliar.id_RolFamiliar,
                                    DescRelacionJF: resp.data.rolFamiliar.rolFamiliar,
                                    ingresoNeto: resp.data.ingresoNeto,
                                    mail: resp.data.mail,
                                    telefono: "",
                                    jubilado: jubiladoChk,
                                    carnetJubilacion: resp.data.nroCarnetJubilacion,
                                    discapacidad: false,
                                    editando: false,
                                    discapacidadCombo: resp.data.discapacidad.id_Discapacidad,
                                    enfermedadCronica: resp.data.enfermedadCronica,
                                    enfermedadDescripcion: resp.data.descripcionEnfermedad,
                                    trabajoDependencia: {
                                        empresa: "",
                                        fechaIngreso: "",
                                        idLocalidad: "",
                                        barrio: "",
                                        direccion: {
                                            idDireccion: 0,
                                            calle: "",
                                            numero: "",
                                            pisoDepto: ""
                                        },
                                        idTelefono: 0,
                                        telefono: "",
                                        celular: false
                                    },
                                    trabajoAutonomo: {
                                        inicioActividades: ""
                                    },
                                    capacidadesConstructivas: {
                                        pintor: false,
                                        pocero: false,
                                        techador: false,
                                        ceramista: false,
                                        yesero: false,
                                        soldador: false,
                                        vidriero: false,
                                        opMaq: false
                                    }
                                };
                            }
                            getCapCons(resp.data.capacidadesConstructivas, integrante);
                            $scope.familia.integrantes.push(integrante);
                            $scope.editandoJF = false;
                        });

                    }


                }
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
        if ($scope.persona.editando) {
        var telefonoPersonaEdit;
        if($scope.persona.idTelefono == 0 && $scope.persona.telefono){
            telefonoPersonaEdit = {
                "celular": $scope.persona.celular,
                "numero": $scope.persona.telefono
            };
        }
        else if($scope.persona.idTelefono != 0 && $scope.persona.telefono){
            telefonoPersonaEdit = {
                "id_Telefono": $scope.persona.idTelefono,
                "celular": $scope.persona.celular,
                "numero": $scope.persona.telefono
            };
        }
        else {
            telefonoPersonaEdit=null;
        }
        var capConst = mapearCapCons($scope.persona);
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
            "familia": {"id_Familia": idFamilia || $scope.persona.idFamilia},
            "situacionLaboral": {"id_DependenciaLaboral": $scope.persona.depLaboral},
            "sexo": {"id_Sexo": $scope.persona.sexo},
            "estadoCivil": {"id_EstadoCivil": $scope.persona.estadoCivil},
            "nacionalidad": {"id_Nacionalidad": $scope.persona.nacionalidad},
            "localidad": {"id_Localidad": 1},
            "estudios": {"id_Estudios": $scope.persona.estudios},
            "profesion": {"id_Profesion": $scope.persona.profesion},
            "telefono": telefonoPersonaEdit ,
            "rolFamiliar": {"id_RolFamiliar": $scope.persona.relacionJF},
            "active": true,

            "discapacidad":{
                "id_Discapacidad":$scope.persona.discapacidadCombo
            },
            "enfermedadCronica":$scope.persona.enfermedad,
            "descripcionEnfermedad":$scope.persona.enfermedadDescripcion,
            "capacidadesConstructivas":capConst,
            "subsidio": {
                "nacional": $scope.persona.subsidio.nacional,
                "provincial": $scope.persona.subsidio.provincial,
                "municipal": $scope.persona.subsidio.municipal
            },
            "adjudicatarioPlanEstatal": $scope.persona.adjudicatarioPlanEstatal,
            "situacionesEspeciales": {
                "enfermedadCronica": $scope.persona.situacionesEspeciales.enfermedadCronica,
                "excombatiente": $scope.persona.situacionesEspeciales.excombatiente,
                "victimaViolencia": $scope.persona.situacionesEspeciales.victimaViolencia,
                "asociacionGremio": $scope.persona.situacionesEspeciales.asociacionGremio,
                "asociacionEntidadPublica": $scope.persona.situacionesEspeciales.asociacionEntidadPublica
            }

        };


            personaService.update(reqEdicion).then(function (resp) {
                if(resp.status == 409)
                {
                    showNotification(resp.data.message, 'danger');
                }
                else {
                    if ($scope.persona.busqueda) {
                        $scope.resultadosBusqueda.forEach(function (item, index) {
                            if (item.id_Persona == reqEdicion.id_Persona) {
                                $scope.resultadosBusqueda.splice(index, 1);
                                return false;
                            }
                        });
                        personaService.get(reqEdicion.id_Persona).then(function (resp) {
                            var jubiladoChk = false;
                            if (resp.data.nroCarnetJubilacion) {
                                jubiladoChk = true;
                            }
                            var telefonoInt;
                            var idTelefonoInt;
                            if (resp.data.telefono) {
                                telefonoInt = resp.data.telefono.numero;
                                idTelefonoInt = resp.data.telefono.id_Telefono;
                            }
                            else {
                                telefonoInt = "";
                                idTelefonoInt = -1;
                            }
                            var integrante = {
                                id_Persona: resp.data.id_Persona,
                                nombre: resp.data.nombre,
                                apellido: resp.data.apellido,
                                tipoDni: resp.data.tipoDocumento.id_TipoDocumento,
                                DNI: resp.data.nroDocumento,
                                CUIL: resp.data.nroCuil,
                                nacimiento: resp.data.fechaNacimiento,
                                sexo: resp.data.sexo.id_Sexo,
                                estadoCivil: resp.data.estadoCivil.id_EstadoCivil,
                                nacionalidad: resp.data.nacionalidad.id_Nacionalidad,
                                estudios: resp.data.estudios.id_Estudios,
                                profesion: resp.data.profesion.id_Profesion,

                                depLaboral: resp.data.situacionLaboral.id_DependenciaLaboral,
                                relacionJF: resp.data.rolFamiliar.id_RolFamiliar,
                                DescRelacionJF: resp.data.rolFamiliar.rolFamiliar,
                                ingresoNeto: resp.data.ingresoNeto,
                                mail: resp.data.mail,
                                telefono: telefonoInt,
                                idTelefono: idTelefonoInt,
                                jubilado: jubiladoChk,
                                carnetJubilacion: resp.data.nroCarnetJubilacion,
                                discapacidad: false,
                                discapacidadCombo: resp.data.discapacidad.id_Discapacidad,
                                enfermedadCronica: resp.data.enfermedadCronica,
                                enfermedadDescripcion: resp.data.descripcionEnfermedad,
                                editando: false,
                                capacidadesConstructivas: {
                                    pintor: false,
                                    pocero: false,
                                    techador: false,
                                    ceramista: false,
                                    yesero: false,
                                    soldador: false,
                                    vidriero: false,
                                    opMaq: false
                                }

                            };
                            getCapCons(resp.data.capacidadesConstructivas, integrante);
                            $scope.resultadosBusqueda.push(integrante);
                            $scope.persona = {
                                id_Persona: 0,
                                nombre: "",
                                apellido: "",
                                tipoDni: 0,
                                DNI: "",
                                CUIL: "",
                                nacimiento: "",
                                sexo: 0,
                                estadoCivil: 0,
                                nacionalidad: 0,
                                estudios: 0,
                                profesion: 0,

                                depLaboral: 0,
                                relacionJF: 0,
                                DescRelacionJF: "",
                                ingresoNeto: "",
                                mail: "",
                                telefono: "",
                                jubilado: "",
                                carnetJubilacion: "",
                                discapacidad: "",
                                idEdicion: 0,
                                editando: false,
                                idTelefono: 0,
                                discapacidadCombo: 0,
                                enfermedadCronica: false,
                                enfermedadDescripcion: "",
                                capacidadesConstructivas: {
                                    pintor: false,
                                    pocero: false,
                                    techador: false,
                                    ceramista: false,
                                    yesero: false,
                                    soldador: false,
                                    vidriero: false,
                                    opMaq: false
                                }
                            };
                            $scope.agregando = false;
                        });
                    }
                    else {
                        $scope.familia.integrantes.forEach(function (item, index) {
                            if (item.id_Persona == reqEdicion.id_Persona) {
                                $scope.familia.integrantes.splice(index, 1);
                                return false;
                            }
                        });
                        personaService.get(reqEdicion.id_Persona).then(function (resp) {
                            var jubiladoChk = false;
                            if (resp.data.nroCarnetJubilacion) {
                                jubiladoChk = true;
                            }
                            var telefonoInt;
                            var idTelefonoInt;
                            if (resp.data.telefono) {
                                telefonoInt = Number(resp.data.telefono.numero);
                                idTelefonoInt = resp.data.telefono.id_Telefono;
                            }
                            else {
                                telefonoInt = "";
                                idTelefonoInt = 0;
                            }
                            var integrante = {
                                id_Persona: resp.data.id_Persona,
                                nombre: resp.data.nombre,
                                apellido: resp.data.apellido,
                                tipoDni: resp.data.tipoDocumento.id_TipoDocumento,
                                DNI: resp.data.nroDocumento,
                                CUIL: resp.data.nroCuil,
                                nacimiento: resp.data.fechaNacimiento,
                                sexo: resp.data.sexo.id_Sexo,
                                estadoCivil: resp.data.estadoCivil.id_EstadoCivil,
                                nacionalidad: resp.data.nacionalidad.id_Nacionalidad,
                                estudios: resp.data.estudios.id_Estudios,
                                profesion: resp.data.profesion.id_Profesion,

                                depLaboral: resp.data.situacionLaboral.id_DependenciaLaboral,
                                relacionJF: resp.data.rolFamiliar.id_RolFamiliar,
                                DescRelacionJF: resp.data.rolFamiliar.rolFamiliar,
                                ingresoNeto: resp.data.ingresoNeto,
                                mail: resp.data.mail,
                                telefono: telefonoInt,
                                idTelefono: idTelefonoInt,
                                jubilado: jubiladoChk,
                                carnetJubilacion: resp.data.nroCarnetJubilacion,
                                discapacidad: false,
                                discapacidadCombo: resp.data.discapacidad.id_Discapacidad,
                                enfermedadCronica: resp.data.enfermedadCronica,
                                enfermedadDescripcion: resp.data.descripcionEnfermedad,
                                editando: false,
                                capacidadesConstructivas: {
                                    pintor: false,
                                    pocero: false,
                                    techador: false,
                                    ceramista: false,
                                    yesero: false,
                                    soldador: false,
                                    vidriero: false,
                                    opMaq: false
                                },
                                subsidio: {
                                    nacional: resp.data.subsidio.nacional,
                                    provincial: resp.data.subsidio.provincial,
                                    municipal: resp.data.subsidio.municipal
                                },
                                adjudicatarioPlanEstatal: resp.data.adjudicatarioPlanEstatal,
                                situacionesEspeciales: {
                                    enfermedadCronica: resp.data.situacionesEspeciales.enfermedadCronica,
                                    excombatiente: resp.data.situacionesEspeciales.excombatiente,
                                    victimaViolencia: resp.data.situacionesEspeciales.victimaViolencia,
                                    asociacionGremio: resp.data.situacionesEspeciales.asociacionGremio,
                                    asociacionEntidadPublica: resp.data.situacionesEspeciales.asociacionEntidadPublica
                                }
                            };
                            getCapCons(resp.data.capacidadesConstructivas, integrante);
                            $scope.familia.integrantes.push(integrante);
                            $scope.persona = {
                                id_Persona: 0,
                                nombre: "",
                                apellido: "",
                                tipoDni: 0,
                                DNI: "",
                                CUIL: "",
                                nacimiento: "",
                                sexo: 0,
                                estadoCivil: 0,
                                nacionalidad: 0,
                                estudios: 0,
                                profesion: 0,

                                depLaboral: 0,
                                relacionJF: 0,
                                DescRelacionJF: "",
                                ingresoNeto: "",
                                mail: "",
                                telefono: "",
                                jubilado: "",
                                carnetJubilacion: "",
                                discapacidad: "",
                                idEdicion: 0,
                                editando: false,
                                idTelefono: 0,
                                discapacidadCombo: resp.data.discapacidad.id_Discapacidad,
                                enfermedadCronica: resp.data.enfermedadCronica,
                                enfermedadDescripcion: resp.data.descripcionEnfermedad,
                                capacidadesConstructivas: {
                                    pintor: false,
                                    pocero: false,
                                    techador: false,
                                    ceramista: false,
                                    yesero: false,
                                    soldador: false,
                                    vidriero: false,
                                    opMaq: false
                                },
                                subsidio: {
                                    nacional: false,
                                    provincial: false,
                                    municipal: false
                                },
                                adjudicatarioPlanEstatal: false,
                                situacionesEspeciales: {
                                    enfermedadCronica: false,
                                    excombatiente: false,
                                    victimaViolencia: false,
                                    asociacionGremio: false,
                                    asociacionEntidadPublica: false
                                }
                            };
                            $scope.agregando = false;
                        });

                    }
                }



            });
        }
        else{
            var telefonoPersona;
            if($scope.persona.telefono)
            {
                telefonoPersona={
                    "celular": $scope.persona.celular,
                    "numero": $scope.persona.telefono
                };
            }
            else{
                telefonoPersona=null;
            }
            var capConst = mapearCapCons($scope.persona);
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
                "telefono": telefonoPersona ,
                "rolFamiliar": {"id_RolFamiliar": $scope.persona.relacionJF},
                "active": true,

                "discapacidad":{
                    "id_Discapacidad":$scope.persona.discapacidadCombo
                },
                "enfermedadCronica":$scope.persona.enfermedad,
                "descripcionEnfermedad":$scope.persona.enfermedadDescripcion,
                "capacidadesConstructivas":capConst,
                "subsidio": {
                    "nacional": $scope.persona.subsidio.nacional,
                    "provincial": $scope.persona.subsidio.provincial,
                    "municipal": $scope.persona.subsidio.municipal
                },
                "adjudicatarioPlanEstatal": $scope.persona.adjudicatarioPlanEstatal,
                "situacionesEspeciales": {
                    "enfermedadCronica": $scope.persona.situacionesEspeciales.enfermedadCronica,
                    "excombatiente": $scope.persona.situacionesEspeciales.excombatiente,
                    "victimaViolencia": $scope.persona.situacionesEspeciales.victimaViolencia,
                    "asociacionGremio": $scope.persona.situacionesEspeciales.asociacionGremio,
                    "asociacionEntidadPublica": $scope.persona.situacionesEspeciales.asociacionEntidadPublica
                }
            };
            personaService.add(reqPersona).then(function(resp) {
                if(resp.status == 409)
                {
                    showNotification(resp.data.message, 'danger');
                }
                else{
                    var jubiladoChk = false;
                    if(resp.data.nroCarnetJubilacion)
                    {
                        jubiladoChk = true;
                    }
                    var telefonoInt;
                    var idTelefonoInt;
                    if(resp.data.telefono){
                        telefonoInt = Number(resp.data.telefono.numero);
                        idTelefonoInt = resp.data.telefono.id_Telefono;
                    }
                    else {
                        telefonoInt = "";
                        idTelefonoInt = 0;
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

                        depLaboral:resp.data.situacionLaboral.id_DependenciaLaboral,
                        relacionJF:"",
                        DescRelacionJF:"",
                        ingresoNeto:resp.data.ingresoNeto,
                        mail:resp.data.mail,
                        idTelefono:idTelefonoInt,
                        telefono:telefonoInt,
                        jubilado:jubiladoChk,
                        carnetJubilacion:resp.data.nroCarnetJubilacion,
                        discapacidad:false,
                        editando:false,
                        discapacidadCombo:resp.data.discapacidad.id_Discapacidad,
                        enfermedadCronica:resp.data.enfermedadCronica,
                        enfermedadDescripcion:resp.data.descripcionEnfermedad,
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
                        },
                        capacidadesConstructivas:{
                            pintor:false,
                            pocero:false,
                            techador:false,
                            ceramista:false,
                            yesero:false,
                            soldador:false,
                            vidriero:false,
                            opMaq:false
                        },
                        subsidio: {
                            nacional: resp.data.subsidio.nacional,
                            provincial: resp.data.subsidio.provincial,
                            municipal: resp.data.subsidio.municipal
                        },
                        adjudicatarioPlanEstatal: resp.data.adjudicatarioPlanEstatal,
                        situacionesEspeciales: {
                            enfermedadCronica: resp.data.situacionesEspeciales.enfermedadCronica,
                            excombatiente: resp.data.situacionesEspeciales.excombatiente,
                            victimaViolencia: resp.data.situacionesEspeciales.victimaViolencia,
                            asociacionGremio: resp.data.situacionesEspeciales.asociacionGremio,
                            asociacionEntidadPublica: resp.data.situacionesEspeciales.asociacionEntidadPublica
                        }
                    };
                    personaService.get(integrante.id_Persona).then(function(resp){
                        integrante.relacionJF=resp.data.rolFamiliar.id_RolFamiliar;
                        integrante.DescRelacionJF=resp.data.rolFamiliar.rolFamiliar;
                        getCapCons(resp.data.capacidadesConstructivas,integrante);
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
                            idTelefono:0,
                            discapacidadCombo:0,
                            enfermedadCronica:false,
                            enfermedadDescripcion:"",
                            capacidadesConstructivas:{
                                pintor:false,
                                pocero:false,
                                techador:false,
                                ceramista:false,
                                yesero:false,
                                soldador:false,
                                vidriero:false,
                                opMaq:false
                            },
                            subsidio: {
                                nacional: false,
                                provincial: false,
                                municipal: false
                            },
                            adjudicatarioPlanEstatal: false,
                            situacionesEspeciales: {
                                enfermedadCronica: false,
                                excombatiente: false,
                                victimaViolencia: false,
                                asociacionGremio: false,
                                asociacionEntidadPublica: false
                            }
                        };
                        $scope.agregando = false;
                    });


                }


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
        $scope.loading = true;
        personaService.delete(integrante.id_Persona).then(function(resp){
            if(integrante.busqueda)
            {

                    $scope.resultadosBusqueda.forEach(function (item,index){
                        if(item.id_Persona == integrante.id_Persona){
                            $scope.resultadosBusqueda.splice(index,1);
                            return false;
                        }
                    }, function(respErr){
                        console.log(respErr);
                    });
                $scope.loading = false;
            }


            else
            {
                $scope.familia.integrantes.forEach(function (item,index){
                    if(item.id_Persona == integrante.id_Persona){
                        $scope.familia.integrantes.splice(index,1);
                        return false;
                    }
                }, function(respErr){
                    console.log(respErr);
                });
            }

        });
    }
};
$scope.editarPersona = function(integrante){
    if(integrante.relacionJF!=1)
    {
        $scope.persona.editando=true;
        $scope.persona.idFamilia = idFamilia || integrante.id_Familia,
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

        $scope.persona.depLaboral = integrante.depLaboral;
        $scope.persona.relacionJF = integrante.relacionJF;
        $scope.persona.ingresoNeto = integrante.ingresoNeto;
        $scope.persona.mail = integrante.mail;
        if(integrante.telefono!="")
        {$scope.persona.telefono = Number(integrante.telefono);}
        else
        {$scope.persona.telefono = "";}
        $scope.persona.idTelefono = integrante.idTelefono;
        $scope.persona.jubilado = integrante.jubilado;
        $scope.persona.carnetJubilacion = integrante.carnetJubilacion;
        $scope.persona.discapacidad = integrante.discapacidad;
        $scope.persona.idEdicion = integrante.id_Persona;
        $scope.persona.discapacidadCombo = integrante.discapacidadCombo;
        $scope.persona.enfermedadCronica = false;
        $scope.persona.descripcionEnfermedad = integrante.descripcionEnfermedad;
        $scope.persona.capacidadesConstructivas = integrante.capacidadesConstructivas;
        $scope.agregando = true;
        if(integrante.busqueda)
        {
            $scope.persona.busqueda = true;
        }
        $scope.persona.subsidio.nacional = integrante.subsidio.nacional;
        $scope.persona.subsidio.provincial = integrante.subsidio.provincial;
        $scope.persona.subsidio.municipal = integrante.subsidio.municipal;
        $scope.persona.adjudicatarioPlanEstatal = integrante.adjudicatarioPlanEstatal;
        $scope.persona.situacionesEspeciales.enfermedadCronica = integrante.situacionesEspeciales.enfermedadCronica;
        $scope.persona.situacionesEspeciales.excombatiente = integrante.situacionesEspeciales.excombatiente;
        $scope.persona.situacionesEspeciales.victimaViolencia = integrante.situacionesEspeciales.victimaViolencia;
        $scope.persona.situacionesEspeciales.asociacionGremio = integrante.situacionesEspeciales.asociacionGremio;
        $scope.persona.situacionesEspeciales.asociacionEntidadPublica = integrante.situacionesEspeciales.asociacionEntidadPublica;


    }

    else
    {
        $scope.jefeDeFamilia.editando=true;
        $scope.jefeDeFamilia.idFamilia = idFamilia || integrante.id_Familia,
        $scope.jefeDeFamilia.idEdicion = integrante.id_Persona;
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

        $scope.jefeDeFamilia.depLaboral = integrante.depLaboral;
        $scope.jefeDeFamilia.relacionJF = 1;
        $scope.jefeDeFamilia.ingresoNeto = integrante.ingresoNeto;
        $scope.jefeDeFamilia.mail = integrante.mail;
        $scope.jefeDeFamilia.idTelefono = integrante.idTelefono;
        $scope.jefeDeFamilia.capacidadesConstructivas = integrante.capacidadesConstructivas;

        $scope.jefeDeFamilia.discapacidadCombo = integrante.discapacidadCombo;
        $scope.jefeDeFamilia.enfermedadCronica = false;
        $scope.jefeDeFamilia.descripcionEnfermedad = integrante.descripcionEnfermedad;
        $scope.jefeDeFamilia.subsidio.nacional = integrante.subsidio.nacional;
        $scope.jefeDeFamilia.subsidio.provincial = integrante.subsidio.provincial;
        $scope.jefeDeFamilia.subsidio.municipal = integrante.subsidio.municipal;
        $scope.jefeDeFamilia.adjudicatarioPlanEstatal = integrante.adjudicatarioPlanEstatal;
        $scope.jefeDeFamilia.situacionesEspeciales.enfermedadCronica = integrante.situacionesEspeciales.enfermedadCronica;
        $scope.jefeDeFamilia.situacionesEspeciales.excombatiente = integrante.situacionesEspeciales.excombatiente;
        $scope.jefeDeFamilia.situacionesEspeciales.victimaViolencia = integrante.situacionesEspeciales.victimaViolencia;
        $scope.jefeDeFamilia.situacionesEspeciales.asociacionGremio = integrante.situacionesEspeciales.asociacionGremio;
        $scope.jefeDeFamilia.situacionesEspeciales.asociacionEntidadPublica = integrante.situacionesEspeciales.asociacionEntidadPublica;
        //Para que no ponga cero en el input
        if(integrante.telefono!="")
        {$scope.jefeDeFamilia.telefono = Number(integrante.telefono);}
        else
        {$scope.jefeDeFamilia.telefono = "";}
        $scope.jefeDeFamilia.jubilado = integrante.jubilado;
        $scope.jefeDeFamilia.carnetJubilacion = integrante.carnetJubilacion;
        $scope.jefeDeFamilia.discapacidad = integrante.discapacidad;
        if(integrante.depLaboral==1){
            $scope.jefeDeFamilia.trabajoDependencia.empresa = integrante.trabajoDependencia.empresa;
            $scope.jefeDeFamilia.trabajoDependencia.fechaIngreso = new Date(Number(integrante.trabajoDependencia.fechaIngreso));
            $scope.jefeDeFamilia.trabajoDependencia.idLocalidad = integrante.trabajoDependencia.idLocalidad;
            $scope.jefeDeFamilia.trabajoDependencia.barrio = integrante.trabajoDependencia.barrio;

            $scope.jefeDeFamilia.trabajoDependencia.direccion.idDireccion = integrante.trabajoDependencia.direccion.idDireccion;
            //$scope.jefeDeFamilia.trabajoDependencia.direccion.calle = integrante.trabajoDependencia.direccion.calle;
            //$scope.jefeDeFamilia.trabajoDependencia.direccion.numero = Number(integrante.trabajoDependencia.direccion.numero);
            $scope.jefeDeFamilia.trabajoDependencia.direccionFull = integrante.trabajoDependencia.direccion.pisoDepto;
            //Para que no ponga cero en el input
            if(integrante.trabajoDependencia.telefono!="")
            {$scope.jefeDeFamilia.trabajoDependencia.telefono = Number(integrante.trabajoDependencia.telefono);}
            else
            {$scope.jefeDeFamilia.trabajoDependencia.telefono = "";}

            $scope.jefeDeFamilia.trabajoDependencia.idTelefono = integrante.trabajoDependencia.idTelefono;
            $scope.jefeDeFamilia.trabajoDependencia.celular = integrante.trabajoDependencia.celular;
        }
        else if(integrante.depLaboral==2){
            $scope.jefeDeFamilia.trabajoAutonomo.inicioActividades = new Date(Number(integrante.trabajoAutonomo.inicioActividades));

        }
        if(integrante.busqueda)
        {
            $scope.jefeDeFamilia.busqueda = true;
        }
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
        var v = resp.data;
        $location.path('/requestProperty');
    });

};
$scope.editFamilia = function(){
    var ingresoNetoFamiliar =0;
    $scope.familia.integrantes.forEach(function (item,index){
        ingresoNetoFamiliar +=item.ingresoNeto;
    });
    familiaService.get(idFamilia).then(function(resp){
        var familyReq = resp.data;
        familiaService.update(familyReq).then(function(resp){
            var v = resp.data;
            $scope.familia.integrantes=[];
            $location.path('/');
    })


    });
};
$scope.buscarPersona = function() {
    $scope.resultadosBusqueda=[];
    personaService.getByDni($scope.DNIBusqueda).then(function (resp) {
        if(resp.status == 404){
            showNotification('No existe persona con ese DNI en la base de datos', 'warning');
        }
        else
        {
            resp.data.forEach(function (item,index){
                if(item.rolFamiliar.id_RolFamiliar!=1){
                    var jubiladoChk = false;
                    if (item.nroCarnetJubilacion) {
                        jubiladoChk = true;
                    }
                    var telefonoInt;
                    var idTelefonoInt;
                    if(item.telefono){
                        telefonoInt = item.telefono.numero;
                        idTelefonoInt = item.telefono.id_Telefono;
                    }
                    else {
                        telefonoInt = "";
                        idTelefonoInt = -1;
                    }
                    var integrante = {
                        id_Persona: item.id_Persona,
                        id_Familia:item.familia.id_Familia,
                        nombre: item.nombre,
                        apellido: item.apellido,
                        tipoDni: item.tipoDocumento.id_TipoDocumento,
                        DNI: item.nroDocumento,
                        CUIL: item.nroCuil,
                        nacimiento: item.fechaNacimiento,
                        sexo: item.sexo.id_Sexo,
                        estadoCivil: item.estadoCivil.id_EstadoCivil,
                        nacionalidad: item.nacionalidad.id_Nacionalidad,
                        estudios: item.estudios.id_Estudios,
                        profesion: item.profesion.id_Profesion,

                        depLaboral: item.situacionLaboral.id_DependenciaLaboral,
                        relacionJF: item.rolFamiliar.id_RolFamiliar,
                        DescRelacionJF: item.rolFamiliar.rolFamiliar,
                        ingresoNeto: item.ingresoNeto,
                        mail: item.mail,
                        telefono:  idTelefonoInt,
                        idTelefono: telefonoInt,
                        jubilado: jubiladoChk,
                        carnetJubilacion: item.nroCarnetJubilacion,
                        discapacidad: false,
                        editando: false,
                        discapacidadCombo:resp.data.discapacidad.id_Discapacidad,
                        enfermedadCronica:resp.data.enfermedadCronica,
                        enfermedadDescripcion:resp.data.descripcionEnfermedad,
                        busqueda:true
                    };
                    $scope.resultadosBusqueda.push(integrante);
                }
                else{
                    var jubiladoChk = false;
                    if(item.nroCarnetJubilacion)
                    {
                        jubiladoChk = true;
                    }
                    var telefonoInt;
                    var idTelefonoInt;
                    if(item.telefono){
                        telefonoInt = item.telefono.numero;
                        idTelefonoInt = item.telefono.id_Telefono;
                    }
                    else {
                        telefonoInt = "";
                        idTelefonoInt = -1;
                    }
                    var integrante ={
                        id_Persona:item.id_Persona,
                        id_Familia:item.familia.id_Familia,
                        nombre:item.nombre,
                        apellido:item.apellido,
                        tipoDni:item.tipoDocumento.id_TipoDocumento,
                        DNI:item.nroDocumento,
                        CUIL:item.nroCuil,
                        nacimiento:item.fechaNacimiento,
                        sexo:item.sexo.id_Sexo,
                        estadoCivil:item.estadoCivil.id_EstadoCivil,
                        nacionalidad:item.nacionalidad.id_Nacionalidad,
                        estudios:item.estudios.id_Estudios,
                        profesion:item.profesion.id_Profesion,

                        depLaboral:item.situacionLaboral.id_DependenciaLaboral,
                        relacionJF:item.rolFamiliar.id_RolFamiliar,
                        DescRelacionJF:item.rolFamiliar.rolFamiliar,
                        ingresoNeto:item.ingresoNeto,
                        mail:item.mail,
                        idTelefono:idTelefonoInt,
                        telefono:telefonoInt,
                        jubilado:jubiladoChk,
                        carnetJubilacion:item.nroCarnetJubilacion,
                        discapacidad:false,
                        editando:false,
                        discapacidadCombo:resp.data.discapacidad.id_Discapacidad,
                        enfermedadCronica:resp.data.enfermedadCronica,
                        enfermedadDescripcion:resp.data.descripcionEnfermedad,
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
                        busqueda:true
                    };
                    if(item.situacionLaboral.id_DependenciaLaboral == 1 && item.rolFamiliar.id_RolFamiliar ==1)
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
                            $scope.resultadosBusqueda.push(integrante);
                        });
                    }
                    else if(item.situacionLaboral.id_DependenciaLaboral == 2 && item.rolFamiliar.id_RolFamiliar ==1)
                    {
                        familiaService.getAutonomo($rootScope.idAutonomo).then(function(resp){
                            integrante.trabajoAutonomo.inicioActividades = resp.data.fechaInicioActividades;
                            $scope.resultadosBusqueda.push(integrante);
                        });
                    }
                    else
                    {
                        $scope.resultadosBusqueda.push(integrante);
                    }
                }
            });
        }
    });
};
$scope.buscarFamilia = function(){
    $scope.familia.integrantes=[];
    familiaService.searchFamily($scope.DNIBusqueda).then(function(resp){

        if(resp.status == 404){
            showNotification('No existe persona con ese DNI en la base de datos', 'warning');
        }
        else{
            idFamilia = resp.data[0].familia.id_Familia;
            resp.data.forEach(function (item,index){
                var jubiladoChk = false;
                if (item.nroCarnetJubilacion) {
                    jubiladoChk = true;
                }
                var telefonoInt;
                var idTelefonoInt;
                if (item.telefono) {
                    telefonoInt = Number(item.telefono.numero);
                    idTelefonoInt = item.telefono.id_Telefono;
                }
                else {
                    telefonoInt = "";
                    idTelefonoInt = 0;
                }
                var integrante = {
                    id_Persona: item.id_Persona,
                    nombre: item.nombre,
                    apellido: item.apellido,
                    tipoDni: item.tipoDocumento.id_TipoDocumento,
                    DNI: item.nroDocumento,
                    CUIL: item.nroCuil,
                    nacimiento: item.fechaNacimiento,
                    sexo: item.sexo.id_Sexo,
                    estadoCivil: item.estadoCivil.id_EstadoCivil,
                    nacionalidad: item.nacionalidad.id_Nacionalidad,
                    estudios: item.estudios.id_Estudios,
                    profesion: item.profesion.id_Profesion,

                    depLaboral: item.situacionLaboral.id_DependenciaLaboral,
                    relacionJF: item.rolFamiliar.id_RolFamiliar,
                    DescRelacionJF: item.rolFamiliar.rolFamiliar,
                    ingresoNeto: item.ingresoNeto,
                    mail: item.mail,
                    telefono: telefonoInt,
                    idTelefono: idTelefonoInt,
                    jubilado: jubiladoChk,
                    carnetJubilacion: item.nroCarnetJubilacion,
                    discapacidad: false,
                    discapacidadCombo: item.discapacidad.id_Discapacidad,
                    enfermedadCronica: item.enfermedadCronica,
                    enfermedadDescripcion: item.descripcionEnfermedad,
                    editando: false,
                    capacidadesConstructivas: {
                        pintor: false,
                        pocero: false,
                        techador: false,
                        ceramista: false,
                        yesero: false,
                        soldador: false,
                        vidriero: false,
                        opMaq: false
                    },
                    subsidio: {
                        nacional: item.subsidio.nacional,
                        provincial: item.subsidio.provincial,
                        municipal: item.subsidio.municipal
                    },
                    adjudicatarioPlanEstatal: item.adjudicatarioPlanEstatal,
                    situacionesEspeciales: {
                        enfermedadCronica: item.situacionesEspeciales.enfermedadCronica,
                        excombatiente: item.situacionesEspeciales.excombatiente,
                        victimaViolencia: item.situacionesEspeciales.victimaViolencia,
                        asociacionGremio: item.situacionesEspeciales.asociacionGremio,
                        asociacionEntidadPublica: item.situacionesEspeciales.asociacionEntidadPublica
                    }
                };
                getCapCons(item.capacidadesConstructivas, integrante);
                    $scope.familia.integrantes.push(integrante);
            });
        }

    })
};
$scope.paginaInicial = function () {
    $location.path('/');
};
$scope.tablaDeFamilia = function(){
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

            depLaboral:0,
            relacionJF:0,
            DescRelacionJF:"",
            ingresoNeto:0,
            mail:"",
            telefono:"",
            jubilado:"",
            carnetJubilacion:"",
            Discapacidad:"",
            idEdicion:0,
            editando:false,
            idTelefono:0,
            idFamilia:0,
            busqueda:false,
            discapacidadCombo:0,
            enfermedad:false,
            enfermedadDescripcion:"",
            capacidadesConstructivas:{
                pintor:false,
                pocero:false,
                techador:false,
                ceramista:false,
                yesero:false,
                soldador:false,
                vidriero:false,
                opMaq:false
            },
            subsidio: {
                nacional: false,
                provincial: false,
                municipal: false
            },
            adjudicatarioPlanEstatal: false,
            situacionesEspeciales: {
                enfermedadCronica: false,
                excombatiente: false,
                victimaViolencia: false,
                asociacionGremio: false,
                asociacionEntidadPublica: false
            }
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

            depLaboral:"",
            trabajoDependencia:{
                empresa:"",
                fechaIngreso:"",
                idLocalidad:"",
                barrio:"",
                direccionFull:"",
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
            ingresoNeto:0,
            mail:"",
            telefono:"",
            jubilado:false,
            relacionJF:99,
            DescRelacionJF:"Jefe/a de Familia",
            carnetJubilacion:"",
            discapacidad:false,
            idEdicion:0,
            editando:false,
            idTelefono:0,
            idFamilia:0,
            busqueda:false,
            discapacidadCombo:0,
            enfermedad:false,
            enfermedadDescripcion:"",
            capacidadesConstructivas:{
                pintor:false,
                pocero:false,
                techador:false,
                ceramista:false,
                yesero:false,
                soldador:false,
                vidriero:false,
                opMaq:false
            },
            subsidio: {
                nacional: false,
                provincial: false,
                municipal: false
            },
            adjudicatarioPlanEstatal: false,
            situacionesEspeciales: {
                enfermedadCronica: false,
                excombatiente: false,
                victimaViolencia: false,
                asociacionGremio: false,
                asociacionEntidadPublica: false
            }
        };
        $scope.agregando = false;
        $scope.editandoJF = false;
    }
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
    if($scope.jefeDeFamilia.DNI == "" || $scope.jefeDeFamilia.DNI.toString().length > 9)
    {
        showNotification('Ingrese un DNI valido', 'danger');
            result=false;
    }
    if($scope.jefeDeFamilia.nacimiento == "" || ($scope.jefeDeFamilia.nacimiento.getFullYear() > 10000))
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
    if($scope.jefeDeFamilia.depLaboral == 1 && (($scope.jefeDeFamilia.trabajoDependencia.fechaIngreso=="")|| ($scope.jefeDeFamilia.trabajoDependencia.fechaIngreso.getFullYear() > 10000)))
    {
        showNotification('Ingrese una fecha de ingreso laboral valida', 'danger');
            result=false;
    }
    if($scope.jefeDeFamilia.depLaboral ==2 && ($scope.jefeDeFamilia.trabajoAutonomo.inicioActividades=="" ||($scope.jefeDeFamilia.trabajoAutonomo.inicioActividades.getFullYear() > 10000)))
    {
        showNotification('Seleccione una fecha de inicio de actividades valida', 'danger');
            result=false;
    }
    //----
    // if($scope.jefeDeFamilia.ingresoNeto == "" || $scope.jefeDeFamilia.ingresoNeto < 0  )
    // {
    //     showNotification('Ingrese un Ingreso Neto valido', 'danger');
    //         result=false;
    // }
    if($scope.jefeDeFamilia.discapacidadCombo == 0)
    {
        showNotification('Seleccione una discapacidad valida. ', 'danger');
        result=false;
    }
    if($scope.jefeDeFamilia.depLaboral==1){
        var direccion = document.getElementById('adress-jf').value;
        var reN = new RegExp("^[0-9]*$");
        var reL = new RegExp("^[a-zA-Z, ]*$");
        if ((reN.test(direccion))||(reL.test(direccion))) {
            showNotification('Ingrese una dirección valida!', 'danger');
            result = false;

        }
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
    if($scope.persona.DNI == "" || $scope.persona.DNI.toString().length)
    {
        showNotification('Ingrese un DNI valido', 'danger');
            result=false;
    }
    if($scope.persona.nacimiento == "" ||($scope.persona.nacimiento.getFullYear() > 10000))
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
    if($scope.persona.discapacidadCombo == 0)
    {
        showNotification('Seleccione una discapacidad valida. ', 'danger');
        result=false;
    }
    // if($scope.persona.ingresoNeto == "" || $scope.persona.ingresoNeto < 0  )
    // {
    //     showNotification('Ingrese un Ingreso Neto valido', 'danger');
    //     result=false;
    // }
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
var mapearCapCons = function(entidad){
    var capConstructivas=[];
    var pintor ={
        "tipoCapacidadConstructiva": {
            "id_TipoCapacidadConstructiva": 1
        },
        "active": true
    };
    var pocero ={
        "tipoCapacidadConstructiva": {
            "id_TipoCapacidadConstructiva": 2
        },
        "active": true
    };
    var ceramista={
        "tipoCapacidadConstructiva": {
            "id_TipoCapacidadConstructiva": 3
        },
        "active": true
    };
    var techador= {
        "tipoCapacidadConstructiva": {
            "id_TipoCapacidadConstructiva": 4
        },
        "active": true
    };
    var yesero ={
        "tipoCapacidadConstructiva": {
            "id_TipoCapacidadConstructiva": 5
        },
        "active": true
    };
    var soldador = {
        "id_CapacidadConstructiva": 6,
        "tipoCapacidadConstructiva": {
            "id_TipoCapacidadConstructiva": 6
        },
        "active": true
    };
    var opMaq = {
        "tipoCapacidadConstructiva": {
            "id_TipoCapacidadConstructiva": 7
        },
        "active": true
    };
    var vidriero = {
        "tipoCapacidadConstructiva": {
            "id_TipoCapacidadConstructiva": 8
        },
        "active": true
    };
    if(entidad.capacidadesConstructivas.pintor){
        capConstructivas.push(pintor);
    }
    if(entidad.capacidadesConstructivas.pocero){
        capConstructivas.push(pocero);
    }
    if(entidad.capacidadesConstructivas.ceramista){
        capConstructivas.push(ceramista);
    }
    if(entidad.capacidadesConstructivas.techador){
        capConstructivas.push(techador);
    }
    if(entidad.capacidadesConstructivas.yesero){
        capConstructivas.push(yesero);
    }
    if(entidad.capacidadesConstructivas.soldador){
        capConstructivas.push(soldador);
    }
    if(entidad.capacidadesConstructivas.opMaq){
        capConstructivas.push(opMaq);
    }
    if(entidad.capacidadesConstructivas.vidriero){
        capConstructivas.push(vidriero);
    }
    if(capConstructivas.length){
        return capConstructivas;
    }
    else{
        return null;
    }


};
var getCapCons = function(respCapCons, entidad){
respCapCons.forEach(function (item,index){
        if(item.tipoCapacidadConstructiva.id_TipoCapacidadConstructiva == 1){
            entidad.capacidadesConstructivas.pintor = true;
        }
        if(item.tipoCapacidadConstructiva.id_TipoCapacidadConstructiva == 2){
            entidad.capacidadesConstructivas.pocero = true;
        }
        if(item.tipoCapacidadConstructiva.id_TipoCapacidadConstructiva == 3){
            entidad.capacidadesConstructivas.ceramista = true;
        }
        if(item.tipoCapacidadConstructiva.id_TipoCapacidadConstructiva == 4){
            entidad.capacidadesConstructivas.techador = true;
        }
        if(item.tipoCapacidadConstructiva.id_TipoCapacidadConstructiva == 5){
            entidad.capacidadesConstructivas.yesero = true;
        }
        if(item.tipoCapacidadConstructiva.id_TipoCapacidadConstructiva == 6){
            entidad.capacidadesConstructivas.soldador = true;
        }
        if(item.tipoCapacidadConstructiva.id_TipoCapacidadConstructiva == 7){
            entidad.capacidadesConstructivas.opMaq = true;
        }
        if(item.tipoCapacidadConstructiva.id_TipoCapacidadConstructiva == 8){
            entidad.capacidadesConstructivas.vidriero = true;
        }
    });
}



}

