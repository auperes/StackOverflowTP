package stackoverflowtp

import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class SecureController {


    def index() {
        render 'Secure access only'
        //render (view: 'index.gsp')
    }
}
