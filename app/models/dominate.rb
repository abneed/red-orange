class Dominate < ApplicationRecord
  belongs_to :employee
  belongs_to :skill
  validates :employee_id, presence: true
  validates :skill_id, presence: true
  validates :degree_of_dominance, presence: true
  class << self
    def all
      StoredProcedureService.select(Dominate, 'dominate_get_all')
    end
  
    def find(id)
      StoredProcedureService.select(Dominate, 'dominate_get_by_id', [id])
    end
    
    def find_by_employee_id(id)
      StoredProcedureService.select(Dominate, 'dominate_get_by_employee_id', [id])
    end

    def create(params)
      StoredProcedureService.execute(Dominate, 'dominate_create', params)
    end
    
    def update(params)
      StoredProcedureService.execute(Dominate, 'dominate_update', params)
    end
  
    def destroy(params)
      StoredProcedureService.execute(Dominate, 'dominate_delete', [params])
    end
  
    def find_last_created
      StoredProcedureService.select(Dominate, 'dominate_get_last_created', [])
    end
  
    def find_last_updated
      StoredProcedureService.select(Dominate, 'dominate_get_last_updated', [])
    end
  end
end
