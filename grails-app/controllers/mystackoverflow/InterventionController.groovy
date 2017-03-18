package mystackoverflow


import grails.rest.*
import grails.converters.*

class InterventionController extends RestfulController {
    static responseFormats = ['json', 'xml']
    InterventionController() {
        super(Intervention)
    }
}
