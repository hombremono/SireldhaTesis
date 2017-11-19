
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
          templateUrl: 'views/localidad/listaLocalidades.html',
          controller: 'LocalidadController'
      })
      //Plan
      .when('/plans', {
          templateUrl: 'views/plan/listaPlanes.html',
          controller: 'PlanController'
      })
      .when('/family', {
          templateUrl: 'views/familia/familia.html',
          controller: 'FamiliaController'
      })
      .when('/requestHome', {
          templateUrl: 'views/solicitud/cargarHogar.html',
          controller: 'HogarController'
      })
      .when('/requestJF', {
          templateUrl: 'views/solicitud/cargarJefeHogar.html',
          controller: 'FamiliaController'
      })
      .when('/requestProperty', {
          templateUrl: 'views/solicitud/datosInmueble.html',
          controller: 'InmuebleController'
      })
      .when('/requestPropertyCons', {
          templateUrl: 'views/solicitud/conservacionInmueble.html',
          controller: 'InmuebleController'
      })
      .when('/loadFiles', {
          templateUrl: 'views/solicitud/filesUpload.html',
          controller: 'FileController'
      })
      .when('/review', {
          templateUrl: 'views/solicitud/review.html',
          controller: 'ReviewController'
      })
      .when('/search', {
          templateUrl: 'views/searchPersona.html',
          controller: 'FamiliaController'
      })
      .when('/searchFamily', {
          templateUrl: 'views/searchFamily.html',
          controller: 'FamiliaController'
      })
      .when('/newPlan', {
          templateUrl: 'views/plan/agregarPlan.html',
          controller: 'PlanController'
      })
    .otherwise({
      redirectTo: '/'
    });
  });
