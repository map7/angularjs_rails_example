
# Investor new form
window.InvestorNewCtrl = ($scope, $location, Investors, Investor) ->
  console.log('InvestorNewCtrl')

  # Setup the defaults, eg:
  $scope.investor = {houses_attributes: [
    {address: '5 King Street', suburb: "Melbourne", postcode: "3000"},
    {address: '60 William Street', suburb: "Melbourne", postcode: "3000"}
  ]} 

  # Get the investor information & assign it to the scope
  console.log 'Get JSON'

  # $scope.investor = new Investors.new((resource) ->
  #   $scope.master = angular.copy(resource)
  # )

  # Create a public create function
  $scope.create = (investor) ->
    console.log 'enter create function'

    # Create a new investors object 
    i = new Investors(investor)
    i.$create( (investor) ->
      $location.path('/investors/' + investor.id)
    )

  # Loading houses information
  # Later we will get this from the server via JSON.    
  $scope.houses = [
    cost: "395000"
    value: "450000"
  ,
    cost: "600000"
    value: "620000"
  ]

  # Calculation method
  $scope.calc_totals = ->
    console.log "calc_totals"
    # Initialise variables
    cost = 0
    value = 0

    # Go through each house and calculate the total cost
    for h in $scope.investor.houses_attributes
      # The cost || 0 syntax checks if cost is a NaN and will convert it to a number
      cost = parseInt(cost || 0) + parseInt(h.cost || 0)
      value = parseInt(value || 0) + parseInt(h.value || 0)

    # Set the total
    $scope.investor.total_cost = cost
    $scope.investor.total_value = value  

  # Run the calculation at the start  
  $scope.calc_totals()
  

# Show Investor
window.InvestorCtrl = ($scope, $routeParams, Investor) ->
  console.log 'InvestorCtrl'
  investor_id = $routeParams.investor_id
  $scope.investor = Investor.show({investor_id: investor_id})

# Edit Investor
window.InvestorEditCtrl = ($scope, $routeParams, $location, Investor) ->
  console.log 'InvestorEditCtrl'

  $scope.master = {}
  investor_id = $routeParams.investor_id

  # Get the investor information & assign it to the scope
  console.log 'Get JSON'
  $scope.investor = new Investor.show({investor_id: investor_id}, (resource) ->
    $scope.master = angular.copy(resource)
  )

  $scope.update = (investor) ->
    $scope.master = angular.copy(investor)
    investor.$update({investor_id: investor_id}, (t) ->
      $location.path('/investors/' + t.id)
    )


  $scope.reset = ->
    console.log 'reset'
    $scope.investor = angular.copy($scope.master)

  