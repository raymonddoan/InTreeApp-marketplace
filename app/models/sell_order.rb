class SellOrder < ApplicationRecord

  # RELATIONS
  belongs_to :stock
  belongs_to :seller, class_name: "User", foreign_key: "user_id"
  belongs_to :buyer, class_name: "User", foreign_key: "user_id", optional: true # buyer is optional since there can be orders that have not been filled

end
