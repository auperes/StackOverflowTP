package mystackoverflow

class Intervention {

    String text
    Date creationDate = new Date()
    static belongsTo = [user: User]
    static hasMany = [comments: Comment]

    static constraints = {
        text nullable: false, blank: false, maxSize: 1000
    }
}
