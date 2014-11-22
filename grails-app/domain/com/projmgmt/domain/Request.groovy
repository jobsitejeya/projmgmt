package com.projmgmt.domain

class Request {

    Date requestdate
    Project project
    Date effectivestartdate
    String soid
    Designation designation
    Long noofresource

    Competency competency
    static hasMany = [locations:Location, skillsets:SkillSet]



    static constraints = {
    }
}
