angular.module('webS',['ngRoute','ngSanitize', 'ui.bootstrap', 'ngTagsInput','solicitud-directives'])
.constant('URL_API_BASE','/WebS/api/v1/')
.run(['$rootScope','$location','$uibModal', function($rootScope,$location,$uibModal) {
    $rootScope.relocate=function(loc) {
  	  $location.path(loc);
    }
    
	$rootScope.authenticated=false;
	$rootScope.user={name:"",password:""};
	$rootScope.loginOpen=false;

	$rootScope.openLoginForm = function(size) {
		if(!$rootScope.loginOpen) {
			$rootScope.loginOpen=true;
			var loginForm = $uibModal.open({
				animation: true,
				backdrop : 'static',
				keyboard : false,
				templateUrl: 'views/loginForm.html',
				controller: 'LoginFormController',
				size: size,
				resolve: {
					user: function() {
						return $rootScope.user
					}
				}
			});
		}
	};
}])
.filter('highlight', function($sce) {
    return function(text, phrase) {
        if (phrase) text = text.replace(new RegExp('('+phrase+')', 'gi'),
          '<span style="background: yellow">$1</span>')

        return $sce.trustAsHtml(text)
      }
  });