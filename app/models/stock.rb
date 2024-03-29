class Stock < ApplicationRecord
  # RELATIONS
  has_many :sell_orders

  # VALIDATIONS
  validates :name, presence: true, length: { minimum:3, maximum:144 }
  validates :symbol, presence: true, length: { minimum:3, maximum:4 }, format: { with: /\A[A-Za-z0-9]+\z/ } # Using REGEX to make sure only alphanumeric values are allowed
  validates :price, presence: true, numericality: { less_than: 500000, greater_than: 0 } # Cannot be more than $500,000 (most expensive stock as of 20-03-2021 is $350,000)

end
