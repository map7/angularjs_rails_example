describe "foo", ->
  it "returns 100", ->
    $injector = angular.injector(['investorService'])
    commonService = $injector.get('Common')
    expect(commonService.foo()).toBe("100")

