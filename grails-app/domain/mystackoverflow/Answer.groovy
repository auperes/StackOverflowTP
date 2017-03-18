package mystackoverflow


import grails.rest.*

@Resource(readOnly = false, formats = ['json', 'xml'])
class Answer
{
	static belongsTo = [ question: Question ]

	static constraints = {
	}
}