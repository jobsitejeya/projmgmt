package com.projmgmt.domain

import grails.rest.Resource;


@Resource(uri="/api/project", formats=['json', 'xml'])
class Project {

	String projectname
	Date projectdate  = new Date()
	String esaprojectid

	ProjectType type
	
	Employee manager

	static constraints = {
		projectname(nullable:false)
		projectdate(nullable:true)
		manager(nullable:false)
		esaprojectid(nullable:false)
		projectdate(nullable:true)
	}
}
