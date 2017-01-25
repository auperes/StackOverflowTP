package mystackoverflow

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Intervention)
class InterventionSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "ConstructIntervention"() {
        def interv = new Intervention(text: "content")

        expect:
            interv != null
    }

    void "InterventionBelongsToUser"()
    {
        def user = new User_temp(username: "myName", password: "myPassword", role: new Role_temp(authority: "USER_TEST"))
        def interv = new Intervention(text: "content", user: user)

        expect:
            interv.getUser() == user
    }

    void "InterventionHasVotes"()
    {
        def vote = new Vote()
        def interv = new Intervention(text: "content", votes: vote)
        interv.votes.add(new Vote())

        expect:
            interv.getVotes().size() == 2
            interv.getVotes().contains(vote)
    }

    void "InterventionHasComments"()
    {
        def comment1 = new Comment()
        def interv = new Intervention(text: "content", comments: comment1)
        interv.comments.add(new Comment())

        expect:
            interv.getComments().size() == 2
            interv.getComments().contains(comment1)
    }
}
