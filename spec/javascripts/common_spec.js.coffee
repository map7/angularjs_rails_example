describe "foo", ->
  it "returns 100", ->
    common = new Common
    expect(common.foo()).toBe("100")