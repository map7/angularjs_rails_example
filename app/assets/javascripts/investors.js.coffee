$ (event) ->
  app = angular.module "investor", []

  app.controller("InvestorCtrl", ["$scope", ($scope) ->
    $scope.total_cost = 0
  ])

  angular.bootstrap document, ['investor']
