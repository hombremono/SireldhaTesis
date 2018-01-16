angular.module('webS')
.factory('coreService',['$http','URL_API_BASE',function($http, URL_API_BASE) {
   return {
	   pingAuth: function() {
		   return $http.get(URL_API_BASE+"core/pingAuth");
	   },
	   checkInfo:function(){
	   	return $http.get(URL_API_BASE+"seccheck/my-info");
	   },
	   login: function(user) {
		   var req = {
				   method: 'POST',
				   url: '/WebS/login',
				   headers : {'Content-Type': 'application/x-www-form-urlencoded' },
				   data: 'remember-me=true&username='+user.name+'&password='+user.password
		   };
		   return $http(req);
	   }
   };
}]);