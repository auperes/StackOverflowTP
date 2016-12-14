package stackoverflowtp

class UserController {

    def scaffold = User

    def index() { }

    def createUser()
    {
        def user = new User()
        user.name_ = params.name
    }
}
