package mystackoverflow

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Question)
class QuestionSpec extends Specification {

    def setup() {

    }

    def cleanup() {
    }

    void "testTitle"() {
        def question = new Question(title: "I have a question")

        expect:
            question.title == "I have a question"
    }

    void "QuestionHasOneAnwser"() {
        def a = new Answer()
        def question = new Question(title: "I have a question", answer: a)

        expect:
            question.getAnswer().contains(a) == true
    }

    void "QuestionHasAnswers"() {
        def question = new Question(title: "title", answer: new Answer())
        question.answer.add(new Answer())

        expect:
            question.getAnswer().size() == 2
    }
}
