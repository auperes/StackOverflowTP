package mystackoverflow

class Question extends Intervention
{
	int views = 0
	String title
	static hasMany = [ /*tags: Tag,*/ answers: Answer ] // Many-To-Many: tag, One-To-Many: answer

	static constraints = {
		views min: 0
		title nullable: false, blank: false, maxSize: 200
	}

	String toString()
	{
		return title;
	}
}
