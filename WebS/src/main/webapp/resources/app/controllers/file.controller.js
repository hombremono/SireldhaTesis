angular.module('webS').controller('FilesController',
    [ '$scope', '$sce', '$uibModal','$location', 'fileService', FilesController ]);
function FilesController($scope, $sce, $uibModal, $location, fileService) {

  $scope.files = [];
  $scope.uploadFile = function(){
        var file = $scope.myFile;
      fileService.addFiles(file).then(function(resp) {
          var v = resp.data
          debugger;
      }, function(respErr) {
          var v = respErr;
          debugger;
      });

    };
  $scope.finish = function(){
    $location.path('/review');
  };
};


// angular.module('webS').directive('fileModel', ['$parse', function ($parse) {
//     return {
//         restrict: 'A',
//         link: function(scope, element, attrs) {
//             var model = $parse(attrs.fileModel);
//             var modelSetter = model.assign;
//             element.bind('change', function(){
//                 scope.$apply(function(){
//                     modelSetter(scope, element[0].files[0]);
//                 });
//             });
//         }
//     };
// }]);
angular.module('webS').directive("fileModel",function() {
    return {
        restrict: 'EA',
        scope: {
            setFileData: "&"
        },
        link: function(scope, ele, attrs) {
            ele.on('change', function() {
                scope.$apply(function() {
                    var val = ele[0].files[0];
                    scope.setFileData({ value: val });
                });
            });
        }
    }
})