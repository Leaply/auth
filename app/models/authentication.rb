class Authentication < ApplicationRecord
  # Set implicit order so self.last means last created instead of highest ID
  self.implicit_order_column = 'created_at'

  belongs_to :user
end