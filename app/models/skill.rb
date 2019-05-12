class Skill < ApplicationRecord
  has_many :dominates, dependent: :destroy
  has_many :employees, through: :dominates
end
