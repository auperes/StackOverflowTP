package mystackoverflow


import grails.rest.*

//@Resource(readOnly = false, formats = ['json', 'xml'])
class Question extends Intervention {

    String title
    int views = 0

    static hasMany = [answers: Answer]

    static constraints = {
        views min: 0
        title nullable: false, blank: false, maxSize: 200
    }

}