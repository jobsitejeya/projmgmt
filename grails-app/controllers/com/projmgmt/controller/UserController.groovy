package com.projmgmt.controller

import com.projmgmt.domain.Project;

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class UserController {

    def search(){
        log.info "Search index called..."

        render(view:'search')
    }

    def newrequest(){
        log.info "New project index called"

        render(view:'newrequest')
    }
	
	
	def getProjectNames(){
		log.info("Project Names called.....")
		def projectName = params['projectname']
		log.info("Project Names called.  $projectName")
		def projects = Project.findAllByProjectnameIlike(projectName+"%")
		
		def returnamap = [projects:projects]
		
		render(contentType:'application/json'){
			returnamap
		}
	}

    def mapresource(){

        log.info "Map resource called...."

    }

    def reports(){
        log.info "Reports called..."
    }

    def history(){
        log.info "history called...."
    }
}
