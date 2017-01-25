package mystackoverflow

class User_temp
{
	int nbVotes = 0
	Role_temp role
	String username
	String password
	Date creation = new Date()
	static hasMany = [ answers: Answer, questions: Question, comments: Comment ]	//One-To-Many relation, badges: Many-To-Many relation

	static constraints =
	{
		password nullable: false, blank: false, size: 5..20
		username nullable: false, blank: false, unique: true, size: 5..15, matches:/[a-zA-Z0-9]+/
	}

	User_temp(String user, String pwd)
	{
		username = user
		password = pwd
		role = Role_temp.findByAuthority("ROLE_USER")
	}

	String toString()
	{
		return username;
	}
}
