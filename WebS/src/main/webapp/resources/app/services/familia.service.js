
angular.module('webS')
    .factory('familiaService',['$http','URL_API_BASE',function($http, URL_API_BASE) {
        return {
            loadCombosPersona: function() {
                return $http.get(URL_API_BASE+"persona/loadCombos");
            },
            list: function() {
                return $http.get(URL_API_BASE+"familia/");
            },
            getIntegrantes: function(id) {
                return $http.get(URL_API_BASE+"familia/integrantes/"+id);
            },
            update: function(o) {
                return $http.put(URL_API_BASE+"familia/",o);
            },
            add: function(o) {
                return $http.post(URL_API_BASE+"familia/",o);
            },
            get: function(id) {
                return $http.get(URL_API_BASE+"familia/"+id);
            },
            delete: function(id) {
                return $http.delete(URL_API_BASE+"familia/"+id);
            },
            addRelacionDep: function(o){
                return $http.post(URL_API_BASE+"trabajo/dependencia/",o);
            },
            addAutonomo: function(o)
            {
                return $http.post(URL_API_BASE+"trabajo/autonomo/",o);
            },
            getRelacionDep:function (id) {
                return $http.get(URL_API_BASE+"trabajo/dependencia/"+id);
            },
            getAutonomo:function(id){
                return $http.get(URL_API_BASE+"trabajo/autonomo/"+id);
            },
            updateRelacionDep:function(o){
                return $http.put(URL_API_BASE+"trabajo/dependencia/",o);
            },
            updateAutonomo:function(o){
                return $http.put(URL_API_BASE+"trabajo/autonomo/",o);
            }

        }
    }]);

