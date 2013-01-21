require 'spec_helper'

describe "Investors" do
  describe "GET /investors" do
    it "displays investors" do
      Investor.create!(name: "Joseph Tramontana")
      get investors_path
      response.body.should include("Joseph Tramontana")
    end
  end
end
