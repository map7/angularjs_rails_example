class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :address
      t.string :suburb
      t.string :postcode
      t.integer :cost
      t.integer :value

      t.timestamps
    end
  end
end
