package stackoverflowtp

//Speech for a question or an answer by an user
class Comment {

    String textComment
    //One-To-Many relation
    static belongsTo = [user: User, intervention: Intervention]

    static constraints = {
        textComment nullable: false, blank: false, maxSize: 1000
    }
}
