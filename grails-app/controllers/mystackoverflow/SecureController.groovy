package mystackoverflow

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class SecureController {


    def index() {
        render "Secure access only"
    }
}
