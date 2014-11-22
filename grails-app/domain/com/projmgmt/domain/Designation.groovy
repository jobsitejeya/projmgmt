package com.projmgmt.domain

import grails.rest.Resource;

@Resource(uri='/api/designation', formats=['json','xml'])

class Designation {
	
	String designation
	String description
	
	

    static constraints = {
		designation(nullable:false)
		description(nullable:true)
		
    }
}
