var SearchProjectApp = angular.module('SearchProjectApp', [ 'ui.bootstrap' ]);

SearchProjectApp.controller('SearchCtrl', function($scope, $log, $http) {
	$log.info('Search intiantiated....');

	$scope.project = {
		esaid : '',
		projectname : ''
	};

	$scope.searchProjects = function() {
		$scope.deletemsg="";
		$http.get('searchproject', {
			'params' : {
				'esaid' : $scope.project.esaid,
				'projectname' : $scope.project.projectname
			}
		}).success(function(data) {
			$log.info(data);
			// $scope.gridOptions.data = data;
			$scope.projects = data;

			//projectStore.setData(data);
			
			

		}).error(function(data) {
			$log.info(data)

		});
	};
	
	$scope.editProject = function(index){
		$log.info(" Index selected : "+ index);
		
		var selectedRecord = $scope.projects[index];
		$log.info(selectedRecord);
		// go to edit page		
		window.location.href = "modifyproject/"+selectedRecord.id;
	};
	
	$scope.deleteProject = function(index){
		$log.info(" Index selected : "+ index);
		var selectedRecord = $scope.projects[index];
		$log.info(selectedRecord);
		
		$http.get('deleteproject', {
			'params' : {
				'id' : selectedRecord.id
			}
		}).success(function(data) {
			$scope.projects.splice(index,1);
			$log.info(data);
			$scope.deletemsg = data.msg;
			
		}).error(function(data) {
			$log.info(data)

		});
	}

});


/*
Ext.define('Project', {
	extend : 'Ext.data.Model',
	fields : [ 'id', 'esaid', 'projectname', "projectmanager" ]
});

var projectStore = Ext.create('Ext.data.Store', {
	model : 'Project',
	data : []
});

var grid = null;

SearchProjectApp.run(function() {
	console.log(Ext.get('searchgrid'));
	Ext.onReady(function() {
		grid = Ext.create('Ext.grid.Panel', {
			//renderTo : Ext.get('searchgrid'),
			store : projectStore,
			width : '100%',
			height : 500,
			title : 'Project Search Listing',
			columns : [ {
				text : 'Id',
				width : 100,
				sortable : false,
				hideable : false,
				dataIndex : 'id'
			}, {
				text : 'ESA Id',
				width : 275,
				dataIndex : 'esaid'
			}, {
				text : 'Project Name',
				flex : 1,
				dataIndex : 'projectname'
			}, {

				xtype : 'actioncolumn',
				text : 'Action',
				items : [ {
					icon : '../images/delete.gif',
					tooltip : 'Delete',
					handler : function(grid, rowIndex, colIndex) {
						var recId = grid.getStore().getAt(rowIndex).get('id');
						Ext.Ajax.request({
							url:'deleteproject',
							params:{
								id:recId
							},
							success:function(response){
								var data = Ext.JSON.decode(response.responseText);
								grid.getStore().remove([grid.getStore().getAt(rowIndex)]);
							}
						});
						
					}
				}, {
					icon : '../images/cog_edit.png',
					style:'marginLeft:10px',
					tooltip : 'Edit',
					handler : function(grid, rowIndex, colIndex) {
						var recId = grid.getStore().getAt(rowIndex).get('id');
						// redirect to modify page
						window.location.href = "modifyproject/"+recId;
					}
				} ]

			} ]
		});
	});

});

*/