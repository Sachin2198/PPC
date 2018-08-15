/**
 * 
 */
var helloAjaxApp = angular.module("myApp", []);

helloAjaxApp
		.controller(
				"myCt",
				[
						'$scope',
						'$http',
						function($scope, $http) {

							$http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded; charset=utf-8";
						

							$scope.checkSd = function(startDate) {
							    $scope.sdMsg = '';
							    $scope.p1=0;
							    $scope.p2=0;
							   
							    var curDate = new Date();
							    if(new Date(startDate) < curDate){
								       $scope.sdMsg = 'Start date should not be before today.';
								       $scope.disableBtn=true;
								       $scope.p1=1;
						
							    }
							    
							    else{
							    	 $scope.sdMsg = '';
							    	 if($scope.p2 != 1 ){
							    		 $scope.disableBtn=false;
							    		 $scope.p1=0;
							    	 }
							    }
							};
						
							$scope.checkEd = function(startDate,endDate) {
							    $scope.edMsg = '';
							    
							    if(new Date(startDate) > new Date(endDate)){
								      $scope.edMsg = 'End Date should be greater than start date';
								      $scope.disableBtn=true;
								      $scope.p2=1;
								    }
							    
							    else{
							    	 $scope.edMsg = '';
							    	 if($scope.p1 != 1  ){
							    		 $scope.disableBtn=false;
							    		 $scope.p2=0;
							    	 }
							    	}
							};
							    
						
						}]);