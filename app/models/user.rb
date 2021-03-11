class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sell_orders #, class_name: "SellOrder", foreign_key: "seller_id"
  # has_many :sell_orders, class_name: "SellOrder", foreign_key: "buyer_id"

end
