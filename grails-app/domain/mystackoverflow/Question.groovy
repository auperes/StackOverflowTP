package mystackoverflow


import grails.rest.*

@Resource(readOnly = false, formats = ['json', 'xml'])
class Question extends Intervention
{
	int views = 0
	String title
	static hasMany = [ answers: Answer ] // One-To-Many: answer

	static constraints = {
		views min: 0
		title nullable: false, blank: false, maxSize: 200
	}

	String toString()
	{
		return title;
	}
}