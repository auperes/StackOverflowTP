package mystackoverflow


import grails.rest.*

@Resource(readOnly = false, formats = ['json', 'xml'])
class Comment
{
	String textComment
	static belongsTo = [ user: User, intervention: Intervention ]		//One-To-Many relation

	static constraints =
	{
		textComment nullable: false, blank: false, maxSize: 1000
	}

}