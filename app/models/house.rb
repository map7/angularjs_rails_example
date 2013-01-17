class House < ActiveRecord::Base
  attr_accessible :address, :cost, :postcode, :suburb, :value, :investor_id
  
  belongs_to :investor
end
