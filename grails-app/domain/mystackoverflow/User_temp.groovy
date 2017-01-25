package mystackoverflow

class User_temp
{
	int nbVotes = 0
	String username
	String password
	Date creation = new Date()
	Role_temp role// = Role_temp.findByAuthority("ROLE_USER")
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
