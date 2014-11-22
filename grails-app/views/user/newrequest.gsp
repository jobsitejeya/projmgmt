<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <meta name="layout" content="main"/>
    <title>New request - Project Resource Management</title>
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
    <a href="index.html" class="logo">Project Management</a>
    <nav class="navbar navbar-static-top" role="navigation"></nav>
</header>

<div class="wrapper row-offcanvas row-offcanvas-left" ng-app="NewRequestApp" ng-controller="NewRequestCtrl">
    <g:render template="menu"></g:render>
    <aside class="right-side">
        <section class="content-header">
            <h1>New Request</h1>
            <small>Search and Delete</small>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-8">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">New Request Form</h3>
                        </div>

                        <form role="form" name="newrequestform">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="projectname">Project Name:</label><small>(required)</small>
                                    <input type="text" class="form-control"
                                           ng-model="request.project" id="projectname"
                                           typeahead=" project as project.projectname  for project in getProjects($viewValue)"
                                           typeahead-loading="loadingprojects"
                                           placeholder="Enter project name" required></input>

                                </div>

                                <div class="form-group">
                                    <label for="requestdate">Resource Request:</label><small>(required)</small>
                                    <input type="text" class="form-control"
                                           id="requestdate"
                                           required disabled value="{{request.requestdate| date:'dd-MM-yyyy'}}"></input>
                                </div>

                                <div class="form-group">
                                    <label for="effectivedate">Effective Start Date:</label><small>(required)</small>

                                    <p class="input-group">
                                        <input type="text" class="form-control" datepicker-popup="{{format}}"
                                               ng-model="request.effectivedate" is-open="opened"
                                               max-date="'2015-06-22'" datepicker-options="dateOptions"
                                               ng-required="true"
                                               date-disabled="disabled(date, mode)"
                                               format-month="yyyy"
                                               close-text="Close"/>
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default" ng-click="open($event)"><i
                                                    class="glyphicon glyphicon-calendar"></i></button>
                                        </span>
                                    </p>
                                </div>

                                <div class="form-group">
                                    <label for="soid">SO ID:</label><small>(required)</small>
                                    <input type="text" class="form-control"
                                           ng-model="request.soid" id="soid"
                                           required></input>
                                </div>

                                <div class="form-group">
                                    <label for="billingeffectivedate">Billing Effective Date:</label><small>(required)</small>
                                    <input type="text" class="form-control"
                                           ng-model="request.billingeffectivedate" id="billingeffectivedate"
                                           required></input>
                                </div>

                                <div class="form-group">
                                    <label for="noofresource">No. of Resource required:</label><small>(required)</small>
                                    <input type="text" class="form-control"
                                           ng-model="request.noofresource" id="noofresource"
                                           required></input>
                                </div>

                                <div class="box-header">
                                    <h3 class="box-title">Designation/Competency/Location</h3>

                                </div>

                                <div class="form-group">
                                    <label for="designation">Designation required:</label><small>(required)</small>
                                    <input type="text" class="form-control"
                                           ng-model="request.designation" id="noofresource"
                                           required></input>
                                </div>

                                <div class="form-group">
                                    <label for="competency">Competency required:</label><small>(required)</small>
                                    <input type="text" class="form-control"
                                           ng-model="request.competency" id="competency"
                                           required></input>
                                </div>

                                <div class="form-group">
                                    <label for="location">Location required:</label><small>(required)</small>
                                    <input type="text" class="form-control"
                                           ng-model="request.location" id="location"
                                           required></input>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </aside>
</div>
<asset:javascript src="user/newrequest.js"/>
</body>
</html>