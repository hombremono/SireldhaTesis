angular.module('webS').controller('PdfController',
    [ '$http','URL_API_BASE','$scope', '$sce', '$uibModal','$location', PdfController]);
function PdfController( $http, URL_API_BASE, $scope, $sce, $uibModal, $location) {

    $scope.createPDF = function(){
        var doc = new jsPDF("landscape", "mm", "a4");
        var elementHandler = {
            '#ignorePDF': function (element, renderer) {
                return true;
            },
            '#anotherIdToBeIgnored': function (element, renderer) {
                return true;
            },
            '#pdfButton': function (element, renderer) {
                return true;
            }
        };
        var source = window.document.getElementsByTagName("body")[0];
        doc.fromHTML(
            source,
            15,
            15,
            {
                'width': 180,'elementHandlers': elementHandler
            });

        //doc.output('save', 'filename.pdf');


        //doc.autoPrint();
        window.open(doc.output('bloburl'), '_blank');
    };

};
