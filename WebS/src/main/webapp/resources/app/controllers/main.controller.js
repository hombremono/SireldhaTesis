angular.module('webS')
    .controller('MainController', ['$scope','$location', '$rootScope', 'coreService', MainController ]);

function MainController($scope, $location, $rootScope, coreService) {
    $scope.titulo="Menú Principal";
    $scope.acceso = $rootScope.acceso;
    $scope.iniciarSesion = function(){
        $rootScope.authenticated=false;
        $rootScope.openLoginForm();
        coreService.pingAuth().then(
            function(resp){
                if((resp.status===200 && resp.data.code==0)|| true) {
                    $rootScope.user.name=resp.data.username;
                    $rootScope.authenticated=true;
                } else {
                    $rootScope.authenticated=false;
                    // $rootScope.openLoginForm();
                }
                $rootScope.regularCall=true;
            });
        // coreService.checkInfo().then(
        //     function(resp){
        //         if(resp.data != "")
        //         {
        //             var auth = resp.data.authorities[0].authority;
        //             if(auth=="ROLE_ENTRY"){
        //                 $rootScope.acceso=2;
        //             }else if(auth=="ROLE_PLAN"){
        //                 $rootScope.acceso=3;
        //             }else if(auth=="ROLE_ADMIN"){
        //                 $rootScope.acceso=1;
        //             }
        //             else{
        //                 $rootScope.acceso =0;
        //             }
        //         }
        //
        //     });
    };

    $scope.$watch("acceso",function(newValue,oldValue){
        console.log($scope.acceso+" VaLor anterior: "+oldValue+ " ---Valor Actual: "+newValue);
    });

    $scope.startSolicitud = function(){
        $location.path('/requestHome');
    };
    //$scope.rol=0;



}
