require 'spec_helper'

describe "Investors" do
  describe "GET /investors" do
    it "displays investors" do
      Investor.create!(name: "Joseph Tramontana")
      visit investors_path
      page.should have_content("Joseph Tramontana")
    end
  end
  
  describe "POST /investors", js: true do
    it "creates an investor" do
      visit angular_investors_path + "#" + new_investor_path
      fill_in "Name", :with => "Amanda Powell"
      click_button "Create Investor"
      page.should have_content("Amanda Powell")
    end
  end
end
