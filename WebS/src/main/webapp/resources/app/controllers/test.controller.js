angular.module('iw3')
.controller('TestController',['$scope','$log',TestController] );

function TestController($scope,$log) {
	$scope.titulo="Hola desde el controlador";
	$scope.numero=3;
	$scope.opt={arreglo:[
	                    {id:1, dato:'Hola4'},
	                    {id:2, dato:'Hola3'},
	                    {id:3, dato:'Hola2'},
	                    {id:4, dato:'Hola1'}
	                     ]};
}