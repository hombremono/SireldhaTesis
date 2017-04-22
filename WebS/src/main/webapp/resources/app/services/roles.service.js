angular.module('webS')
.factory('rolesService',['$http','URL_API_BASE',function($http, URL_API_BASE) {
   return {
	   list: function() {
		   return $http.get(URL_API_BASE+"roles/");
	   }
   }
}]);
