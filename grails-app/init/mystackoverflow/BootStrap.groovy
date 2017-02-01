package mystackoverflow

class BootStrap {

	def init = { servletContext ->
		//User user = new User(lastname: 'Pinson', firstname: 'Corentin', username: 'corentin', password: 'password').save()
		//User admin = new User(lastname: 'Peres', firstname: 'Aurélie', username: 'aurelie', password: 'password', role: Role.ADMIN).save()

		//Question question1 = new Question(title: 'Comment protéger les lapons de laponie?', text: 'J\'avais besoin d\'une question et rien d\'autre ne m\'est venu à l\'esprit.', user: admin).save()
		//Question question2 = new Question(title: 'Combien de bras ont les manchots d\'antarctique?', text: 'Parce qu\'il me fallait une autre question.', user: user).save()

		//println Role.findAll()
		//println User.findAll()
		//println Question.findAll()

		// spring security
		def adminRole = new Role(authority: 'ROLE_ADMIN').save()
		def userRole = new Role(authority: 'ROLE_USER').save()

		def testUser = new User(username: 'me', password: 'password').save()

		UserRole.create testUser, adminRole

		UserRole.withSession {
			it.flush()
			it.clear()
		}

		assert User.count() == 1
		assert Role.count() == 2
		assert UserRole.count() == 1
	}

	def destroy = {
		
	}
}
