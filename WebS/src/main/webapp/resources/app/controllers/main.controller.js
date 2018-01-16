angular.module('webS')
    .controller('MainController', ['$scope','$location', '$rootScope', 'coreService', MainController ]);

function MainController($scope, $location, $rootScope, coreService) {
    $scope.titulo="Menú Principal";
    debugger;
    $scope.acceso = $rootScope.acceso;
    debugger;
    $scope.$watch("acceso",function(newValue,oldValue){
        console.log($scope.acceso+" VaLor anterior: "+oldValue+ " ---Valor Actual: "+newValue);
    });

    $scope.startSolicitud = function(){
        $location.path('/requestHome');
    };
    //$scope.rol=0;


    coreService.pingAuth().then(
        function(resp){
            if((resp.status===200 && resp.data.code==0)|| true) {
                $rootScope.user.name=resp.data.username;
                $rootScope.authenticated=true;
            } else {
                $rootScope.authenticated=false;
                $rootScope.openLoginForm();
            }
            $rootScope.regularCall=true;
        });
}
