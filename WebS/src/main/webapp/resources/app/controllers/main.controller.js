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
                }

            });
    };
    $rootScope.generarReportes=function(){
        coreService.getExcel().then(function(resp){
            var json = resp.data;
            //var json = $.parseJSON(json_pre);

            var csv = JSONtoCSV(json);
            var downloadLink = document.createElement("a");
            var blob = new Blob(["\ufeff", csv]);
            var url = URL.createObjectURL(blob);
            downloadLink.href = url;
            downloadLink.download = "data.csv";

            document.body.appendChild(downloadLink);
            downloadLink.click();
            document.body.removeChild(downloadLink);
        });

    };

    $scope.$watch("acceso",function(newValue,oldValue){
        console.log($scope.acceso+" VaLor anterior: "+oldValue+ " ---Valor Actual: "+newValue);
    });

    $scope.startSolicitud = function(){
        $location.path('/requestHome');
    };
     var JSONtoCSV=function(objArray){
         var array = typeof objArray != 'object' ? JSON.parse(objArray) : objArray;
         var str = "";

         for (var i = 0; i < array.length; i++) {
             var line = "";
             for (var index in array[i]) {
                 if (line != "") line += ","

                 line += array[i][index];
             }

             str += line + "\r\n";
         }

         return str;
    }
    //$scope.rol=0;



}
