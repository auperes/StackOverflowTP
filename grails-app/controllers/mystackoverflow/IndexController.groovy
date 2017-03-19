package mystackoverflow

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class IndexController {
    def index() {
    	render(view: "/index", model: [signup_activated: Feature.isActivated('SignUp'), logged: isLoggedIn()])
    }
}
