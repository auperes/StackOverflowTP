package mystackoverflow

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class User_tempController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond User_temp.list(params), model:[user_tempCount: User_temp.count()]
	}

	def login()
	{
		if (params.username != null)
		{
			def user = User_temp.findByUsername(params.username)

			if (user != null)
			{
				if (user.password == params.password)
				{
					session.user = user
					redirect(uri:'/')
				}
			}
		}
		[login: false, message: 'Login ou mot de passe incorrect']
	}

	def logout()
	{
		session.user = null
		redirect(uri:'/')
	}

	def show(User_temp user_temp) {
		respond user_temp
	}

	def show_questions(User_temp user_temp)
	{
		respond user_temp
	}

	def create()
	{
        //respond new User_temp(params)
		def user_temp = new User_temp(username: params.username, password: params.password)
		respond user_temp
	}

	@Transactional
	def save()//User_temp user_temp)
	{
		def user_temp = new User_temp(username: params.username, password: params.password, role: Role_temp.findByAuthority("ROLE_USER"))

		if (user_temp == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user_temp.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user_temp.errors, view:'create'
            return
        }

        user_temp.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'role_temp.label', default: 'User_temp'), user_temp.id])
                redirect user_temp
            }
            '*' { respond user_temp, [status: CREATED] }
        }
	}

	def edit(User_temp user_temp) {
		respond user_temp
	}

	@Transactional
	def update(User_temp user_temp) {
		if (user_temp == null) {
			transactionStatus.setRollbackOnly()
			notFound()
			return
		}

		if (user_temp.hasErrors()) {
			transactionStatus.setRollbackOnly()
			respond user_temp.errors, view:'edit'
			return
		}

		user_temp.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [message(code: 'user_temp.label', default: 'User_temp'), user_temp.id])
				redirect user_temp
			}
			'*'{ respond user_temp, [status: OK] }
		}
	}

	@Transactional
	def delete(User_temp user_temp) {

		if (user_temp == null) {
			transactionStatus.setRollbackOnly()
			notFound()
			return
		}

		user_temp.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [message(code: 'user_temp.label', default: 'User_temp'), user_temp.id])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'user_temp.label', default: 'User_temp'), params.id])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
