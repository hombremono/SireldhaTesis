angular.module('webS').controller('FilesController',
    [ '$http','URL_API_BASE','$scope', '$sce', '$uibModal','$location', 'fileService', FilesController]);
function FilesController( $http, URL_API_BASE, $scope, $sce, $uibModal, $location, fileService) {

    $scope.files = [];
    $scope.archivos = [];
    $scope.documentacionCompleta = false;
  $scope.uploadFile = function() {
      $scope.files = document.getElementById("myFileField").files;
      for (var i = 0; i < $scope.files.length; i++) {
          var formData = new FormData();
          formData.append('section', 'general');
          formData.append('action', 'previewImg');
          formData.append('file', $scope.files[i]);
          $.ajax({
              url: "/WebS/api/v1/files/",
              data: formData,
              file: $scope.files[i],
              type: "POST",
              contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
              processData: false // NEEDED, DON'T OMIT THIS
              // ... Other options like success and etc
          }).then(function (response) {
              var data = response.data;
              var status = response.status;
              console.log(data);
              $location.path('/printPdf');

          });
      };
  };
  $scope.finish = function(){
      //POST DEL CHECK
    $location.path('/printPdf');
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