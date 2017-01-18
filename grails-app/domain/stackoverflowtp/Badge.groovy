package stackoverflowtp

//Instances implemented in the application (not created by an user), cf BootStrap.groovy
//A badge rewards an user for an action
class Badge {

    String name
    String description
    //Many-To-Many relation
    static belongsTo = User
    static hasMany = [users: User]

    static constraints = {
        name nullable: false, blank: false, maxSize:30
        description nullable: false, blank: false, maxSize: 100
    }

}
