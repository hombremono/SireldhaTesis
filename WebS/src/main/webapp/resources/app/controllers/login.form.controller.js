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


								  } else {
									  $rootScope.authenticated=false;
									  $rootScope.openLoginForm();
								  }
								  $rootScope.regularCall=true;

								});
                    coreService.checkInfo().then(
                        function(resp){
                            if(resp.data != "")
                            {
                                var auth = resp.data.authorities[0].authority;
                                if(auth=="ROLE_ENTRY"){
                                    $rootScope.acceso=2;
                                }else if(auth=="ROLE_PLAN"){
                                    $rootScope.acceso=3;
                                }else if(auth=="ROLE_ADMIN"){
                                    $rootScope.acceso=1;
                                }
                                else{
                                    $rootScope.acceso =0;
                                }
                                welcomeNotification(resp.data.firstname);
                            }

                        });
				}
			},
			function(respErr){
				$log.log(respErr);
			}
		);
	  };
    var welcomeNotification = function(nombre){
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