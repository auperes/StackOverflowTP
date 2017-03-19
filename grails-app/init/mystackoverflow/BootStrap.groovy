package mystackoverflow

class BootStrap {

    def init = { servletContext ->

        Role admin = new Role("ROLE_ADMIN").save()
        User user = new User("user", "pass").save()
        UserRole.create(user, admin, true)

        5.times { new Question(title: "Question ${it+1}", views: 0, text: "Content of the question ${it+1}", user: user).save() }

    }
    def destroy = {
    }
}
