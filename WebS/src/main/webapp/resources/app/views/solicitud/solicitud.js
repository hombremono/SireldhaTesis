/**
 * Created by fran_ on 21/6/2017.
 */
var app = angular.module('solicitud-directives', []);

app.directive("cargahogar", function() {
    return {
        restrict: "E",
        templateUrl: "cargarHogar.html"
    }
});

app.directive("cargajefe", function() {
    return {
        restrict: "E",
        templateUrl: "cargarJefeHogar.html"
    }
});
//Check URL
app.directive("cargafamilia", function() {
    return {
        restrict: "E",
        templateUrl: "familia/listaFamilia.html"
    }
});

app.directive("datosinmueble", function() {
    return {
        restrict: "E",
        templateUrl: "datosInmueble.html"
    }
});
app.directive("estadoinmueble", function() {
    return {
        restrict: "E",
        templateUrl: "estadoInmueble.html"
    }
});
app.directive("resumen", function() {
    return {
        restrict: "E",
        templateUrl: "resumen.html"
    }
});

app.directive("tabsSolicitud", function() {
    return {
        restrict: "E",

        templateUrl: "tabsSolicitud.html",
        controller: function() {
            this.tab = 1;
            this.isSet = function(checkTab) {
                return this.tab === checkTab;
            };
        },
        controllerAs: "tab"
    };
});

