package mystackoverflow

import groovy.json.JsonSlurper

class BootStrap {

    def init = { servletContext ->

        Role admin = new Role("ROLE_ADMIN").save()
        User user = new User("user", "pass").save()
        UserRole.create(user, admin, true)

        5.times { new Question(title: "Question ${it+1}", views: 0, text: "Content of the question ${it+1}", user: user).save() }

		// Read the file config.json in grails-app/conf
		try
		{
			def resource = this.class.classLoader.getResource('config.json')
			def configsFile = new File(resource.file)

			// Set the configuration
			def configsArray = new JsonSlurper().parseText(configsFile.text)
			configsArray.each { key, value ->
			    Feature.setActivated(key, value)
			}
		}
		catch (Exception e)
		{
			println e
		}

		// Check the loaded values
		println 'SignUp: ' + Feature.isActivated('SignUp')
		println 'QuestionCreation: ' + Feature.isActivated('QuestionCreation')
		println 'AnswerCreation: ' + Feature.isActivated('AnswerCreation')
    }
    def destroy = {
    }
}
