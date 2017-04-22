
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
    .otherwise({
      redirectTo: '/'
    });
  });
