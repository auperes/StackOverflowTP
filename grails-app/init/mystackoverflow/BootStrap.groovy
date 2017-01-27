package mystackoverflow

class BootStrap {

	def init = { servletContext ->
		User user = new User(lastname: 'Pinson', firstname: 'Corentin', username: 'corentin', password: 'password').save()
		User admin = new User(lastname: 'Peres', firstname: 'Aurélie', username: 'aurelie', password: 'password', role: Role.ADMIN).save()

		println Role.findAll()
		println User.findAll()
	}

	def destroy = {
		
	}
}
