package mystackoverflow


import grails.rest.*
import grails.converters.*

class CommentController extends RestfulController {
    static responseFormats = ['json', 'xml']
    CommentController() {
        super(Comment)
    }
}
