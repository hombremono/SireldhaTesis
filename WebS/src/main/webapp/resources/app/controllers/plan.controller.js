2/**
 * Created by fran_ on 12/6/2017.
 */
angular.module('webS').controller('PlanController',
    [ '$scope', '$sce', '$uibModal','$location', 'planService', PlanController ]);
function PlanController($scope, $sce, $uibModal, $location, planService) {
    $scope.titulo = "Planes de vivienda";
    $scope.Planes=[
        {
            nombre:"Plan de Prueba",
            financiamiento:1,
            tipo:3
        }
    ];
    $scope.Plan = {
        nombre:"",
        financiamiento:0,
        tipo:0
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

    //Situaciones
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
                id: 0,
                descripcion: "-SELECCIONE-"
            },
            {
                id: 1,
                descripcion: "Antigüedad de la inscripción en el registro"
            },
            {
                id: 2,
                descripcion: "Documentación probatoria completa"
            }]
    };
    //SIT HOGAR
    $scope.comboSitHogar = {
        items: [
            {
                id: 0,
                descripcion: "-SELECCIONE-"
            },
            {
                id: 1,
                descripcion: "Inicio de residencia"
            },
            ,
            {
                id: 2,
                descripcion: "Percepción de subsidios en el hogar"
            }]
    };
    $scope.comboSitLocalidad = {
        items: [
            {
                id: 0,
                descripcion: "-SELECCIONE-"
            },
            {
                id: 1,
                descripcion: "Laborde"
            }]
    };
    $scope.comboSitGenero = {
        items: [
            {
                id: 0,
                descripcion: "-SELECCIONE-"
            },
            {
                id: 1,
                descripcion: "Femenino"
            },
            {
                id: 2,
                descripcion: "Masculino"
            }]
    };
    $scope.comboSitEdadJefe = {
        items: [
            {
                id: 0,
                descripcion: "-SELECCIONE-"
            },
            {
                id: 1,
                descripcion: "18-25"
            },
            {
                id: 2,
                descripcion: "26-35"
            },
            {
                id: 3,
                descripcion: "36-50"
            }
            ,
            {
                id: 4,
                descripcion: "50+"
            }]
    };
    $scope.comboSitCapCons = {
        items: [
            {
                id: 0,
                descripcion: "-SELECCIONE-"
            },
            {
                id: 1,
                descripcion: "Pintor"
            },
            {
                id: 2,
                descripcion: "Pocero"
            },
            {
                id: 3,
                descripcion: "Ceramista"
            },
            {
                id: 4,
                descripcion: "Techador"
            },
            {
                id: 5,
                descripcion: "Yesero"
            }
        ]
    };
    $scope.comboSitNacionalidad ={
        items: [
            {
                id: 0,
                descripcion: "-SELECCIONE-"
            },
            {
                id: 1,
                descripcion: "ITEM EJEMPLO"
            }
        ]
    };
    $scope.comboSitEstadoCivil ={
        items: [
            {
                id: 0,
                descripcion: "-SELECCIONE-"
            },]
    };
    $scope.comboSitSitLaboral ={
        items: [
            {
                id: 0,
                descripcion: "-SELECCIONE-"
            },]
    };



    //SIT ESPECIALES
    $scope.comboSitEsp ={
        items: [
            {
                id: 0,
                descripcion: "-SELECCIONE-"
            },
            {
                id: 1,
                descripcion: "ITEM EJEMPLO"
            }]
    };
    //SIT HABITACIONAL
    $scope.comboSitHab ={
        items: [
            {
                id: 0,
                descripcion: "-SELECCIONE-"
            }]
    };
    $scope.comboPosesionInmueble ={
        items: [
            {
                id: 0,
                descripcion: "-SELECCIONE-"
            },]
    };
    $scope.comboTipoVivienda ={
        items: [
            {
                id: 0,
                descripcion: "-SELECCIONE-"
            },]
    };
    $scope.comboConservacion ={
        items: [
            {
                id: 0,
                descripcion: "-SELECCIONE-"
            },]
    };

    $scope.temp ={
        item : $scope.comboSitRegistro.items[0].id,
        itemHogar: $scope.comboSitHogar.items[0].id,
        itemLocalidad: $scope.comboSitLocalidad.items[0].id,
        itemEdadJefe: $scope.comboSitEdadJefe.items[0].id,
        itemCapCons: $scope.comboSitCapCons.items[0].id,
        itemGenero: $scope.comboSitGenero.items[0].id,
        itemNacionalidad:$scope.comboSitNacionalidad.items[0].id,
        itemEstadoCivil:$scope.comboSitEstadoCivil.items[0].id,
        itemSitLaboral:$scope.comboSitSitLaboral.items[0].id,
        itemsPosesionInmueble:$scope.comboPosesionInmueble.items[0].id,
        itemsTipoVivienda:$scope.comboTipoVivienda.items[0].id,
        itemsSolHab:$scope.comboSitHab.items[0].id,
        itemsEsp:$scope.comboSitEsp.items[0].id,
        itemsConservacion:$scope.comboConservacion.items[0].id,
        itemInicioResidencia:-1,
        itemCantMiembros:-1,
        itemIngreso:-1
    };
    //VARIABLES FUERA DE TABLA
    $scope.inicioResidencia = "";
    $scope.cantMiembros = 0;
    $scope.ingresosHogar=0;

    //FUNCIONES
    $scope.addItem = function(id,coleccion,categoria,combo){
        combo.forEach(function (element, index) {
            if (element.id == id && element.id !=0) {

                var item={
                    id:element.id,
                    categoria:categoria,
                    descripcion:element.descripcion,
                    puntaje:0,
                    required:false,
                    valorEspecial:""
                };
                coleccion.push(item);
                combo.splice(index,1);
                coleccion.items[0].id;
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
        $scope.Planes.push(plan);
        $scope.Plan = {
            nombre:"",
            financiamiento:0,
            tipo:0
        };
        $scope.temp ={
            item : $scope.comboSitRegistro.items[0].id,
            itemHogar: $scope.comboSitHogar.items[0].id,
            itemLocalidad: $scope.comboSitLocalidad.items[0].id,
            itemEdadJefe: $scope.comboSitEdadJefe.items[0].id,
            itemCapCons: $scope.comboSitCapCons.items[0].id,
            itemGenero: $scope.comboSitGenero.items[0].id,
            itemNacionalidad:$scope.comboSitNacionalidad.items[0].id,
            itemEstadoCivil:$scope.comboSitEstadoCivil.items[0].id,
            itemSitLaboral:$scope.comboSitSitLaboral.items[0].id,
            itemsEsp:$scope.comboSitEsp.items[0].id,
            itemsTipoVivienda:$scope.comboTipoVivienda.items[0].id,
            itemsSolHab:$scope.comboSitHab.items[0].id,
            itemsConservacion:$scope.comboConservacion.items[0].id,
            itemInicioResidencia:-1,
            itemCantMiembros:-1,
            itemIngreso:-1
        };
        $scope.agregandoPlan = false;
    }

}



