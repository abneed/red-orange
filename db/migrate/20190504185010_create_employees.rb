class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :jobTitle
      t.string :subsidiary
      t.string :department
      t.string :currency
      t.string :phone
      t.date :dateOfHire

      t.timestamps
    end
  end
end
