class House < ActiveRecord::Base
  attr_accessible :address, :cost, :postcode, :suburb, :value
end
