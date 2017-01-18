package stackoverflowtp

class Message extends Intervention {

    static belongsTo = [question: Question]

    static constraints = {
    }
}
