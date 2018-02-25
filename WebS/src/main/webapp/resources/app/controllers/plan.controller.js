/**
 * Created by fran_ on 12/6/2017.
 */
angular.module('webS').controller('PlanController',
    [ '$scope','$rootScope', '$sce', '$uibModal','$location', 'planService', PlanController ]);
function PlanController($scope, $rootScope, $sce, $uibModal, $location, planService) {
    $scope.titulo = "Planes de vivienda";
    $scope.loading = false;
    $scope.PlanesAbiertos=[];
    $scope.PlanesCerrados = [];
    $scope.Plan = {
        nombre:"",
        financiamiento:0,
        tipo:0,
        id:-1
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
    $scope.Operaciones =[
        {
        id:0,
        descripcion:"Mayor a "
    },
        {
        id:1,
        descripcion:"Igual a "
    },
        {
            id:2,
            descripcion:"Menor a "
        }];
    $scope.itemsOperadores=[];
    /*Cuando me llega la lista en el servicio, antes de agregarla a planes necesito ordenarlos.*/
    $scope.Puntajes = [];
    //$rootScope.Puntajes = $scope.Puntajes;
    $scope.nombrePlan = "";
    //$rootScope.nombrePlan= $scope.nombrePlan;
    $scope.idPlan=-1;

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
    $scope.verPlanesCerrados = false;
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
    //Situaciones especiales
    $scope.itemOperacionVigencia = $scope.Operaciones[0];
    $scope.itemOperacionMiembro = $scope.Operaciones[0];
    $scope.itemOperacionIngreso = $scope.Operaciones[0];
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

    $scope.inicioResidencia = "";
    $scope.cantMiembros = 0;
    $scope.ingresosHogar=0;

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
        debugger;
        $scope.inicioResidencia = datos.operacionesLogicas[0];
        $scope.cantMiembros = datos.operacionesLogicas[1];
        $scope.ingresosHogar=datos.operacionesLogicas[2];
        //Seteado de elemento 0
        defaultCombos();

    });
    planService.loadCombosHogar().then(function(resp){
        var datos = resp.data;
        cargarCombo($scope.Tipos,datos.solucionesHabitacionales);
        $scope.Plan.tipo = $scope.Tipos[0].id_SolucionHabitacional;

    });
    planService.getOperadores().then(function(resp){
        //Ver como traen las cosas.
        $scope.itemsOperadores = resp.data;
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
        itemInicioResidencia:0,
        itemCantMiembros:0,
        itemIngreso:0
    };
    planService.getPlanes().then(function(resp) {
        resp.data.forEach(function (item, index) {
            if (item.active) {
                $scope.PlanesAbiertos.push(item)
            }
            else {
                $scope.PlanesCerrados.push(item)
            }
        });
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
            itemInicioResidencia:0,
            itemCantMiembros:0,
            itemIngreso:0
        };
        $scope.Plan.financiamiento = $scope.Financiamientos[0].id;
    };
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
                    selectTags = planForm.getElementsByClassName("selectItem");
                    for(var i = 0; i < selectTags.length; i++) {
                        selectTags[i].selectedIndex =0;
                    }
                }
            }
        });
    };
    $scope.addItemFueraDeTabla = function(coleccion,valorInput,idOperacion, categoria,idItem){
        var constante;
        var operacion;
        if(idItem==1){
            constante = $scope.cantMiembros;
        }
        else if(idItem==2){
            constante = $scope.ingresosHogar;
        }
        else if(idItem==3){
            constante = $scope.inicioResidencia;
        }
        if(idOperacion.id == 0){
            operacion = $scope.itemsOperadores[0];
        }
        else if(idOperacion.id==1){
            operacion = $scope.itemsOperadores[1];
        }
        else{
            operacion = $scope.itemsOperadores[2];
        }
        var item ={
            id:-1,
            categoria:categoria,
            descripcion:operacion.constante + ' '+ valorInput,
            puntaje:0,
            required:false,
            valor:valorInput,
            constante :constante.id,
            constanteOperador:operacion
        };
        coleccion.push(item);
        $scope.itemOperacionVigencia = $scope.Operaciones[0];
        $scope.itemOperacionMiembro = $scope.Operaciones[0];
        $scope.itemOperacionIngreso = $scope.Operaciones[0];
        $scope.temp.itemInicioResidencia=0;
        $scope.temp.itemCantMiembros=0;
        $scope.temp.itemIngreso=0;
    };
    $scope.addItemBadId = function(id,coleccion,categoria,combo,key,idDesc){
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
        if(ejecutarValidaciones()){
            if(validarRequired()){
            $scope.PlanPost.nombre = $scope.Plan.nombre;
            $scope.PlanPost.origenFinanciamiento.id = $scope.Plan.financiamiento;
            $scope.PlanPost.solucionHabitacional.id_SolucionHabitacional = $scope.Plan.tipo;

            if($scope.sitHogar.items.length !=0)
            {
                $scope.sitHogar.items.forEach(function(elemento,index){
                    if(elemento.constanteOperador){
                        var item={
                            "constante":{"id_Constante":elemento.constante},
                            "requerido":elemento.required,
                            "puntaje":elemento.puntaje,
                            "valor":(elemento.valor).toString(),
                            "constanteOperador":elemento.constanteOperador
                        };

                    }else{
                        var item={
                            "constante":{"id_Constante":elemento.constante},
                            "requerido":elemento.required,
                            "puntaje":elemento.puntaje
                        };
                    }

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
                plan.id=resp.data.id_Plan;
                $scope.PlanesAbiertos.push(plan);
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

            }}};
    $scope.cerrarPlan = function(plan){
        $scope.loading = true;
        planService.cerrarPlan(plan.id).then(function(resp){
            $rootScope.Puntajes =[];
            $rootScope.nombrePlan="";
            $scope.loading = false;
            resp.data.forEach(function(item, index){
                $rootScope.nombrePlan=item.nombrePlan;
                $rootScope.Puntajes.push(item);
            });
            $rootScope.Puntajes.sort(function(a,b){
                return parseFloat((b.puntaje)-parseFloat(a.puntaje));
            });
            $location.path('/getPoints');
        });

    };
    $scope.getProperty = function (propertyName) {
        return $scope.keyValueId[propertyName];
    };
    //Generar PDF
    $scope.createPDF = function(){
    var doc = new jsPDF("landscape", "mm", "a4");
    var elementHandler = {
        '#ignorePDF': function (element, renderer) {
            return true;
        },
        '#anotherIdToBeIgnored': function (element, renderer) {
            return true;
        },
        '#pdfButton': function (element, renderer) {
            return true;
        }
    };
    var source = $('#tblPuntajes')[0];
    doc.fromHTML(
        source,
        15,
        15,
        {
            'width': 180,'elementHandlers': elementHandler
        });

    //doc.output('save', 'filename.pdf');


    //doc.autoPrint();
    window.open(doc.output('bloburl'), '_blank');
    $location.path('/');
};
    $scope.demoFromHTML = function() {
        var pdf = new jsPDF('p', 'pt', 'letter');
        // source can be HTML-formatted string, or a reference
        // to an actual DOM element from which the text will be scraped.
        source = $('#tblPuntajes')[0];

        // we support special element handlers. Register them with jQuery-style
        // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
        // There is no support for any other type of selectors
        // (class, of compound) at this time.
        specialElementHandlers = {
            '#ignorePDF': function (element, renderer) {
                return true;
            },
            '#anotherIdToBeIgnored': function (element, renderer) {
                return true;
            },
            '#pdfButton': function (element, renderer) {
                return true;
            },
            '#bypassme': function (element, renderer) {
                // true = "handled elsewhere, bypass text extraction"
                return true
            }
        };
        margins = {
            top: 80,
            bottom: 60,
            left: 10,
            width: 700
        };
        // all coords and widths are in jsPDF instance's declared units
        // 'inches' in this case
        pdf.fromHTML(
            source, // HTML string or DOM elem ref.
            margins.left, // x coord
            margins.top, { // y coord
                'width': margins.width, // max width of content on PDF
                'elementHandlers': specialElementHandlers
            },

            function (dispose) {
                // dispose: object with X, Y of the last line add to the PDF
                //          this allow the insertion of new lines after html
                pdf.save('Test.pdf');
            }, margins);
        //window.open(pdf.output('bloburl'), '_blank');

    };
    $scope.printData = function () {

            var divToPrint=document.getElementById("tblPuntajes");
            newWin= window.open("");
            newWin.document.write(divToPrint.outerHTML);
            newWin.print();
            newWin.close();
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
        //For each de los items de cada plan para comprobar que no tennga mas de un item en requerido

        return result;
        if(!validarRequired($scope.sitRegistro))
        {
            showNotification("Verifique que en Situación en el Registro, no haya mas de un elemento excluyente por categoría",'danger');
            result=false
        }
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
    var validarRequired= function(){
        var BreakException = {};
        var result =true;
        try {
            $scope.sitRegistro.items.forEach(function(elemento1, index1){
                $scope.sitRegistro.items.forEach(function(elemento2,index2){
                    if(elemento1!=elemento2 && elemento1.categoria == elemento2.categoria && elemento1.required == true && elemento2.required==true){
                        showNotification("Verifique que en Situación en el Registro, no haya mas de un elemento excluyente por categoría",'danger');
                        result= false;
                        throw BreakException;
                    }
                });
            });
            $scope.sitHogar.items.forEach(function(elemento1, index1){
                $scope.sitHogar.items.forEach(function(elemento2,index2){
                    if(elemento1!=elemento2 &&  elemento1.categoria == elemento2.categoria && elemento1.required == true && elemento2.required==true){
                        showNotification("Verifique que en Situación del hogar, no haya mas de un elemento excluyente por categoría",'danger');
                        result= false;
                        throw BreakException;
                    }
                });
            });
            $scope.sitEspecial.items.forEach(function(elemento1, index1){
                $scope.sitEspecial.items.forEach(function(elemento2,index2){
                    if(elemento1!=elemento2 && elemento1.categoria == elemento2.categoria && elemento1.required == true && elemento2.required==true){
                        showNotification("Verifique que en Situaciones especiales, no haya mas de un elemento excluyente por categoría",'danger');
                        result= false;
                        throw BreakException;
                    }
                });
            });
            $scope.sitHab.items.forEach(function(elemento1, index1){
                $scope.sitHab.items.forEach(function(elemento2,index2){
                    if(elemento1!=elemento2 && elemento1.categoria == elemento2.categoria && elemento1.required == true && elemento2.required==true){
                        showNotification("Verifique que en Situación habitacional, no haya mas de un elemento excluyente por categoría",'danger');
                        result= false;
                        throw BreakException;
                    }
                });
            });

        } catch (e) {
            if (e !== BreakException) throw e;
            result= false;
        }
        return result;


    };
};






