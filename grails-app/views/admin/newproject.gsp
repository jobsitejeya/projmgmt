<%@page import="com.projmgmt.domain.ProjectType"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>New Project - Project Resource Management</title>
<style>
html, body {
	min-height: 100%;
	padding: 0;
	margin: 0;
	font-family: 'Source Sans Pro', "Helvetica Neue", Helvetica, Arial,
		sans-serif;
}

</style>
<script>

	var project = {};
	project.esaid  = '${esaid}';

	window.project = project;
</script>

</head>
<body class="skin-blue">

	<header class="header">
		<a href="index.html" class="logo">Project Management </a>
		<nav class="navbar navbar-static-top" role="navigation"></nav>
	</header>

	<div class="wrapper row-offcanvas row-offcanvas-left"
		ng-app="NewProjectApp" ng-controller="ProjectCtrl">
		<g:render template="menu"></g:render>
		<aside class="right-side">

			<section class="content-header">
				<h1>Project Creation</h1>
				<small>Use the form below to create projects</small>
			</section>
			<section class="content">
				<div class="row">
					<div class="col-md-8">
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">New Project Form</h3>
							</div>
							<form role="form" name="newprojectform">
								<div class="box-body">
									<div class="form-group">
										<label for="projectname">Project Name:</label><small>(required)</small>
										<input type="text" class="form-control"
											ng-model="project.projectname" id="project.projectname"
											placeholder="Enter project name" required></input>
									</div>
									<div class="form-group">
										<label for="esaprojectid">ESA Project ID:</label><small>(required)</small>
										<input type="text" class="form-control"
											ng-model="project.esaid" id="esaprojectid"
											placeholder="Enter valid ESA Project id" required></input>
									</div>
									<div class="form-group">
										<label for="managername">Manager Name:</label><small>(required)</small>
										<input type="text" class="form-control" id="managername"
											ng-model="project.manager"
											typeahead=" manager as manager.lastname +', '+ manager.firstname for manager in getManagerValues($viewValue)"
											typeahead-loading="loadingmanagers"
											placeholder="Enter Manager Name" required></input>

									</div>
									<div class="form-group">
										<label for="managerid">Manager Id:</label> <input type="text"
											class="form-control" id="managerid"
											value="{{project.manager.id}}" disabled required></input>
									</div>

									<div class="form-group">
										<label for="projecttype">Project Type:</label><small>(required)</small>
										<select class="form-control" id="projecttype"
											ng-model="project.projecttype"
											placeholder="Select project type" required>
											<g:each in="${projecttypes }">
												<option value="${it.type }">
													${it.description }
												</option>
											</g:each>
										</select>
									</div>
								</div>
								<div class="box-footer">
									<button class="btn btn-primary"
										ng-disabled="newprojectform.$invalid"
										ng-click="saveNewProject()">Add Project</button>
									<button class="btn btn-warning">Cancel</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>

		</aside>

		<script type="text/ng-template" id="savemodal.html">
        	<div class="modal-header">
            <h4 class="modal-title">Project - New </h4>
        	</div>
        	<div class="modal-body">
				<h5> Project created successfully (Project Id: {{project.id}})</h5>
       	    </div>
        	<div class="modal-footer">
            <button class="btn btn-primary" ng-click="edit()">Edit Project</button>
            <button class="btn btn-warning" ng-click="close()">Close</button>
        	</div>
    </script>
	</div>
	<script>
		$('.projectype1').typeahead()
	</script>
	<asset:javascript src="admin/newproject.js" />

</body>
</html>