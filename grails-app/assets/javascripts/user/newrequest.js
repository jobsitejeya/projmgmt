var NewRequestApp = angular.module('NewRequestApp', [ 'ui.bootstrap' ]);

NewRequestApp.controller('NewRequestCtrl', function($scope, $log, $http) {
	$log.info("New request ctrl instantiated.");


    $scope.request = {
        'requestdate':new Date()
    };

    $scope.dateOptions = {
        formatYear: 'yy',
        startingDay: 1
    };

    $scope.open = function($event) {
        $event.preventDefault();
        $event.stopPropagation();

        $scope.opened = true;
    };

    // Disable weekend selection
    $scope.disabled = function(date, mode) {
        return ( mode === 'day' && ( date.getDay() === 0 || date.getDay() === 6 ) );
    };

    $scope.formats = ['dd-MM-yyyy'];
    $scope.format = $scope.formats[0];

	$scope.getProjects = function(val) {
		$log.info("Get manager value" + val);
		return $http.get('getProjectNames', {
			params : {
				projectname : val,
				sensor : false
			}
		}).then(function(response) {
            $log.info(response.data.projects);
			return response.data.projects;
		});
	};
});