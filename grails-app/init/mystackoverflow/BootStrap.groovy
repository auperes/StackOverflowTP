package mystackoverflow

class BootStrap
{
	def init = { servletContext ->
		// Creation des roles
		def adminRole = new Role_temp(authority: 'ROLE_ADMIN').save()
		def userRole = new Role_temp(authority: 'ROLE_USER').save()

		// Creation des utilisateurs
		def admin = new User_temp(username: 'aurelie', password: 'password', role: adminRole).save()
		def user = new User_temp(username: 'corentin', password: 'password', role: userRole).save()
	}

	def destroy = {
	}
}
