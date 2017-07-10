
angular.module('webS')
.config(function($routeProvider,$locationProvider,$httpProvider) {
	//console.log("Iniciando configuración.");
	$httpProvider.interceptors.push('APIInterceptor');
	$locationProvider.hashPrefix('!');
  $routeProvider
    .when('/', {
      templateUrl: 'views/main.html',
      controller: 'MainController'
    })
    .when('/users', {
      templateUrl: 'views/users.html',
      controller: 'UsersController'
    })
      //Localidades
      .when('/localities', {
          templateUrl: 'views/listaLocalidades.html',
          controller: 'LocalidadController'
      })
      //Plan
      .when('/plans', {
          templateUrl: 'views/listaPlanes.html',
          controller: 'PlanController'
      })
      .when('/family', {
          templateUrl: 'views/listaFamilia.html',
          controller: 'FamiliaController'
      })
      .when('/requestHome', {
          templateUrl: 'views/cargarHogar.html',
          controller: 'SolicitudController'
      })
      .when('/requestJF', {
          templateUrl: 'views/cargarJefeHogar.html',
          controller: 'FamiliaController'
      })
      .when('/requestProperty', {
          templateUrl: 'views/datosInmueble.html',
          controller: 'InmuebleController'
      })
      .when('/requestPropertyState', {
          templateUrl: 'views/estadoInmueble.html',
          controller: 'InmuebleController'
      })
    .otherwise({
      redirectTo: '/'
    });
  });
