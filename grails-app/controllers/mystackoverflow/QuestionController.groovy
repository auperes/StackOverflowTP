package mystackoverflow

import grails.plugin.springsecurity.annotation.Secured
import grails.rest.*
import grails.converters.*

@Secured('permitAll')
class QuestionController extends RestfulController {
    static responseFormats = ['json', 'xml']
    QuestionController() {
        super(Question)
    }

    def pending()
    {
        //respond Question.findAllByDone(false), view: 'index'
    }
}
