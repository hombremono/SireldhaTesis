/**
 * Created by fran_ on 12/6/2017.
 */
angular.module('webS').controller('ReviewController',
    [ '$scope', '$sce', '$uibModal','$location',  ReviewController ]);
function ReviewController($scope, $sce, $uibModal, $location) {
    $scope.titulo = "Reviews";
    $scope.resumen={};
    

    $scope.finish = function(){
        $location.path("/");
    };


    
}




