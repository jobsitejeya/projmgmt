var ModifyProjectApp = angular.module('ModifyProjectApp',[ 'ui.bootstrap' ]);

ModifyProjectApp.controller('ModifyCtrl', function($scope, $log, $http){
	
	$log.info(' Modify Ctrl initianted....');
	
	$scope.project = window.project;
	$log.info($scope.project);
	$scope.getManagerValues = function(val) {
		$log.info("Get manager value"+val);
		return $http.get('../getManagerNames', {
			params : {
				managername : val,
				sensor : false
			}
		}).then(function(response) {
			return response.data.mgrs;
		});
	};
	
	$scope.saveProject = function(){
		
		$http.post('../saveEditedProject',{project:$scope.project}).
		success(function(data){
			$log.info("successfully changes made");
			$log.info(data);
			window.location.href="../dashboard";
		}).
		error(function(data){
			
		});
	}
		
});