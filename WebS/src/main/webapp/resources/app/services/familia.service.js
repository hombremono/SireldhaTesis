
angular.module('webS')
    .factory('familiaService',['$http','URL_API_BASE',function($http, URL_API_BASE) {
        return {
            list: function() {
                return $http.get(URL_API_BASE+"familia/");
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
            }
        }
    }]);

