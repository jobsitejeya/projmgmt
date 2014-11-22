package com.projmgmt.controller

import com.projmgmt.domain.*;


import grails.plugin.springsecurity.annotation.Secured;

class AdminController {

	@Secured(['ROLE_ADMIN'])
	def index() {
		render(view:'dashboard')
	}

	@Secured(['ROLE_ADMIN'])
	def dashboard() { }

	@Secured(['ROLE_ADMIN'])
	def newproject() {
		log.info("Entering new project...")
		// Get the list of Employees with manager designation
		[ esaid:UUID.randomUUID(), projecttypes:ProjectType.list()]
	}

	@Secured(['ROLE_ADMIN'])
	def getManagerNames() {

		def managerNamesStartsWith = params['managername']
		log.info("Manager name selected ${managerNamesStartsWith}")
		def managerList = Employee.findAllByDesignationAndFirstnameIlike(Designation.findByDesignation("MGR"), managerNamesStartsWith+'%')
		log.info(managerList)
		def returnMap = [mgrs:managerList]
		render(contentType:"application/json"){ returnMap }
	}
	@Secured(['ROLE_ADMIN'])
	def saveNewProject() {

		def returnMap = [:]

		log.info "Save new project called...."

		def requestJsonData = request.JSON.project

		log.info("JSON Request ${requestJsonData}")

		def projectTypeSelected = ProjectType.findByType(requestJsonData.projecttype)
		log.info("Project type selected : ${projectTypeSelected}")
		if(requestJsonData.manager.id){
			def manager = Employee.get(requestJsonData.manager.id)
			Project newProject = new Project(projectname:requestJsonData.projectname,
			esaprojectid: requestJsonData.esaid,
			type:projectTypeSelected, manager:manager)

			def savedProject = newProject.save(flush:true);


			newProject.errors.each { log.info it }

			log.info("Project saved ... ${newProject}")

			returnMap = [success:true, msg:"Project saved successfully with id:${newProject.id}", project:newProject]

			render(view:'dashboard', model:[returnMap:returnMap])
		}
		else{
			returnMap = [success:false, msg:'Please select a valid manager name']
		}

		render(contentType:'application/json'){ returnMap }
	}
	@Secured(['ROLE_ADMIN'])
	def modifyproject() {
		def id = params['id']

		log.info " The id selected is ${id}"
		// look up the project and send it in model
		def returnMap = [:]
		if(id){
			def projectSelected = Project.get(id);

			returnMap = [id:projectSelected.id, projectname:projectSelected.projectname,
				esaid:projectSelected.esaprojectid, firstname:projectSelected.manager.lastname ,lastname:projectSelected.manager.firstname,
				managerid:projectSelected.manager.id, projecttypeselected:projectSelected.type.type,  projecttypes:ProjectType.list()]

			log.info(returnMap)

			returnMap
		}


	}

	@Secured(['ROLE_ADMIN'])
	def saveEditedProject(){

		def project = request.JSON.project
		log.info(project)
		def selectedProject = Project.get(project.id);
		log.info("project ${selectedProject}")

		def projectTypeSelected = ProjectType.findByType(project.projecttype)

		def manager = Employee.get(project.manager.id)

		selectedProject.manager = manager
		selectedProject.type = projectTypeSelected
		selectedProject.esaprojectid = project.esaid
		selectedProject.projectname = project.projectname

		def savedProject = selectedProject.save(flush:true);


		selectedProject.errors.each { log.info it }


		def returnMap = [success:true, msg:"Project saved successfully with id:${selectedProject.id}", project:selectedProject]

		render(contentType:'application/json'){ returnMap }

	}

	@Secured(['ROLE_ADMIN'])
	def searchindex() {

	}

	@Secured(['ROLE_ADMIN'])
	def searchproject() {
		log.info " Search Project Called....."

		def projectId = params['esaid']
		def projectName = params['projectname']
		log.info(projectName);

		def projectList = []
		projectList = Project.withCriteria {
			if(projectId){
				like('esaprojectid','%'+projectId+"%")
			}
			if(projectName){
				log.info(projectName)
				like('projectname', '%'+projectName+"%")
			}
		}


		log.info(projectList)

		def listOfProjects = [];

		projectList.each{ Project prj ->
			def returnMap = ['id':prj.id, 
				'esaid':prj.esaprojectid, 
				'projectname':prj.projectname, 
				"projectmanager":prj.manager.lastname+", " +prj.manager.firstname ]
			listOfProjects << returnMap
		}

		render(contentType:"application/json"){ listOfProjects }
	}


	@Secured(['ROLE_ADMIN'])
	def deleteproject() {
		log.info "Delete Project...."

		def projectId = params['id']

		log.info " Project Id $projectId "

		def projectToBeDeleted = Project.get(projectId);

		projectToBeDeleted.delete(flush:true);

		def returnmap = [success:true, msg:"Project ${projectId} deleted successfully"]

		render(contentType:"application/json"){ returnmap }

	}

	@Secured(['ROLE_ADMIN'])
	def resourcereleaseplan() { }

	@Secured(['ROLE_ADMIN'])
	def reports() { }

	@Secured(['ROLE_ADMIN'])
	def currentutilization() { }
}
