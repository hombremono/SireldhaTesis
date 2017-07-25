
angular.module('webS')
    .factory('personaService',['$http','URL_API_BASE',function($http, URL_API_BASE) {
        return {
            list: function() {
                return $http.get(URL_API_BASE+"persona/");
            },
            update: function(o) {
                return $http.put(URL_API_BASE+"persona/",o);
            },
            add: function(o) {
                return $http.post(URL_API_BASE+"persona/",o);
            },
            get: function(id) {
                return $http.get(URL_API_BASE+"persona/"+id);
            },
            delete: function(id) {
                return $http.delete(URL_API_BASE+"persona/"+id);
            }
        }
    }]);