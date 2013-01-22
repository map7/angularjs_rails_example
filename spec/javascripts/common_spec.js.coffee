# Ref: http://stackoverflow.com/questions/13013772/how-do-i-test-an-angularjs-service-with-jasmine

beforeEach ->
  module('investor')  
  module('investorService')

describe "foo", ->  
  it "returns 100", inject((Common) ->
    expect(Common.foo()).toBe "100" 
  )

describe "total", ->
  beforeEach ->
    @investor = {houses_attributes: [
      {address: '5 King Street', suburb: "Melbourne", postcode: "3000", cost: 3, value: 4},
      {address: '60 William Street', suburb: "Melbourne", postcode: "3000", cost: 2, value: 5}
    ]}
    @house = @investor['houses_attributes'][0]
  
  describe "when both houses have costs & values", ->
    it "should total cost to 5", inject((Common) ->
      Common.total(@investor)
      expect(@investor['total_cost']).toBe 5
    )

    it "should total value to 9", inject((Common) ->
      Common.total(@investor)
      expect(@investor['total_value']).toBe 9
    )
  
describe "destroy_house", ->
  beforeEach ->
    @investor = {houses_attributes: [
      {address: '5 King Street', suburb: "Melbourne", postcode: "3000"},
      {address: '60 William Street', suburb: "Melbourne", postcode: "3000", cost: 2}
    ]}
    @house = @investor['houses_attributes'][0]
  
  it "can access house", inject((Common) ->
    expect(@house['suburb']).toBe 'Melbourne'
  )

  describe "When _destroy is nil", ->
    it "sets house destroy to one", inject((Common) ->
      Common.destroy_house(@investor, @house)
      expect(@house['_destroy']).toBe '1'
    )
  
  describe "when cost not nil", ->
    it "keeps it's value", inject((Common) ->
      @house['cost'] = 5
      Common.destroy_house(@investor, @house)
      expect(@house['cost']).toBe 5
    )

  describe "when cost is nil", ->
    it "sets cost to zero", inject((Common) ->
      Common.destroy_house(@investor, @house)
      expect(@house['cost']).toBe 0
    )  

  describe "when value not nil", ->
    it "keeps it's value", inject((Common) ->
      @house['value'] = 5
      Common.destroy_house(@investor, @house)
      expect(@house['value']).toBe 5
    )

  describe "when value is nil", ->
    it "sets value to zero", inject((Common) ->
      Common.destroy_house(@investor, @house)
      expect(@house['value']).toBe 0
    )

  describe "when total cost is 5 and house with cost 3 is deleted", ->
    beforeEach ->
      @house['cost'] = 3

    it "updates total cost to 2", inject((Common) ->
      Common.destroy_house(@investor, @house)
      expect(@investor['total_cost']).toBe 2
    )

describe "restore_house", ->
  beforeEach ->
    @investor = {houses_attributes: [
      {address: '5 King Street', suburb: "Melbourne", postcode: "3000", cost: 3, _destroy: '1'},
      {address: '60 William Street', suburb: "Melbourne", postcode: "3000", cost: 2}
    ]}
    @house = @investor['houses_attributes'][0]

  it "should total 2", inject((Common) ->
    Common.total(@investor)
    expect(@investor['total_cost']).toBe 2
  )
  
  describe "When _destroy is 1", ->
    it "sets house destroy to 0", inject((Common) ->
      Common.restore_house(@investor, @house)
      expect(@house['_destroy']).toBe '0'
    )
  
    it "recalculates total", inject((Common) ->
      Common.restore_house(@investor, @house)
      expect(@investor['total_cost']).toBe 5
    )