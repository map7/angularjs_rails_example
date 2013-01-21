require 'spec_helper'

describe "Investors" do
  describe "GET /investors" do
    it "displays investors" do
      Investor.create!(name: "Joseph Tramontana")
      visit investors_path
      page.should have_content("Joseph Tramontana")
    end
  end
end
