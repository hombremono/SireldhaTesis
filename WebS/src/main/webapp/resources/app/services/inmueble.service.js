
angular.module('webS')
    .factory('inmuebleService',['$http','URL_API_BASE',function($http, URL_API_BASE) {
        return {
            list: function() {
                return $http.get(URL_API_BASE+"inmueble/");
            },
            update: function(o) {
                return $http.put(URL_API_BASE+"inmueble/",o);
            },
            add: function(o) {
                return $http.post(URL_API_BASE+"inmueble/",o);
            },
            get: function(id) {
                return $http.get(URL_API_BASE+"inmueble/"+id);
            },
            delete: function(id) {
                return $http.delete(URL_API_BASE+"inmueble/"+id);
            },
            loadCombosInmueble:function(){
                return $http.get(URL_API_BASE+"inmueble/loadCombos");
            },
            addTerreno:function(o){
                return $http.post(URL_API_BASE+"inmueble/terreno/",o);
            },
            addSinInmueble:function(o){
                return $http.post(URL_API_BASE+"inmueble/sinInmueble/",o);
            },
            addAlquiler:function(o){
                return $http.post(URL_API_BASE+"inmueble/alquiler/",o);
            },
            addCareceInmueble:function(o){
                return $http.post(URL_API_BASE+"inmueble/careceVivienda/",o);
            },
            addCocina: function(o){
                return $http.post(URL_API_BASE+"inmueble/cocina/",o);
            },
            addBano:function(o){
                return $http.post(URL_API_BASE+"inmueble/bano/",o);
            }

        }
    }]);

