package mystackoverflow

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Answer)
class AnswerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "CreateAnswer"() {
        def answer = new Answer()
        expect:
            answer != null
    }

    void "AnswerBelongsToQuestion"() {
        def answer = new Answer()
        def q = new Question(title: "title")
        answer.question = q

        expect:
            answer.question == q
    }
}
