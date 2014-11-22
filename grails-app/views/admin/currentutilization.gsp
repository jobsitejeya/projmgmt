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

	<div class="wrapper row-offcanvas row-offcanvas-left">
		<g:render template="menu"></g:render>
		<aside class="right-side">
			<section class="content-header">
				<h1>Current Utilization</h1>
				<small>Upload utilization data</small>
			</section>
			<section class="content">
				<div class="row">
					<div class="col-md-8">
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">Current Utilization Template</h3>
							</div>
							<form name="templateform" role="form">
								<div class="box-body">
									<div class="form-group">
										<button class="btn btn-primary">Download</button>
									</div>
								</div>
							</form>
						</div>

						<div class="box box-success">
							<div class="box-header">
								<h3 class="box-title">Current Utilization Upload</h3>
							</div>
							<form name="templateform" role="form">
								<div class="box-body">
									<div class="form-group">
										<label for="exampleInputFile">Select file to upload</label> <input
											type="file" id="exampleInputFile">
										<p class="help-block">Please upload filled in template files.</p>
									</div>
								</div>
							</form>
						</div>

					</div>
				</div>
			</section>
		</aside>
	</div>

	<%--<asset:javascript src="admin/app.js" />
--%>
</body>
</html>