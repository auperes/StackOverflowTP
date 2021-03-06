package mystackoverflow

import grails.test.mixin.*
import spock.lang.*

@TestFor(InterventionController)
@Mock(Intervention)
class InterventionControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        def user_temp = new User_temp(username: "userTest", password: "password", role: new Role_temp(authority: "ROLE_TEST"))

        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
        params["text"] = 'interventionText'
        params["creationDate"] = new Date()
        params["user"] = user_temp
        params["votes"] = new Vote()
        params["comments"] = new Comment(textComment: "theTextComment", user: user_temp, intervention: this)

        //assert false, "TODO: Provide a populateValidParams() implementation for this generated test suite"
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.interventionList
            model.interventionCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.intervention!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def intervention = new Intervention()
            intervention.validate()
            controller.save(intervention)

        then:"The create view is rendered again with the correct model"
            model.intervention!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            intervention = new Intervention(params)

            controller.save(intervention)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/intervention/show/1'
            controller.flash.message != null
            Intervention.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def intervention = new Intervention(params)
            controller.show(intervention)

        then:"A model is populated containing the domain instance"
            model.intervention == intervention
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def intervention = new Intervention(params)
            controller.edit(intervention)

        then:"A model is populated containing the domain instance"
            model.intervention == intervention
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/intervention/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def intervention = new Intervention()
            intervention.validate()
            controller.update(intervention)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.intervention == intervention

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            intervention = new Intervention(params).save(flush: true)
            controller.update(intervention)

        then:"A redirect is issued to the show action"
            intervention != null
            response.redirectedUrl == "/intervention/show/$intervention.id"
            flash.message != null
    }

    /*void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/intervention/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def intervention = new Intervention(params).save(flush: true)

        then:"It exists"
            Intervention.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(intervention)

        then:"The instance is deleted"
            Intervention.count() == 0
            response.redirectedUrl == '/intervention/index'
            flash.message != null
    }*/
}
