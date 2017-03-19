package mystackoverflow

class UrlMappings {

    static mappings = {

        "/api/questions"(resources:"question")

        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view: '/index')
        "500"(view: '/error')
        "404"(view: '/notFound')

    }
}
