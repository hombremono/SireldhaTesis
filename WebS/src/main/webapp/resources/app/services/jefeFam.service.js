
angular.module('webS')
    .factory('jefeFamiliaService',['$http','URL_API_BASE',function($http, URL_API_BASE) {
        return {
            list: function() {
                return $http.get(URL_API_BASE+"jefeFam/");
            },
            update: function(o) {
                return $http.put(URL_API_BASE+"jefeFam/",o);
            },
            add: function(o) {
                return $http.post(URL_API_BASE+"jefeFam/",o);
            },
            get: function(id) {
                return $http.get(URL_API_BASE+"jefeFam/"+id);
            },
            delete: function(id) {
                return $http.delete(URL_API_BASE+"jefeFam/"+id);
            }
        }
    }]);