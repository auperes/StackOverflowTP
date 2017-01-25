package mystackoverflow

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(User_temp)
@Mock(User_temp)
class User_tempSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "ConstructUser"() {
        //mockForConstraintsTests(User_temp)
        def user = new User_temp()

        expect:
            user.getUsername() == null
    }
}
