class ChangeColumnsNameToEmployee < ActiveRecord::Migration[5.2]
  def change
    rename_column :employees, :jobTitle, :job_title
    rename_column :employees, :dateOfHire, :date_of_hire
  end
end
