var NewProjectApp = angular.module('NewProjectApp', [ 'ui.bootstrap' ]);

NewProjectApp.controller('ProjectCtrl', function($scope, $http, $log, $location, $modal) {
	$log.info("ProjectCTRL initialized");
	$scope.project = {};
	$scope.project.esaid = window.project.esaid
	$log.info(window.project.esaid);
	$scope.getManagerValues = function(val) {
		$log.info("Get manager value"+val);
		return $http.get('getManagerNames', {
			params : {
				managername : val,
				sensor : false
			}
		}).then(function(response) {
			return response.data.mgrs;
		});
	};
	
	
	$scope.saveNewProject = function(){
		$log.info("Save new project called....");
		
		$http.post('saveNewProject', {project:$scope.project}).
		success(function(data){
			$log.info(data);
			if(data.success){
				$log.info("Project created...");
				// redirect to dashboard
//				$scope.id=data.id;
				var modalInstance = $modal.open({
					templateUrl:'savemodal.html',
					controller:'SaveModalCtrl',
					backdrop:'static',
					resolve :{
						project:function(){
							return data.project;
						}
					}
				});
			}
			else{
				$log.info("Project creation unsuccessfull");
				// show error
			}
			
		}).
		error(function(data){
			$log.info("Fatal error");
		});
	};
}).
controller('SaveModalCtrl', function($scope, $log, $modalInstance, project){
	$scope.project = project;
	$log.info("Save modal ctrl intianiated");
	$log.info(project);
	$scope.edit = function(){
		$log.info("Id selected : "+$scope.project.id);
		window.location.href="modifyproject/"+$scope.project.id
	}
	$scope.close = function(){
		$log.info(" close called...");
		$modalInstance.dismiss('cancel');
		window.location.href = "searchindex";
	}
});