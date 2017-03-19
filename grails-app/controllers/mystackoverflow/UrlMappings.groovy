package mystackoverflow

class UrlMappings {

    static mappings = {

        "/api/questions"(resources:"question")

        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "500"(view: '/error')
        "404"(view: '/notFound')
        "/login"(view: '/user/login')
        "/"(controller: "index", view:"/index")
    }
}
