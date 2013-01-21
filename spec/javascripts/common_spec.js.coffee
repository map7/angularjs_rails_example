# Ref: http://stackoverflow.com/questions/13013772/how-do-i-test-an-angularjs-service-with-jasmine

beforeEach module('investorService')

describe "foo", ->  
  it "returns 100", inject((Common) ->
    expect(Common.foo()).toBe "100" 
  )

  
  