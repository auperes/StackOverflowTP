package mystackoverflow


import grails.rest.*
import grails.converters.*

class AnswerController extends RestfulController {
    static responseFormats = ['json', 'xml']
    AnswerController() {
        super(Answer)
    }
}
