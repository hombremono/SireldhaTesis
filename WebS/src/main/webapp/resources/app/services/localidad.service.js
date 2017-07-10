/**
 * Created by fran_ on 13/6/2017.
 */
/**
 * Created by fran_ on 12/6/2017.
 */
angular.module('webS')
    .factory('localidadService',['$http','URL_API_BASE',function($http, URL_API_BASE) {
        return {
            list: function() {
                return $http.get(URL_API_BASE+"localidad/");
            },
            update: function(o) {
                return $http.put(URL_API_BASE+"localidad/",o);
            },
            add: function(o) {
                return $http.post(URL_API_BASE+"localidad/",o);
            },
            get: function(id) {
                return $http.get(URL_API_BASE+"localidad/"+id);
            },
            delete: function(id) {
                return $http.delete(URL_API_BASE+"localidad/"+id);
            }
        }
    }]);

