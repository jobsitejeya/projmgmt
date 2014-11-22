package com.projmgmt

import com.projmgmt.security.User;

import grails.plugin.springsecurity.annotation.Secured;

class SecureController {
	
	def springSecurityService

	@Secured(['ROLE_ADMIN'])
    def index() { 
		println User.get(springSecurityService.principal.id).username
		render "secure code only"
	}
}
