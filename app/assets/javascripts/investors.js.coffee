$ (event) ->
  app = angular.module "investor", []

  app.controller("InvestorCtrl", ["$scope", ($scope) ->
    $scope.houses = [
      { cost: "295000", value: "450000" },
      { cost: "600000", value: "620000"  },
      { cost: "1000000", value: "900000" },    
    ]
    $scope.calc_totals = ->
      total = 0

      # Go through each house and calculate the total cost
      for ts in $scope.houses
        total = parseInt(total) + parseInt(ts.cost)

      # Set the total
      $scope.total_cost = total

    # Run the calculation at the start  
    $scope.calc_totals()
  ])

  angular.bootstrap document, ['investor']
