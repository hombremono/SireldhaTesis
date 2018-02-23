angular.module('webS').controller('PdfController',
    [ '$http','URL_API_BASE','$scope','$rootScope', '$sce', '$uibModal','familiaService','$location', PdfController]);
function PdfController( $http, URL_API_BASE, $scope,$rootScope, $sce, $uibModal,familiaService, $location) {

    $scope.clave = "";
    familiaService.get($rootScope.idFamilia).then(function(resp){
        $scope.clave=resp.data.codigoDeAlta;
    });
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
        var source = window.document.getElementById("printThis");
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
        $.notify({
            icon: "pe-7s-smile",
            message: 'Solicitud cargada con Exito!'

        },{
            type: 'success',
            timer: 4000,
            placement: {
                from: 'top',
                align: 'right'
            }
        });
        $location.path('/');
    };

};
