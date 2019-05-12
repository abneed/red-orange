class Employee < ApplicationRecord
  has_many :dominates, dependent: :destroy
  has_many :skills, through: :dominates
end
