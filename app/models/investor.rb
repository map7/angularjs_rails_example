class Investor < ActiveRecord::Base
  attr_accessible :name, :total_cost, :total_value

  has_many :houses
  accepts_nested_attributes_for :houses
end
