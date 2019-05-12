class CreateDominates < ActiveRecord::Migration[5.2]
  def change
    create_table :dominates do |t|
      t.references :employee, foreign_key: true
      t.references :skill, foreign_key: true
      t.integer :degree_of_dominance

      t.timestamps
    end
  end
end
