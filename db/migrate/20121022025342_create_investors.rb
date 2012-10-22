class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors do |t|
      t.string :name
      t.integer :total_cost
      t.integer :total_value

      t.timestamps
    end
  end
end
