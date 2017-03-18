package mystackoverflow


import grails.rest.*

@Resource(readOnly = false, formats = ['json', 'xml'])
class Intervention
{
	String text
	Date creationDate = new Date()
	static belongsTo = [ user: User ] // One-To-Many
	static hasMany = [ comments: Comment ] // One-To-Many relation

	static constraints =
	{
		text nullable: false, blank: false, maxSize: 1000
	}
}