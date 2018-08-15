var helloAjaxApp = angular.module("myTable", []);

helloAjaxApp
		.controller(
				"tableCtrl",
				[
						'$scope',
						'$http',
						function($scope, $http) {

							$http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded; charset=utf-8";

							$scope.login = function() {
								$scope.alert = 'warning';
								$scope.message = 'Logging in...';
								$scope.reason = '';
								$http({
									url : 'Login',
									method : "POST",
									data : {
										'uname' : $scope.uname,
										'pwd' : $scope.pwd
									}
								}).then(function(response) {
									console.log(response.data);
									$scope.alert = response.data.alert;
									$scope.message = response.data.message;
								}, function(response) {
									console.log(response);
									$scope.alert = "danger";
									$scope.message = 'Failed!';
									$scope.reason = 'Server error';
								});
							};
						} ]);