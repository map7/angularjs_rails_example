class Investor < ActiveRecord::Base
  attr_accessible :name, :total_cost, :total_value, :houses_attributes

  has_many :houses
  accepts_nested_attributes_for :houses

  def as_json(options={})
    json = super(options)
    json[:houses_attributes] = []

    self.houses.each do |house|
      json[:houses_attributes] << {
        id: house.id,
        address: house.address,
        suburb: house.suburb,
        postcode: house.postcode,
        cost: house.cost,
        value: house.value}
    end
    json
  end
end
