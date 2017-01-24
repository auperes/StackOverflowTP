package mystackoverflow

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class InterventionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Intervention.list(params), model:[interventionCount: Intervention.count()]
    }

    def show(Intervention intervention) {
        respond intervention
    }

    def create() {
        respond new Intervention(params)
    }

    @Transactional
    def save(Intervention intervention) {
        if (intervention == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (intervention.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond intervention.errors, view:'create'
            return
        }

        intervention.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'intervention.label', default: 'Intervention'), intervention.id])
                redirect intervention
            }
            '*' { respond intervention, [status: CREATED] }
        }
    }

    def edit(Intervention intervention) {
        respond intervention
    }

    @Transactional
    def update(Intervention intervention) {
        if (intervention == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (intervention.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond intervention.errors, view:'edit'
            return
        }

        intervention.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'intervention.label', default: 'Intervention'), intervention.id])
                redirect intervention
            }
            '*'{ respond intervention, [status: OK] }
        }
    }

    @Transactional
    def delete(Intervention intervention) {

        if (intervention == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        intervention.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'intervention.label', default: 'Intervention'), intervention.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'intervention.label', default: 'Intervention'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
