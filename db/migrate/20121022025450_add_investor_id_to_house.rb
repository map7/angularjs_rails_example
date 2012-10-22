class AddInvestorIdToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :investor_id, :integer
  end
end
