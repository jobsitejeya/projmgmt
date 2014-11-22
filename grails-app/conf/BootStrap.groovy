import com.projmgmt.domain.Designation;
import com.projmgmt.domain.Employee;
import com.projmgmt.domain.ProjectType;
import com.projmgmt.security.Role
import com.projmgmt.security.User
import com.projmgmt.security.UserRole

class BootStrap {

    def init = { servletContext ->
		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
  
		def testUser = new User(username: 'user', password: 'o')
		testUser.save(flush: true)
  
		UserRole.create testUser, userRole, true
		
		def testAdmin = new User(username:'admin', password:'o')
		testAdmin.save(flush:true)
		UserRole.create testAdmin, adminRole, true
  
//		assert User.count() == 2
//		assert Role.count() == 2
//		assert UserRole.count() == 2

        println "User count ${User.count()}"
		
		Designation mgrDesignation = new Designation(designation:"MGR", description:'Manager')
		
		if(! Designation.findByDesignation('MGR')){
			println "Creating new mgr designation"
			mgrDesignation.save(flush:true)
            println "After creating new mgr"
            mgrDesignation.errors.each{
                println it
            }
		}
		
		Designation employeeDesignation = new Designation(designation:'ASSOCIATE', description:"Associate Employee")
		
		if(! Designation.findByDesignation("ASSOCIATE")){
			println "Creating new assocaite designation"
			employeeDesignation.save(flush:true)
            println "after creating new associates"
            employeeDesignation.errors.each{
                println it
            }
		}
		
		//assert Designation.count() == 3

        println "Designation ${Designation.count()}"
		
		Employee johnMgr = new Employee(firstname: "John", lastname: "Doe" )
		
		if(! Employee.findByFirstnameAndLastname("John", "Doe")){
			println "Creating john doe as manager"
			johnMgr.designation = Designation.findByDesignation("MGR")
			johnMgr.save(flush:true)
		}
		
		
		Employee jackMgr = new Employee(firstname: "Jack", lastname: "Fuller")
		
		if(! Employee.findByFirstnameAndLastname("Jack", "Fuller")){
			println "Creating jack fuller as manager"
			jackMgr.designation = Designation.findByDesignation("MGR")
			jackMgr.save(flush:true)
		}
		
		
//		assert Employee.count() == 2

        println "Employee count ${Employee.count()}"


        Designation adminDesignation = new Designation(designation: 'ADMIN', description: "Employee with Admin role will have admin designation");

        if(! Designation.findByDesignation("ADMIN")){
            println "Creating new ADMIN designation"
            adminDesignation.save(flush:true)
            println "after creating new ADMIN"
            adminDesignation.errors.each{
                println it
            }
        }




        Employee adminEmployeeOne = new Employee(firstname: 'Harry', lastname: 'Potter');
        adminEmployeeOne.designation = adminDesignation

        if(! Employee.findByFirstnameAndLastname("Harry", "Potter")){
            println "Creating harry potter  as Admin"
            adminEmployeeOne.designation = Designation.findByDesignation("ADMIN")
            adminEmployeeOne.save(flush:true)
        }


        testAdmin.employee = adminEmployeeOne
        testAdmin.save()

        testAdmin.errors.each{
            println it
        }
		// Creat project types
		
		ProjectType fixedBid = new ProjectType()
		
		fixedBid.type ="FIXBID"
		fixedBid.description = "Fixed Bid"
		
		if(!ProjectType.findByType('FIXBID')){
			println "project type fixed bid being created..."
			fixedBid.save(flush:true)
		}
		
//		assert ProjectType.count() ==1

        println "Project type ${ProjectType.count()}"
    }
    def destroy = {
    }
}
