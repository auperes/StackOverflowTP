package mystackoverflow

import grails.test.mixin.*
import spock.lang.*

@TestFor(User_tempController)
@Mock(User_temp)
class User_tempControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'

        params["nbVOtes"] = 0
        params["role"] = new Role_temp(authority: "ROLE_TEST")
        params["username"] = "userTest"
        params["password"] = "passTest"
        params["creation"] = new Date()
        params["answers"] = new Answer(text: "text", creationDate: new Date(), user: this, question: new Question(text: "text", creationDate: new Date(), user: this, view: 0, title: "theTitle"))
        params["questions"] = new Question(text: "text", creationDate: new Date(), user: this, view: 0, title: "theTitle")

        //assert false, "TODO: Provide a populateValidParams() implementation for this generated test suite"
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.user_tempList
            model.user_tempCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.user_temp!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def user_temp = new User_temp()
            user_temp.validate()
            controller.save(user_temp)

        then:"The create view is rendered again with the correct model"
            model.user_temp!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            user_temp = new User_temp(params)

            controller.save(user_temp)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/user_temp/show/1'
            controller.flash.message != null
            User_temp.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def user_temp = new User_temp(params)
            controller.show(user_temp)

        then:"A model is populated containing the domain instance"
            model.user_temp == user_temp
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def user_temp = new User_temp(params)
            controller.edit(user_temp)

        then:"A model is populated containing the domain instance"
            model.user_temp == user_temp
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/user_temp/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def user_temp = new User_temp()
            user_temp.validate()
            controller.update(user_temp)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.user_temp == user_temp

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            user_temp = new User_temp(params).save(flush: true)
            controller.update(user_temp)

        then:"A redirect is issued to the show action"
            user_temp != null
            response.redirectedUrl == "/user_temp/show/$user_temp.id"
            flash.message != null
    }

    /*void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/user_temp/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def user_temp = new User_temp(params).save(flush: true)

        then:"It exists"
            User_temp.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(user_temp)

        then:"The instance is deleted"
            User_temp.count() == 0
            response.redirectedUrl == '/user_temp/index'
            flash.message != null
    }*/
}
