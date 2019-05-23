class Item < ApplicationRecord
  validates :name,      presence: true, length: { maximum: 255 }
  validates :quantity,  presence: true
  class StoredProcedures
    class << self
      def all
        StoredProcedureService.select(Item, 'item_get_all')
      end
    
      def find(id)
        StoredProcedureService.select(Item, 'item_get_by_id', [id])
      end
    
      def create(params)
        StoredProcedureService.execute(Item, 'item_create', params)
      end
    
      def update(params)
        StoredProcedureService.execute(Item, 'item_update', params)
      end
    
      def destroy(params)
        StoredProcedureService.execute(Item, 'item_delete', [params])
      end
    
      def find_last_created
        StoredProcedureService.select(Item, 'item_get_last_created', [])
      end
    
      def find_last_updated
        StoredProcedureService.select(Item, 'item_get_last_updated', [])
      end
    end
  end
end
