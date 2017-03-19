package mystackoverflow

class Comment {

    String textComment

    static belongsTo = [user: User, intervention: Intervention]

    static constraints = {
        textComment nullable: false, blank: false, maxSize: 1000
    }
}
