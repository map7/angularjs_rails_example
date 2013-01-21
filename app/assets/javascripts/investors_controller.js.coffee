
# Investor new form
window.InvestorNewCtrl = ($scope, $location, Investors, Investor, Common) ->
  console.log('InvestorNewCtrl')

  # Setup variable for common services(factory)
  $scope.common = Common

  # Setup the defaults, eg:
  $scope.investor = {houses_attributes: [
    {address: '5 King Street', suburb: "Melbourne", postcode: "3000"},
    {address: '60 William Street', suburb: "Melbourne", postcode: "3000"}
  ]} 

  # Create a public create function
  $scope.create = (investor) ->
    console.log 'enter create function'

    # Create a new investors object 
    i = new Investors(investor)
    i.$create( (investor) ->
      $location.path('/investors/' + investor.id)
    )

# Show Investor
window.InvestorCtrl = ($scope, $routeParams, Investor) ->
  console.log 'InvestorCtrl'
  investor_id = $routeParams.investor_id
  $scope.investor = Investor.show({investor_id: investor_id})

# Edit Investor
window.InvestorEditCtrl = ($scope, $routeParams, $location, Investor, Common) ->
  console.log 'InvestorEditCtrl'

  # Setup variable for common services(factory)
  $scope.common = Common

  $scope.master = {}
  investor_id = $routeParams.investor_id

  # Get the investor information & assign it to the scope
  console.log 'Get JSON'
  $scope.investor = new Investor.show({investor_id: investor_id}, (resource) ->
    # copy the response from server to the scopes master
    $scope.master = angular.copy(resource)
    $scope.common.total($scope.investor) # Sum of totals
  )
    
  $scope.update = (investor) ->
    $scope.master = angular.copy(investor)
    investor.$update({investor_id: investor_id}, (t) ->
      $location.path('/investors/' + t.id)
    )


  $scope.reset = ->
    console.log 'reset'
    $scope.investor = angular.copy($scope.master)
  