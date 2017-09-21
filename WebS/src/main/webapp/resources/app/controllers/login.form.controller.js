angular.module('webS')
.controller('LoginFormController', ['$rootScope', '$scope', '$log', '$uibModalInstance', 'coreService','user',  LoginFormController]);
function LoginFormController($rootScope, $scope, $log, $uibModalInstance, coreService, user) {
	$scope.title="Ingreso";
	$scope.user=user;
	$scope.login = function () {
		coreService.login(user).then(
			function(resp){
				if(resp.status===200) {
					$rootScope.loginOpen=false;
					$uibModalInstance.dismiss();
					coreService.pingAuth().then(
							function(resp){ 
								  if(resp.status===200 && resp.data.code==0) {
									  $rootScope.user.name=resp.data.username;
									  $rootScope.authenticated=true;
                                      welcomeNotification(resp.data.username);
								  } else {
									  $rootScope.authenticated=false;
									  $rootScope.openLoginForm();
								  }
								  $rootScope.regularCall=true;
								});
				}
			},
			function(respErr){
				$log.log(respErr);
			}
		);
	  };
    var welcomeNotification = function(nombre){
    	debugger;
        $.notify({
            icon: "pe-7s-id",
            message: 'Bienvenido '+nombre

        },{
            type: 'success',
            timer: 4000,
            placement: {
                from: 'top',
                align: 'right'
            }
        });
    }
}