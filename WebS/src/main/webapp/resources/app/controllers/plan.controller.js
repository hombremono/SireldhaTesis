2/**
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
        },
        {
            id: 1,
            descripcion: "NACIONAL"
        },
        {
            id: 2,
            descripcion: "PROVINCIAL"
        },
        {
            id: 3,
            descripcion: "MUNICIPAL"
        }

    ];
    $scope.Plan.financiamiento = $scope.Financiamientos[0].id;
    $scope.Tipos = [
        {
            id: 0,
            descripcion: "-SELECCIONE-"
        },
        {
            id: 1,
            descripcion: "TERRENO"
        },
        {
            id: 2,
            descripcion: "VIVIENDA NUEVA"
        },
        {
            id: 3,
            descripcion: "MEJORAMIENTO Y/O AMPLIACION"
        },
        {
            id: 4,
            descripcion: "REGULARIZACION"
        }
        ];
    $scope.Plan.tipo = $scope.Tipos[0].id;
    //Global Variables
    $scope.agregandoPlan = false;
    //Variables n' Stuff
    $scope.mostrarSitRegistro = false;
    $scope.mostrarSitHogar =false;
    $scope.mostrarSitEspecial = false;
    $scope.mostrarSitHab=false;
    $scope.mostrarInfoCalmat=false;
    //Tablas
    $scope.sitRegistro = {
        items:[]
    };
    $scope.sitHogar = {
        items:[]
    };
    $scope.sitEspecial={
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
                id_SituacionRegistro: 0,
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
    $scope.temp ={
        item : $scope.comboSitRegistro.items[0].id_SituacionRegistro,
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
        cargarComboEdad($scope.comboSitEdadJefe.items,datos.planRangoEdadList);
        //Seteado de elemento 0
        defaultCombos();

    });
    var cargarCombo = function(combo, coleccion){
        var resultado = [];
        coleccion.forEach(function(value) {
            combo.push(value);
        });
    };
    var cargarComboEdad=function(combo, coleccion){
        coleccion.forEach(function (element,index) {
            var descripcion = "Entre "+element.desde+" y "+element.hasta+" años.";
            var item ={
                id_RangoEdad:element.id_RangoEdad,
                descripcion:descripcion
            };
            combo.push(item);
        })
    };
    var defaultCombos = function(){
        $scope.temp ={
            item : $scope.comboSitRegistro.items[0].id_SituacionRegistro,
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
    };
    //VARIABLES FUERA DE TABLA
    $scope.inicioResidencia = "";
    $scope.cantMiembros = 0;
    $scope.ingresosHogar=0;
    //FUNCIONES
    $scope.addItem = function(id,coleccion,categoria,combo,key){
        debugger;
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
                        descripcion:element[key],
                        puntaje:0,
                        required:false,
                        valorEspecial:""
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
            valorEspecial:valorEsp
        };
        coleccion.push(item);
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
        if(ejecutarValidaciones()){
            $scope.Planes.push(plan);
            $scope.Plan = {
                nombre:"",
                financiamiento:0,
                tipo:0
            };
            defaultCombos();
            $scope.agregandoPlan = false;
        };
    };
    $scope.getProperty = function (propertyName) {
        debugger;
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
    $scope.Plan = {
        nombre:"",
        financiamiento:0,
        tipo:0
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



