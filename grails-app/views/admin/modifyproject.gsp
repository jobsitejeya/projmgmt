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

<script>
	window.project = {
				id:"${id}",
				projectname:"${projectname}",
				esaid:"${esaid}",
				managername:"${managername}",
				projecttype:"${projecttypeselected}",
				manager:{
						id:"${managerid}",
						firstname:"${firstname}",
						lastname:"${lastname}"
						}
					};
					
			
</script>


</head>
<body class="skin-blue">

	<header class="header">
		<a href="index.html" class="logo">Project Management </a>
		<nav class="navbar navbar-static-top" role="navigation"></nav>
	</header>

	<div class="wrapper row-offcanvas row-offcanvas-left"
		ng-app="ModifyProjectApp" ng-controller="ModifyCtrl">
		<g:render template="menu"></g:render>
		<aside class="right-side">
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
											placeholder="Enter Manager Name" required ></input>

									</div>
									<div class="form-group">
										<label for="managerid">Manager Id:</label> <input type="text"
											class="form-control" id="managerid"
											value="{{project.manager.id}}"  disabled required></input>
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
								</div><%--
								{{project|json}}
								--%><div class="box-footer">
									<button class="btn btn-primary"
										ng-disabled="newprojectform.$invalid"
										ng-click="saveProject()">Save Project</button>
									<button class="btn btn-warning">Cancel</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
		</aside>
	</div>

	<asset:javascript src="admin/modifyproject.js" />
</body>
</html>