angular.module('webS')
.factory('usersService',['$http','URL_API_BASE',function($http, URL_API_BASE) {
   return {
	   list: function() {
		   return $http.get(URL_API_BASE+"users/");
	   },
	   update: function(o) {
		   return $http.put(URL_API_BASE+"users/",o);
	   },
	   add: function(o) {
		   return $http.post(URL_API_BASE+"users/",o);
	   },
	   get: function(id) {
		   return $http.get(URL_API_BASE+"users/"+id);
	   },
	   delete: function(id) {
		   return $http.delete(URL_API_BASE+"users/"+id);
	   }
   }
}]);
