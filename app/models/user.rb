class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
  # Requires to be authenticable against the database, users can register, password should be recoverable, functionality for the app to remember their details and validated as shown in the "VALIDATIONS" section below

  # RELATIONS
  has_many :sell_orders

  # VALIDATIONS - Devise has already set its own validations
  validates :email, presence: true
end
