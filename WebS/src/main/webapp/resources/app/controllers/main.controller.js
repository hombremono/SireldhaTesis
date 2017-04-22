angular.module('webS')
.controller('MainController', ['$scope', '$rootScope', 'coreService', MainController ]);

function MainController($scope, $rootScope, coreService) {
  $scope.titulo="Menú Principal"; 
	coreService.pingAuth().then(
			function(resp){ 
				  if(resp.status===200 && resp.data.code==0) {
					  $rootScope.user.name=resp.data.username;
					  $rootScope.authenticated=true;
				  } else {
					  $rootScope.authenticated=false;
					  $rootScope.openLoginForm();
				  }
				  $rootScope.regularCall=true;
				});
}
