<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Administration - Project Resource Management</title>
<style>
html, body {
	min-height: 100%;
	padding: 0;
	margin: 0;
	font-family: 'Source Sans Pro', "Helvetica Neue", Helvetica, Arial,
		sans-serif;
}
</style>



</head>
<body class="skin-blue">

	<header class="header">
		<a href="index.html" class="logo">Project Management </a>
		<nav class="navbar navbar-static-top" role="navigation"></nav>
	</header>

	<div class="wrapper row-offcanvas row-offcanvas-left"
		ng-app="SearchProjectApp" ng-controller="SearchCtrl">
		<g:render template="menu"></g:render>
		<aside class="right-side">
			<section class="content-header">
				<h1>Project Search</h1>
				<small>Use the form below to search projects</small>
			</section>
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">Project Search</h3>
							</div>
							<div class="box-body">
								<div class="alert alert-info alert-dismissible" role="alert" ng-show="deletemsg">
									 <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>Warning!</strong>{{deletemsg}}
								</div>	
								<div class="row">
									<div class="col-xs-4">
										<input type="text" class="form-control"
											placeholder="Enter ESA id" ng-model="project.esaid"></input>
									</div>
									<div class="col-xs-4">
										<input type="text" class="form-control"
											placeholder="Enter project name"
											ng-model="project.projectname"></input>
									</div>
									<div class="col-xs-4">
										<button class="btn btn-primary" ng-click="searchProjects()">Search</button>
									</div>
									<%--
									
									{{project.esaid}}
									{{project.projectname}}
									
								--%>
								</div>
								<div style="margin-top: 5px">
									<%--<div id="projectGrid" ui-grid="gridOptions"
										style="width: 100%; height: 200px;"></div>
								--%>
									<div id="searchgrid" style="width: 100%; margin-top: 10px;">
									</div>

									<table class="table table-striped">
										<thead>
											<tr>
												<th>Id</th>
												<th>ESA ID</th>
												<th>Project Name</th>
												<th>Project manager</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<tr ng-repeat="project in projects">
												<td><span ng-bind="project.id"></span></td>
												<td><span ng-bind="project.esaid"></span></td>
												<td><span ng-bind="project.projectname"></span></td>
												<td><span ng-bind="project.projectmanager"></span></td>
												<td><button class="btn btn-primary" ng-click="editProject($index)">Edit</button> 
												<button class="btn btn-danger "  ng-click="deleteProject($index)">Delete</button></td>
											</tr>
										</tbody>
									</table>

								</div>
							</div>


						</div>
					</div>
				</div>
			</section>
		</aside>
	</div>

	<asset:javascript src="admin/searchproject.js" />
</body>
</html>