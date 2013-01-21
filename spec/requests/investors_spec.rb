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
      fill_in "Name", with: "Amanda Powell"
      fill_in "house_1_cost", with: "200000"
      fill_in "house_1_value", with: "240000"
      fill_in "house_2_cost", with: "700000"
      fill_in "house_2_value", with: "680000"
      click_button "Create Investor"
      page.should have_content("Amanda Powell")
    end
  end
end
