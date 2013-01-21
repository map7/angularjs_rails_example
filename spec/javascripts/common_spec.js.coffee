# Ref: http://stackoverflow.com/questions/13013772/how-do-i-test-an-angularjs-service-with-jasmine

describe "foo", ->
  it "returns 100", ->
    $injector = angular.injector(['investorService'])
    commonService = $injector.get('Common')
    expect(commonService.foo()).toBe("100")

