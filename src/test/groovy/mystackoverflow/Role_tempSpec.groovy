package mystackoverflow

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Role_temp)
class Role_tempSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "ConstructRole"() {
        def role = new Role_temp(authority: "ROLE_TEMP")

        expect:
            role.getAuthority() == "ROLE_TEMP"
    }
}
