angular.module('webS')
.service('APIInterceptor', function($rootScope) {
    var service = this;
    //debugger;

    service.responseError = function(response) {
        debugger;
       if(response.status==401) {
    	   $rootScope.openLoginForm();
       }
       return response;
    };
})