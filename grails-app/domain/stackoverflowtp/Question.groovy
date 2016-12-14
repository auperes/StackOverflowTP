package stackoverflowtp

class Question  {

    User               name_
    Date               postDate_
    String             title_
    String             content_

    ArrayList<Message> answers_

    int                views_
    int                mark
    ArrayList<Tag>     tags_
    boolean            resolved_


    static constraints = {
    }
}
