package com.projmgmt.domain

import grails.rest.Resource;

@Resource(uri='/api/employee', formats=['json', 'xml'])
class Employee {
	
	String firstname
	String lastname
	
	Designation designation
	
	
    static constraints = {
		firstname(blank:false)
		lastname(nullable:true)
		designation(nullable:false)
    }
}
