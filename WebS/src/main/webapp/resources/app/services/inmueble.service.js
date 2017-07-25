
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
            }
        }
    }]);

