class Reservation < ApplicationRecord
  belongs_to :product
  belongs_to :user

  def sum_of_price
    (product.price * total_quantity).to_i
  end
end
