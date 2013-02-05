class AddPriceToInvestor < ActiveRecord::Migration
  def change
    add_money :investors, :price
  end
end
