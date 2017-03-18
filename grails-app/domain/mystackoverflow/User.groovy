package mystackoverflow


import grails.rest.*

@Resource(readOnly = false, formats = ['json', 'xml'])
class User
{
	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints =
	{
		password blank: false, password: true
		username blank: false, unique: true
	}
}