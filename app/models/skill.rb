class Skill < ApplicationRecord
  has_many :dominates, dependent: :destroy
  has_many :employees, through: :dominates
  class << self
    def all
      StoredProcedureService.select(Skill, 'skill_get_all')
    end
  
    def find(id)
      StoredProcedureService.select(Skill, 'skill_get_by_id', [id])
    end
  
    def create(params)
      StoredProcedureService.execute(Skill, 'skill_create', params)
    end
  
    def update(params)
      StoredProcedureService.execute(Skill, 'skill_update', params)
    end
  
    def destroy(params)
      StoredProcedureService.execute(Skill, 'skill_delete', [params])
    end
  
    def find_last_created
      StoredProcedureService.select(Skill, 'skill_get_last_created', [])
    end
  
    def find_last_updated
      StoredProcedureService.select(Skill, 'skill_get_last_updated', [])
    end

    def average_degree_of_dominance
      StoredProcedureService.select_for_graph('average_degree_of_dominance', [])
    end
  end
end
