class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # RELATIONS
  has_many :sell_orders

  # VALIDATIONS - Devise has already set its own validations
  validates :email, presence: true
end
