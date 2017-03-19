package mystackoverflow

class Answer extends Intervention {

    static belongsTo = [question: Question]

    static constraints = {
    }
}
