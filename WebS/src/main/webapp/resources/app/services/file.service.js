angular.module('webS')
    .factory('fileService',['$http','URL_API_BASE',function($http, URL_API_BASE,ajaxService) {
        return {
            addFiles: function(data) {
                debugger;
                        var data = {}; //file object

                        var fd = new FormData();
                        fd.append('file', data.file);
                        debugger;
                        $http.post(URL_API_BASE+"files/fs", fd, {
                            withCredentials: false,
                            headers: {
                                'Content-Type': 'multipart/form-data; charset=utf-8'
                            },
                            transformRequest: angular.identity,
                            params: {
                                fd:fd
                            },
                            responseType: "arraybuffer"
                        })
                            .then(function(response) {
                                debugger;
                                var data = response.data;
                                var status = response.status;
                                console.log(data);
                            })
                            .catch(function(error) {
                                console.log(error.status);
                            });
                    }
                }


    }]);