/**
 * Created by fran_ on 12/6/2017.
 */
angular.module('webS').controller('PlanController',
    [ '$scope', '$sce', '$uibModal','$location', 'planService', PlanController ]);
function PlanController($scope, $sce, $uibModal, $location, planService) {
    $scope.titulo = "Planes de vivienda";
    $scope.Planes=[];
    $scope.Plan = {
        nombre:"",
        financiamiento:0,
        tipo:0
    };
    $scope.PlanPost = {
        "solucionHabitacional": {
            "id_SolucionHabitacional": null
        },
        "nombre": "",
        "origenFinanciamiento": {
            "id": 0
        },
        "planCriterioList": [
            ]};
    /*Cuando me llega la lista en el servicio, antes de agregarla a planes necesito ordenarlos.*/
    $scope.Puntajes = [{
      "nombre":"Tomas",
      "apellido":"Turbate",
     "puntos": 23,
    "dni": "03034562"
    },{
        "nombre":"Susana",
        "apellido":"Horia",
        "puntos":420,
        "dni":"89776421"

    },{
        "nombre":"Miguel",
        "apellido":"Del Sel",
        "puntos":2,
        "dni":"00987672"

    },{
        "nombre":"Rosa",
        "apellido":"Lel",
        "puntos":90,
        "dni":"34556234"

    }
    ];
    $scope.keyValueId = {
        "itemLocalidad":"localidad",
        "itemGenero":"sexo",
        "itemSitLaboral":"dependenciaLaboral",
        "itemEstadoCivil":"estadoCivil",
        "default":"descripcion",
        "itemCalmat":"indice"
    };
    //Listas de Combos
    $scope.Financiamientos = [
        {
        id: 0,
        descripcion: "-SELECCIONE-"
        }

    ];
    $scope.Plan.financiamiento = $scope.Financiamientos[0].id;
    $scope.Tipos = [
        {
            id_SolucionHabitacional: 0,
            descripcion: "-SELECCIONE-"
        }
        ];
    $scope.Plan.tipo = $scope.Tipos[0].id;
    //Global Variables
    $scope.agregandoPlan = false;
    //Variables n' Stuff
    $scope.mostrarSitRegistro = false;
    $scope.mostrarSitHogar = false;
    $scope.mostrarSitEspecial = false;
    $scope.mostrarSitHab = false;
    $scope.mostrarInfoCalmat = false;
    //Tablas
    $scope.sitRegistro = {
        items:[]
    };
    $scope.sitHogar = {
        items:[]
    };
    $scope.sitEspecial = {
        items:[]
    };
    $scope.sitHab = {
        items:[]
    };
    //COMBOS
    //SIT REGISTRO
    $scope.comboSitRegistro = {
        items: [
            {
                id_Plan_SituacionRegistro: 0,
                descripcion: "-SELECCIONE-"
            }]
    };
    //SIT HOGAR
    $scope.comboSitHogar = {
        items: [
            {
                id_SituacionHogar: 0,
                descripcion: "-SELECCIONE-"
            }]
    };
    $scope.comboSitLocalidad = {
        items: [
            {
                id_Localidad: 0,
                localidad: "-SELECCIONE-"
            }]
    };
    $scope.comboSitGenero = {
        items: [
            {
                id_Sexo: 0,
                sexo: "-SELECCIONE-"
            }]
    };
    $scope.comboSitEdadJefe = {
        items: [
            {
                id_RangoEdad: 0,
                descripcion: "-SELECCIONE-"
            }]
    };
    $scope.comboSitCapCons = {
        items: [
            {
                id_TipoCapacidadConstructiva: 0,
                descripcion: "-SELECCIONE-"
            }
        ]
    };
    $scope.comboSitNacionalidad ={
        items: [
            {
                id_Nacionalidad: 0,
                descripcion: "-SELECCIONE-"
            }
        ]
    };
    $scope.comboSitEstadoCivil ={
        items: [
            {
                id_EstadoCivil: 0,
                estadoCivil: "-SELECCIONE-"
            }]
    };
    $scope.comboSitSitLaboral ={
        items: [
            {
                id_DependenciaLaboral: 0,
                dependenciaLaboral: "-SELECCIONE-"
            }]
    };
    //SIT ESPECIALES
    $scope.comboSitEsp ={
        items: [
            {
                id_CaracteristicasEspecialesHogar: 0,
                descripcion: "-SELECCIONE-"
            }]
    };
    //SIT HABITACIONAL
    $scope.comboSitHab ={
        items: [
            {
                id_Plan_SituacionHabitacional: 0,
                descripcion: "-SELECCIONE-"
            }]
    };
    $scope.comboPosesionInmueble ={
        items: [
            {
                id_PoseeInmueble: 0,
                descripcion: "-SELECCIONE-"
            }]
    };
    $scope.comboTipoVivienda ={
        items: [
            {
                id_SituacionInmueble: 0,
                descripcion: "-SELECCIONE-"
            }]
    };
    $scope.comboConservacion ={
        items: [
            {
                id_InstalacionInmueble: 0,
                descripcion: "-SELECCIONE-"
            }]
    };
    $scope.comboCalmat={
        items: [
            {
                id_Plan_Calmat: 0,
                indice: "-SELECCIONE-"
            }]
    };

    planService.loadCombos().then(function(resp){
        var datos = resp.data;
        cargarCombo($scope.comboSitRegistro.items,datos.planSituacionRegistroList);
        cargarCombo($scope.comboSitHogar.items,datos.planSituacionHogarList);
        cargarCombo($scope.comboSitLocalidad.items,datos.localidadList);
        cargarCombo($scope.comboSitGenero.items,datos.sexoList);
        cargarCombo($scope.comboSitCapCons.items,datos.capacidadConstructivaList);
        cargarCombo($scope.comboSitNacionalidad.items,datos.nacionalidadList);
        cargarCombo($scope.comboSitEstadoCivil.items,datos.estadoCivilList);
        cargarCombo($scope.comboSitSitLaboral.items,datos.situacionLaboralList);
        cargarCombo($scope.comboSitEsp.items,datos.planCaracteristicasHogarList);
        cargarCombo($scope.comboSitHab.items,datos.planSituacionHabitacionalList);
        cargarCombo($scope.comboPosesionInmueble.items,datos.poseeInmuebleList);
        cargarCombo($scope.comboTipoVivienda.items,datos.situacionInmuebleList);
        cargarCombo($scope.comboConservacion.items,datos.instalacionInmuebleList);
        cargarCombo($scope.comboCalmat.items,datos.planCalmatList);
        cargarCombo($scope.Financiamientos,datos.origenFinanciamientoList);
        cargarComboEdad($scope.comboSitEdadJefe.items,datos.planRangoEdadList);
        //Seteado de elemento 0
        defaultCombos();

    });
    planService.loadCombosHogar().then(function(resp){
        var datos = resp.data;
        cargarCombo($scope.Tipos,datos.solucionesHabitacionales);
        $scope.Plan.tipo = $scope.Tipos[0].id_SolucionHabitacional;

    });

    $scope.temp ={
        itemHogar: $scope.comboSitHogar.items[0].id_SituacionHogar,
        itemLocalidad: $scope.comboSitLocalidad.items[0].id_Localidad,
        itemEdadJefe: $scope.comboSitEdadJefe.items[0].id_RangoEdad,
        itemCapCons: $scope.comboSitCapCons.items[0].id_TipoCapacidadConstructiva,
        itemGenero: $scope.comboSitGenero.items[0].id_Sexo,
        itemNacionalidad:$scope.comboSitNacionalidad.items[0].id_Nacionalidad,
        itemEstadoCivil:$scope.comboSitEstadoCivil.items[0].id_EstadoCivil,
        itemSitLaboral:$scope.comboSitSitLaboral.items[0].id_DependenciaLaboral,
        itemsPosesionInmueble:$scope.comboPosesionInmueble.items[0].id_PoseeInmueble,
        itemsTipoVivienda:$scope.comboTipoVivienda.items[0].id_SituacionInmueble,
        itemsSolHab:$scope.comboSitHab.items[0].id_Plan_SituacionHabitacional,
        itemsEsp:$scope.comboSitEsp.items[0].id_CaracteristicasEspecialesHogar,
        itemsConservacion:$scope.comboConservacion.items[0].id_InstalacionInmueble,
        itemsCalmat:$scope.comboCalmat.items[0].id_Plan_Calmat,
        itemsRegistro : $scope.comboSitRegistro.items[0].id_Plan_SituacionRegistro,
        itemInicioResidencia:-1,
        itemCantMiembros:-1,
        itemIngreso:-1
    };
    // planService.getPlanes().then(function(resp){
    //
    // });
    var cargarCombo = function(combo, coleccion){
        var resultado = [];
        coleccion.forEach(function(value) {
            combo.push(value);
        });
    };
    var cargarComboEdad=function(combo, coleccion){
        debugger;
        coleccion.forEach(function (element,index) {
            var descripcion = "Entre "+element.desde+" y "+element.hasta+" años.";
            var item ={
                id_RangoEdad:element.id_RangoEdad,
                descripcion:descripcion,
                constante:element.constante
            };
            combo.push(item);
        })
    };
    var defaultCombos = function(){
        $scope.temp ={
            itemsRegistro : $scope.comboSitRegistro.items[0].id_Plan_SituacionRegistro,
            itemHogar: $scope.comboSitHogar.items[0].id_SituacionHogar,
            itemLocalidad: $scope.comboSitLocalidad.items[0].id_Localidad,
            itemEdadJefe: $scope.comboSitEdadJefe.items[0].id_RangoEdad,
            itemCapCons: $scope.comboSitCapCons.items[0].id_TipoCapacidadConstructiva,
            itemGenero: $scope.comboSitGenero.items[0].id_Sexo,
            itemNacionalidad:$scope.comboSitNacionalidad.items[0].id_Nacionalidad,
            itemEstadoCivil:$scope.comboSitEstadoCivil.items[0].id_EstadoCivil,
            itemSitLaboral:$scope.comboSitSitLaboral.items[0].id_DependenciaLaboral,
            itemsPosesionInmueble:$scope.comboPosesionInmueble.items[0].id_PoseeInmueble,
            itemsTipoVivienda:$scope.comboTipoVivienda.items[0].id_SituacionInmueble,
            itemsSolHab:$scope.comboSitHab.items[0].id_Plan_SituacionHabitacional,
            itemsEsp:$scope.comboSitEsp.items[0].id_CaracteristicasEspecialesHogar,
            itemsConservacion:$scope.comboConservacion.items[0].id_InstalacionInmueble,
            itemsCalmat:$scope.comboCalmat.items[0].id_Plan_Calmat,
            itemInicioResidencia:-1,
            itemCantMiembros:-1,
            itemIngreso:-1
        };
        $scope.Plan.financiamiento = $scope.Financiamientos[0].id;
    };
    //VARIABLES FUERA DE TABLA
    $scope.inicioResidencia = "";
    $scope.cantMiembros = 0;
    $scope.ingresosHogar=0;
    //FUNCIONES
    $scope.addItem = function(id,coleccion,categoria,combo,key){
        var add = true;
        combo.forEach(function (element, index) {
            if (element.id == id && element.id !=0) {
                coleccion.forEach(function(e,i){
                    if(e.descripcion == element[key] && e.categoria==categoria)
                    {
                        showNotification("Ese item ya se encuentra en el plan",'danger');
                        add =false;
                    }
                });
                if(add){
                    var item={
                        id:element.id,
                        categoria:categoria,
                        descripcion:(element[key] || element.descripcion),
                        puntaje:0,
                        required:false,
                        valorEspecial:"",
                        constante :element.constante.id_Constante
                    };
                    coleccion.push(item);
                    selectTags = planForm.getElementsByTagName("select");
                    for(var i = 0; i < selectTags.length; i++) {
                        selectTags[i].selectedIndex =0;
                    }
                }
            }
        });
    };
    $scope.addItemFueraDeTabla = function(id,coleccion,categoria,descripcion,valorEsp){
        var item ={
            id:-1,
            categoria:categoria,
            descripcion:descripcion,
            puntaje:0,
            required:false,
            valorEspecial:valorEsp,
            constante :0
        };
        coleccion.push(item);
    };
    $scope.addItemBadId = function(id,coleccion,categoria,combo,key,idDesc){
        debugger;
        var add = true;
        combo.forEach(function (element, index) {
            if (element[idDesc] == id && element[idDesc] !=0) {
                coleccion.forEach(function(e,i){
                    if(e.descripcion == element[key] && e.categoria==categoria)
                    {
                        showNotification("Ese item ya se encuentra en el plan",'danger');
                        add =false;
                    }
                });
                if(add){
                    var item={
                        id:element[idDesc],
                        categoria:categoria,
                        descripcion:(element[key] || element.descripcion),
                        puntaje:0,
                        required:false,
                        valorEspecial:"",
                        constante :element.constante.id_Constante
                    };
                    coleccion.push(item);
                    selectTags = planForm.getElementsByTagName("select");
                    for(var i = 0; i < selectTags.length; i++) {
                        selectTags[i].selectedIndex =0;
                    }
                }
            }
        });
    };
    $scope.quitarItem = function(item,coleccion,combo){
        coleccion.forEach(function (element, index) {
            if (element == item) {
                coleccion.splice(index, 1);
            }
            if(item.id<0){
                combo.push(item);
            };
        });


    };
    $scope.addAll = function(combo,coleccion,categoria){
        combo.forEach(function (elemento, index) {
            if(elemento.id !=0){
                var item ={
                    categoria:categoria,
                    descripcion:elemento.descripcion,
                    puntaje:0
                };
                coleccion.push(item);
            }

        });

    };
    $scope.addPlan = function(plan){
        debugger;
        if(ejecutarValidaciones()){
            $scope.PlanPost.nombre = $scope.Plan.nombre;
            $scope.PlanPost.origenFinanciamiento.id = $scope.Plan.financiamiento;
            $scope.PlanPost.solucionHabitacional.id_SolucionHabitacional = $scope.Plan.tipo;

            if($scope.sitHogar.items.length !=0)
            {
                $scope.sitHogar.items.forEach(function(elemento,index){
                    var item={
                        "constante":{"id_Constante":elemento.constante},
                        "requerido":elemento.required,
                        "puntaje":elemento.puntaje
                    };
                    $scope.PlanPost.planCriterioList.push(item);
                });
            }
            if($scope.sitRegistro.items.length !=0)
            {
                $scope.sitRegistro.items.forEach(function(elemento,index){
                    var item={
                        "constante":{"id_Constante":elemento.constante},
                        "requerido":elemento.required,
                        "puntaje":elemento.puntaje
                    };
                    $scope.PlanPost.planCriterioList.push(item);
                });
            }
            if($scope.sitEspecial.items.length !=0)
            {
                $scope.sitEspecial.items.forEach(function(elemento,index){
                    var item={
                        "constante":{"id_Constante":elemento.constante},
                        "requerido":elemento.required,
                        "puntaje":elemento.puntaje
                    };
                    $scope.PlanPost.planCriterioList.push(item);
                });
            }
            if($scope.sitHab.items.length !=0)
            {
                $scope.sitHab.items.forEach(function(elemento,index){
                    var item={
                        "constante":{"id_Constante":elemento.constante},
                        "requerido":elemento.required,
                        "puntaje":elemento.puntaje
                    };
                    $scope.PlanPost.planCriterioList.push(item);
                });
            }
            planService.add($scope.PlanPost).then(function (resp) {
                var datos = resp.data;
                debugger;
                $scope.Planes.push(plan);
                $scope.Plan = {
                    nombre:"",
                    financiamiento:0,
                    tipo:0
                };
                $scope.sitRegistro = {
                    items:[]
                };
                $scope.sitHogar = {
                    items:[]
                };
                $scope.sitEspecial = {
                    items:[]
                };
                $scope.sitHab = {
                    items:[]
                };
                $scope.PlanPost = {
                    "solucionHabitacional": {
                        "id_SolucionHabitacional": null
                    },
                    "nombre": "",
                    "origenFinanciamiento": {
                        "id": 0
                    },
                    "planCriterioList": [
                    ]};
                $scope.mostrarSitRegistro = false;
                $scope.mostrarSitHogar= false;
                $scope.mostrarSitHab= false;
                $scope.mostrarSitEspecial= false;
                defaultCombos();
                $scope.agregandoPlan = false;
            });

        };
    };
    $scope.cerrarPlan = function(plan){
        $location.path('/getPoints');
    };
    $scope.getProperty = function (propertyName) {
        return $scope.keyValueId[propertyName];
    };
    //FUNCIONES INTERNAS
    var ejecutarValidaciones=function(){
        var result = true;
        if($scope.Plan.nombre == undefined || $scope.Plan.nombre=="")
        {
          showNotification("Ingrese un nombre para el Plan",'danger');
          result=false;
        }
        if($scope.Plan.tipo == undefined || $scope.Plan.tipo==0)
        {
            showNotification("Seleccione un tipo para el Plan",'danger');
            result=false;
        }
        if($scope.Plan.financiamiento == undefined || $scope.Plan.financiamiento==0)
        {
            showNotification("Seleccione un financiamiento  para el Plan",'danger');
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



