package stackoverflowtp

class Question extends Intervention {

    int views
    String titleQuestion

    //Many-To-Many relation, One-To-Many relation
    static hasMany = [tags: Tag, message: Message]


    static constraints = {
        views min: 0
        titleQuestion nullable: false, blank: false, maxSize: 200
    }
}
