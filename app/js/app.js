(function(){
var forensicsAPI = angular.module('forensicsAPI', ['ngRoute']);


forensicsAPI.config(["$routeProvider", function($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: "partials/welcome.html",
        controller: "DirectionsCtrl"
      })
      .when('/find_directions', {
        templateUrl: "partials/directions.html",
        controller: "DirectionsCtrl"
      })
      .when('/search', {
         templateUrl : 'partials/result.html',
         controller  : 'DirectionsCtrl'
       })
      .otherwise({ redirectTo:'/' });
}]);

forensicsAPI.factory('factoryRefrence', ['$http', '$q',
    function($http, $q) {
        return {
            getDirections: function(email) {
                var deferred = $q.defer();
                $http.get('/find_directions?email=' + email)
                    .success(function(response) {
                        deferred.resolve(response);
                    });
                return deferred.promise;
            },
            getResults: function(element) {
                var deferred = $q.defer();
                $http.get('/search')
                    .success(function(response) {
                        deferred.resolve(response);
                    });
                return deferred.promise;
            }
        }
    }
]);

forensicsAPI.controller("DirectionsCtrl", ['$scope', '$http', 'factoryRefrence',
    function($scope, $http, factoryRefrence) {
    	$scope.email = "info@gmail.com";

        factoryRefrence.getDirections($scope.email).then(function(response) {
            $scope.directions = response;
        });

        factoryRefrence.getResults().then(function(response) {
            $scope.result = response["message"].match( /[^\.]+/g )[0];
        });
    }

]);
})();