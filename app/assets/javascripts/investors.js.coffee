
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
    .factory('Investors', ($resource) ->
      return $resource('/investors.json', {}, {
        index: {method: 'GET', isArray: true},
        create: {method: 'POST'}
      })
    )
    .factory('Investor', ($resource) ->
      return $resource('/investors/:investor_id.json', {}, {
        show: {method: 'GET'},
        edit: {method: 'GET'},    
        update: {method: 'PUT'}
      })
    )

  angular.bootstrap document, ['investor']  
        
