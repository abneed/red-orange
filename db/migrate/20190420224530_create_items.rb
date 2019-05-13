class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name,         null: false, default: ""  
      t.string  :description,  null: false, default: ""
      t.integer :quantity,     null: false, default: 0

      t.timestamps
    end
    
    # add_index :items, :name,  unique: true
  end
end
