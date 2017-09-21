
angular.module('webS')
    .factory('hogarService',['$http','URL_API_BASE',function($http, URL_API_BASE) {
        return {
            loadCombos: function() {
                return $http.get(URL_API_BASE+"hogar/loadCombos");
            },
            list: function() {
                return $http.get(URL_API_BASE+"hogar/");
            },
            update: function(o) {
                return $http.put(URL_API_BASE+"hogar/",o);
            },
            add: function(o) {
                return $http.post(URL_API_BASE+"familia/",o);
            },
            get: function(id) {
                return $http.get(URL_API_BASE+"hogar/"+id);
            },
            delete: function(id) {
                return $http.delete(URL_API_BASE+"hogar/"+id);
            },
            addTelefono: function(o){
                return $http.post(URL_API_BASE+"dirtel/telefono/",o);
            },
            addDireccion: function(o){
                return $http.post(URL_API_BASE+"dirtel/direccion",o);
            }
        };
    }]);