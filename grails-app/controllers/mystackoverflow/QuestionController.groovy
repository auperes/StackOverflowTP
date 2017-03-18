package mystackoverflow

import grails.rest.*
import grails.converters.*

class QuestionController extends RestfulController {
    static responseFormats = ['json', 'xml']
    QuestionController() {
        super(Question)
    }
    def pending() {
    	println 'a'
    	render questions: Question.findAllByViews(0), view: '/pending'
	}
}
