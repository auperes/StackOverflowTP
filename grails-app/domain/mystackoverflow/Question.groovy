package mystackoverflow

class Question extends Intervention
{
    int views
    String titleQuestion

    //Many-To-Many relation, One-To-Many relation
    static hasMany = [ tags: Tag, answer: Answer ]

    static constraints = {
        views min: 0
        titleQuestion nullable: false, blank: false, maxSize: 200
    }
}
