package com.projmgmt.domain

import grails.rest.Resource;

@Resource(uri="/api/projecType",formats=['json','xml'])
class ProjectType {
	
	String type
	String description

    static constraints = {
		type(nullable:false)
		description(nullable:true)
    }
}
