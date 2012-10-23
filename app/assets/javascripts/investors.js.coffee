$ (event) ->
  app = angular.module "investor", []

  app.controller("InvestorCtrl", ["$scope", ($scope) ->
    $scope.houses = [
      { cost: "295000", value: "450000" },
      { cost: "600000", value: "620000"  },
      { cost: "1000000", value: "900000" },    
    ]
    $scope.calc_totals = ->
      # Initialise variables
      cost = 0
      value = 0

      # Go through each house and calculate the total cost
      for ts in $scope.houses
        cost = parseInt(cost) + parseInt(ts.cost)
        value = parseInt(value) + parseInt(ts.value)

      # Set the total
      $scope.total_cost = cost
      $scope.total_value = value  

    # Run the calculation at the start  
    $scope.calc_totals()
  ])

  angular.bootstrap document, ['investor']
