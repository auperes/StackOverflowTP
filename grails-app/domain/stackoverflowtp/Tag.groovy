package stackoverflowtp

// Keyword for a question
class Tag {

    String description
    //Many-To-Many relation
    static hasMany = [questions: Question]
    static belongsTo = Question

    static constraints = {
        description nullable: false, blank: false, maxSize: 1000
    }
}
