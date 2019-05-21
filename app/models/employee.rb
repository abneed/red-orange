class Employee < ApplicationRecord
  has_many :dominates, dependent: :destroy
  has_many :skills, through: :dominates
  class StoredProcedures
    class << self
      def all
        StoredProcedureService.select(Employee, 'employee_get_all')
      end
    
      def find(id)
        StoredProcedureService.select(Employee, 'employee_get_by_id', [id])
      end
    
      def create(params)
        StoredProcedureService.execute(Employee, 'employee_create', params)
      end
    
      def update(params)
        StoredProcedureService.execute(Employee, 'employee_update', params)
      end
    
      def destroy(params)
        StoredProcedureService.execute(Employee, 'employee_delete', [params])
      end
    
      def find_last_created
        StoredProcedureService.select(Employee, 'employee_get_last_created', [])
      end
    
      def find_last_updated
        StoredProcedureService.select(Employee, 'employee_get_last_updated', [])
      end
    end
  end
end
