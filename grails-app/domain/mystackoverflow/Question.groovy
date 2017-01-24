package mystackoverflow

class Question extends Intervention
{
    int views
    String title
    static hasMany = [ tags: Tag, answer: Answer ] // Many-To-Many: tag, One-To-Many: answer

    static constraints = {
        views min: 0
        title nullable: false, blank: false, maxSize: 200
    }
}
