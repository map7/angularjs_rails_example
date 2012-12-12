window.InvestorNewCtrl = ($scope, $location, Investors, Investor) ->
  console.log('InvestorNewCtrl')

  $scope.investor = {}

  $scope.create = (investor) ->
    i = new Investor(investor)
    i.$create( (investor) ->
      $location.path('/investors/' + investor.id)
    )
    
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
  



window.InvestorCtrl = ($scope, $routeParams, Investor) ->
  console.log 'InvestorCtrl'
  investor_id = $routeParams.investor_id
  $scope.investor = Investor.show({investor_id: investor_id})

window.InvestorEditCtrl = ($scope, $routeParams, $location, Investor) ->
  console.log 'InvestorEditCtrl'
  $scope.master = {}
  investor_id = $routeParams.investor_id

  $scope.investor = new Investor.show({investor_id: investor_id}, (resource) ->
    $scope.master = angular.copy(resource)
  )

  $scope.update = (investor) ->
    $scope.master = angular.copy(investor)
    investor.$update({investor_id: investor_id}, (t) ->
      $location.path('/investors/' + t.id)
    )

  $scope.reset = () ->
    $scope.investor = angular.copy($scope.master)