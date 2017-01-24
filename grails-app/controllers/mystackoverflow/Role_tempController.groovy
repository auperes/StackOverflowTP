package mystackoverflow

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class Role_tempController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Role_temp.list(params), model:[role_tempCount: Role_temp.count()]
    }

    def show(Role_temp role_temp) {
        respond role_temp
    }

    def create() {
        respond new Role_temp(params)
    }

    @Transactional
    def save(Role_temp role_temp) {
        if (role_temp == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (role_temp.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond role_temp.errors, view:'create'
            return
        }

        role_temp.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'role_temp.label', default: 'Role_temp'), role_temp.id])
                redirect role_temp
            }
            '*' { respond role_temp, [status: CREATED] }
        }
    }

    def edit(Role_temp role_temp) {
        respond role_temp
    }

    @Transactional
    def update(Role_temp role_temp) {
        if (role_temp == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (role_temp.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond role_temp.errors, view:'edit'
            return
        }

        role_temp.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'role_temp.label', default: 'Role_temp'), role_temp.id])
                redirect role_temp
            }
            '*'{ respond role_temp, [status: OK] }
        }
    }

    @Transactional
    def delete(Role_temp role_temp) {

        if (role_temp == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        role_temp.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'role_temp.label', default: 'Role_temp'), role_temp.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'role_temp.label', default: 'Role_temp'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
