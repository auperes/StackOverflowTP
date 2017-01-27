package mystackoverflow

class User
{
	String lastname
	String firstname
	String username
	String password
	Role role = Role.USER
	Date registration = new Date()
	static hasMany = [ answers: Answer, questions: Question, comments: Comment ]	//One-To-Many relation, badges: Many-To-Many relation

	static constraints =
	{
		password nullable: false, blank: false, size: 5..20
		username nullable: false, blank: false, unique: true, size: 5..15, matches:/[a-zA-Z0-9]+/
	}

	String toString()
	{
		return username;
	}
}
