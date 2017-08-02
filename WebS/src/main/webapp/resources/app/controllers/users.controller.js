angular.module('webS').controller('UsersController',
		[ '$scope', '$sce', '$uibModal', 'usersService','rolesService', UsersController ]);
function UsersController($scope, $sce, $uibModal, usersService, rolesService) {
	debugger;
	$scope.titulo = "Usuarios";
	$scope.datos = [];
	$scope.opt = {
		user : {},
		roles : [],
		agregando: false,
		wait : true
	};

	usersService.list().then(function(resp) {
		$scope.datos = resp.data;
		$scope.opt.wait=false;
	}, function(respErr) {
		console.log(respErr);
		$scope.datos = [];
		$scope.opt.wait=false;
	});

	rolesService.list().then(function(resp) {
		$scope.opt.roles = resp.data;
	}, function(respErr) {
		console.log(respErr);
		$scope.opt.roles = [];
	});

	$scope.save = function() {
		usersService.add($scope.opt.user).then(function(resp) {
			if(resp.status==201) {
				var loc=resp.headers('Location');
				var id=loc.substring(loc.lastIndexOf('/')+1);
				usersService.get(id).then(function(resp) {
					$scope.datos.push(resp.data);
				});
			}
			$scope.cancelar();
		}, function(respErr) {
			console.log(respErr);
		});
	}
	$scope.dataOK=function() {

		var u= $scope.opt.user;
		var ts=$scope.testString;
		return $scope.opt.agregando &&
			u != undefined &&
			ts(u.fistName,2) &&
			ts(u.lastName,2) &&
			ts(u.name,2) &&
			ts(u.email,3) &&
			ts(u.password,2) &&
			u.password==u.password1;
	}
	$scope.testString=function(str,minLength) {
		return (str != undefined && str.length>=minLength);
	}
	$scope.edit = function(p) {
		angular.copy(p, $scope.opt.user);
	}
	$scope.cancelar = function() {
		$scope.opt.user = {};
		$scope.opt.agregando=false;
	}
	$scope.delete = function(p) {
		if(confirm("Desea eliminar el registo seleccionado?")) {
			usersService.delete(p.id).then(function(resp) {
				$scope.datos.forEach(function(item, idx) {
					if (item.id === p.id) {
						$scope.datos.splice(idx,1);
						return false;
					}
				});
			}, function(respErr) {
				console.log(respErr);
			});
		}

	}


	$scope.guardar = function() {
		usersService.update($scope.opt.user).then(function(resp) {
			$scope.datos.forEach(function(item, idx) {
				if (item.id === $scope.opt.user.id) {
					angular.copy($scope.opt.user, $scope.datos[idx]);
					return false;
				}
			});
			$scope.cancelar();
		}, function(respErr) {
			console.log(respErr);
			$scope.cancelar();
		});

	}


	$scope.filterRoles=function(q) {
		var out = [];
		$scope.opt.roles.forEach(function(item) {
			if (item.name.toLowerCase().indexOf(q.toLowerCase()) != -1
					&& $scope.opt.user.roles.indexOf(item) === -1) {
				out.push(item);
			}
		});
		return out;
	};


	$scope.agregarModal = function() {
		var modalInstance = $uibModal.open({
		      animation: true,
		      ariaLabelledBy: 'modal-title',
		      ariaDescribedBy: 'modal-body',
		      templateUrl: 'views/fragments/user.form.html',
		      controller: 'AddUserController',
		      controllerAs: '$ctrl',
		      size: 'lg',
		      resolve: {
		        instancia: function () {
		        	return $scope.opt.user;
		        }
		      }
		    });
		 modalInstance.result.then(function (instancia) {
			 if(instancia)
				 $scope.opt.user = instancia;
			 $scope.save();
		    }, function () {
		    	$scope.cancelar();
		    }
		 );
	}
}

angular.module('webS').controller('AddUserController', function ($uibModalInstance, instancia) {
	  var $ctrl = this;
	  $ctrl.instancia = instancia;

	  $ctrl.ok = function () {
	    $uibModalInstance.close($ctrl.instancia);
	  };
	  
	  $ctrl.dataOK=function() {			
		var u= $ctrl.instancia;
		var ts=$ctrl.testString;
		return 	u != undefined &&
			ts(u.fistName,2) && 
			ts(u.lastName,2) && 
			ts(u.name,2) && 
			ts(u.email,3) && 
			ts(u.password,2) && 
			u.password==u.password1;
	}
	 $ctrl.testString=function(str,minLength) {
		return (str != undefined && str.length>=minLength);
	}
	$ctrl.cancel = function () {
	   $uibModalInstance.dismiss();
	};
});

