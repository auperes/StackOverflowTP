package mystackoverflow

class Comment
{
	String textComment
	static belongsTo = [ user: User_temp, intervention: Intervention ]		//One-To-Many relation

	static constraints =
	{
		textComment nullable: false, blank: false, maxSize: 1000
	}
}
