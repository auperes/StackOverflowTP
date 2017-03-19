//= wrapped

angular
    .module("mystackoverflow")
    .factory('authInterceptor', function ($rootScope, $window) {
        return {
            request: function (config) {
                config.headers = config.headers || {};
                if ($window.sessionStorage.token) {
                    config.headers.Authorization = 'Bearer ' + $window.sessionStorage.token;
                }
                return config;
            }
        };
    })
    .config(function ($httpProvider) {
        $httpProvider.interceptors.push('authInterceptor');
    })
    .controller("QuestionController", QuestionController);

function QuestionController(Question, $http, $window) {
    var vm = this;

    vm.authenticated = false;
    vm.user = {};

    vm.questions = [];

    vm.newQuestion = new Question();

    vm.login = function () {
        $http.post('/api/login', {
            username: vm.user.username,
            password: vm.user.password
        }).then(function (response) {
            vm.authenticated = true;
            $window.sessionStorage.token = response.data.access_token;
            vm.questions = Question.list();
        });
    };

    vm.save = function() {
        vm.newQuestion.$save({}, function() {
            vm.questions.push(angular.copy(vm.newQuestion));
            vm.newQuestion = new Question();
        });
    };

    vm.delete = function(question) {
        question.$delete({}, function() {
            var idx = vm.questions.indexOf(question);
            vm.questions.splice(idx, 1);
        });
    };

    vm.update = function(question) {
        question.$update();
    };
}
