$ (event) ->
  app = angular.module "investor", []

  app.controller("InvestorCtrl", ["$scope", ($scope) ->
    $scope.timesheets = [
      { cost: "295000", value: "450000" },
      { cost: "600000", value: "620000"  },
      { cost: "1000000", value: "900000" },    
    ]
    $scope.calc_cost = ->
      total = 0
      for ts in $scope.timesheets
        total = parseInt(total) + parseInt(ts.cost)
      $scope.total_cost = total
  
    $scope.calc_cost()
  ])

  angular.bootstrap document, ['investor']
