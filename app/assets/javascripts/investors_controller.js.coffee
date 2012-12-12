window.InvestorsCtrl = ($scope) ->
  $scope.houses = [
    cost: "395000"
    value: "450000"
  ,
    cost: "600000"
    value: "620000"
  ]
  $scope.calc_totals = ->
    # Initialise variables
    cost = 0
    value = 0

    # Go through each house and calculate the total cost
    for h in $scope.houses
      cost = parseInt(cost) + parseInt(h.cost)
      value = parseInt(value) + parseInt(h.value)

    # Set the total
    $scope.total_cost = cost
    $scope.total_value = value  

  # Run the calculation at the start  
  $scope.calc_totals()
  

  # angular.bootstrap document, ['investor']
