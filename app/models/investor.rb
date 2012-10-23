class Investor < ActiveRecord::Base
  attr_accessible :name, :total_cost, :total_value, :houses_attributes

  has_many :houses
  accepts_nested_attributes_for :houses
end
