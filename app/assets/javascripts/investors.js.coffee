
  # Setup the module & route
  angular.module("investor", ['investorService'])
    .config(['$routeProvider', ($provider) ->
      $provider
        .when('/investors/new', {templateUrl: '/investors/new.html', controller: 'InvestorNewCtrl'})
        .when('/investors/:investor_id', {templateUrl: '/investors/show.html', controller: 'InvestorCtrl'})
        .when('/investors/:investor_id/edit', {templateUrl: '/investors/edit.html', controller: 'InvestorEditCtrl'})
    ])
    .config(["$httpProvider", (provider) ->
      provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
    ])

  angular.module('investorService', ['ngResource'])
    # NOTE: Each factory name must be unique
    .factory('Investors', ($resource) ->
      return $resource('/investors.json', {}, {
        index: {method: 'GET', isArray: true},
        create: {method: 'POST'}
      })
    )
    .factory('Investor', ($resource) ->
      return $resource('/investors/:investor_id.json', {}, {
        show: {method: 'GET'},
        update: {method: 'PUT'}
      })
    )
    .factory('Sum', ($window) ->
      return {
        total : (investor) ->
          console.log "calc_totals"
          # Initialise variables
          cost = 0
          value = 0

          # Go through each house and calculate the total cost
          for h in investor.houses_attributes
            # The cost || 0 syntax checks if cost is a NaN and will convert it to a number
            cost = parseInt(cost || 0) + parseInt(h.cost || 0)
            value = parseInt(value || 0) + parseInt(h.value || 0)

          # Set the total
          investor.total_cost = cost
          investor.total_value = value           
      }
    )
 
  
  angular.bootstrap document, ['investor']  
        
