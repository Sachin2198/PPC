$(document).ready(function() {
	$("#reset").click(function() {
	});
});

var helloAjaxApp = angular.module("myApp", []);

helloAjaxApp
		.controller(
				"myCtrl",
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

							$scope.addAdmin = function() {
								$scope.alert = 'warning';
								$scope.message = 'Please wait...';
								$scope.reason = '';
								$http({
									url : 'AddAdmin',
									method : "POST",
									data : {
										'id' : $scope.id,
										'name' : $scope.name
									}
								}).then(function(response) {
									console.log(response.data);
									$scope.alert = response.data.alert;
									$scope.message = response.data.message;
									$scope.reason = response.data.reason;
								}, function(response) {
									console.log(response);
									$scope.alert = "danger";
									$scope.message = 'Failed!';
									$scope.reason = 'Server error';
								});
							};

							$scope.addFaculty = function() {
								$scope.alert = 'warning';
								$scope.message = 'Please wait...';
								$scope.reason = '';
								$http({
									url : 'AddFaculty',
									method : "POST",
									data : {
										'id' : $scope.id,
										'name' : $scope.name,
										'code' : $scope.code
									}
								}).then(function(response) {
									console.log(response.data);
									$scope.alert = response.data.alert;
									$scope.message = response.data.message;
									$scope.reason = response.data.reason;
								}, function(response) {
									console.log(response);
									$scope.alert = "danger";
									$scope.message = 'Failed!';
									$scope.reason = 'Server error';
								});
							};

							$scope.addStudent = function() {
								$scope.alert = 'warning';
								$scope.message = 'Please wait...';
								$scope.reason = '';
								$http({
									url : 'AddStudent',
									method : "POST",
									data : {
										'id' : $scope.id,
										'name' : $scope.name,
										'branch' : $scope.branch,
										'section' : $scope.section
									}
								}).then(function(response) {
									console.log(response.data);
									$scope.alert = response.data.alert;
									$scope.message = response.data.message;
									$scope.reason = response.data.reason;
								}, function(response) {
									console.log(response);
									$scope.alert = "danger";
									$scope.message = 'Failed!';
									$scope.reason = 'Server error';
								});
							};

							$scope.addSubject = function() {
								$scope.alert = 'warning';
								$scope.message = 'Please wait...';
								$scope.reason = '';
								$http({
									url : 'AddSubject',
									method : "POST",
									data : {
										'code' : $scope.code,
										'name' : $scope.name
									}
								}).then(function(response) {
									console.log(response.data);
									$scope.alert = response.data.alert;
									$scope.message = response.data.message;
									$scope.reason = response.data.reason;
								}, function(response) {
									console.log(response);
									$scope.alert = "danger";
									$scope.message = 'Failed!';
									$scope.reason = 'Server error';
								});
							};

						} ]);