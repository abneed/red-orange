class Item < ApplicationRecord
  validates :name,      presence: true, length: { maximum: 255 }
  validates :quantity,  presence: true
end
