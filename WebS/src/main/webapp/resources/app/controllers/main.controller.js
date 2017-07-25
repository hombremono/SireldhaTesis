angular.module('webS')
.controller('MainController', ['$scope','$location', '$rootScope', 'coreService', MainController ]);

function MainController($scope, $location, $rootScope, coreService) {
  $scope.titulo="Menú Principal";

  $scope.startSolicitud = function(){
  	$location.path('/requestHome');
  };

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
