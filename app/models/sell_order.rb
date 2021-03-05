class SellOrder < ApplicationRecord
  belongs_to :stock
  # belongs_to :seller
  # belongs_to :buyer

  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
end
