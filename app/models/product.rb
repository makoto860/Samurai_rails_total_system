class Product < ApplicationRecord
  has_many :reservations
  def reservations_new
    reservations.new
  end
end
