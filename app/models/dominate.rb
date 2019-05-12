class Dominate < ApplicationRecord
  belongs_to :employee
  belongs_to :skill
  validates :employee_id, presence: true
  validates :skill_id, presence: true
  validates :degree_of_dominance, presence: true
end
