class Sale < ApplicationRecord
  validates_presence_of :buyer, :price, :quantity
end
