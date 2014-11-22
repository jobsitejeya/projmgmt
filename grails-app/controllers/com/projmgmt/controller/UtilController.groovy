package com.projmgmt.controller

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class UtilController {

    def location = ['Pune', 'Chennai', 'Bangalore', 'Hyderabad', 'Coimbatore']

    def competency = ['Accessibility Testing', 'Agile Development Testing', 'Automation Testing',
                      'Browser Compatibility Testing', 'Claims Payment', 'Planning' ]

    def locations() {

        render(contentType: 'application\json') {
            [locations: location]
        }
    }


}
