angular.module('webS')
.service('APIInterceptor', function($rootScope) {
    var service = this;
    //debugger;

    service.responseError = function(response) {
       if(response.status==401) {
    	   $rootScope.openLoginForm();
       }if(response.status==403) {
           //TODO: Handle the Forbidden view response on the frontend
           $rootScope.openLoginForm();
       }
       return response;
    };
})