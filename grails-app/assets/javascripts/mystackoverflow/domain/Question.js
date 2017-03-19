//= wrapped

angular
    .module("mystackoverflow")
    .factory("Question", Question);

function Question($resource) {
    var Question = $resource(
        "api/questions/:id",
        {"id": "@id"},
        {"update": {method: "PUT"}, "list": {method: "GET", isArray: true}}
    );
    return Question;
}




