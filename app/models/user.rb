class User < ApplicationRecord
  # Set implicit order so User.last means last created user instead of user with highest ID
  self.implicit_order_column = 'created_at'

  # Automatically add most of Devise's behaviour
  devise :database_authenticatable, :registerable, :confirmable, :trackable,
         :recoverable, :rememberable, :validatable, :omniauthable
end
